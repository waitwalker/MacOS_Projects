//
//  MiddleContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import Alamofire

// 重用id
extension NSUserInterfaceItemIdentifier {
    // 中间聊天详情
    static let reusedMiddleChatDetailItemId = NSUserInterfaceItemIdentifier(rawValue: "reusedMiddleChatDetailItemId")
    static let reusedMiddleColumnId = NSUserInterfaceItemIdentifier(rawValue: "reusedMiddleColumnId")
    
    // 底部
    static let reusedBottomItemId = NSUserInterfaceItemIdentifier(rawValue: "reusedBottomItemId")
}

/*
 * name: MiddleContainerView
 * description: 中间聊天详情视图容器
 * author: waitwalker
 * date: 4.27
 */
class MiddleContainerView: NSView {

    // 分割线
    var leftBorder: NSView!
    var rightBorder: NSView!
    
    // 上部
    var topContainerView: NSView!
    var nameLabel: NSTextField!
    var addGroupUserButton: NSButton!
    var foldButton: NSButton!
    
    // 中间聊天列表展示
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    var chatDetailModel: ChatDetailListModel = ChatDetailListModel()
    
    // 底部表情等展示列表
    var bottomContainerView: NSView!
    var containerScrollView: NSScrollView!
    var bottomCollectionView: NSCollectionView!
    var dataSource:[[String:String]] = []
    
    
    // 聊天输入框
    var inputTextView: NSTextView!
    
    
    

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
        setupDataSource()
        setupCollectionViewDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     * name: setupSubviews
     * description: 初始化子控件
     * author: waitwalker
     * date: 4.27
     */
    private func setupSubviews() -> Void {
        // 分割线
        leftBorder = NSView(frame: NSRect(x: 0, y: 0, width: 0.5, height: self.frame.height))
        leftBorder.wantsLayer = true
        leftBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(leftBorder)
        
        rightBorder = NSView(frame: NSRect(x: self.frame.width - 1, y: 0, width: 0.5, height: self.frame.height))
        rightBorder.wantsLayer = true
        rightBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(rightBorder)
        
        // 上部
        topContainerView = NSView(frame: NSRect(x: 2, y: 600, width: self.frame.width - 4, height: 60))
        
        let shadow = NSShadow()
        shadow.shadowColor = NSColor.black
        shadow.shadowOffset = CGSize(width: 1, height: -1)
        topContainerView.shadow = shadow
        topContainerView.wantsLayer = true
        topContainerView.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(topContainerView)
        
        nameLabel = NSTextField(frame: NSRect(x: 10, y: 10, width: 150, height: 40))
        nameLabel.stringValue = "python && Golang"
        nameLabel.isEditable = false
        nameLabel.textColor = NSColor.black
        nameLabel.backgroundColor = NSColor.white
        nameLabel.font = NSFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.isBordered = false
        nameLabel.isBezeled = false
        topContainerView.addSubview(nameLabel)
        
        foldButton = NSButton(image: NSImage(named: "chat_detail_folder")!, target: self, action: #selector(foldButtonAction))
        foldButton.frame = NSRect(x: self.frame.width - 50, y: 10, width: 24, height: 24)
        foldButton.imageScaling = .scaleAxesIndependently
        foldButton.wantsLayer = true
        foldButton.layer?.backgroundColor = NSColor.clear.cgColor
        foldButton.layer?.borderColor = NSColor.clear.cgColor
        foldButton.isBordered = false
        foldButton.bezelStyle = .circular
        topContainerView.addSubview(foldButton)
        
        addGroupUserButton = NSButton(image: NSImage(named: "chat_detail_add_user")!, target: self, action: #selector(addGroupUserButtonAction))
        addGroupUserButton.frame = NSRect(x: self.frame.width - 85, y: 13, width: 20, height: 20)
        addGroupUserButton.imageScaling = .scaleAxesIndependently
        addGroupUserButton.wantsLayer = true
        addGroupUserButton.layer?.backgroundColor = NSColor.clear.cgColor
        addGroupUserButton.layer?.borderColor = NSColor.clear.cgColor
        addGroupUserButton.isBordered = false
        addGroupUserButton.bezelStyle = .circular
        topContainerView.addSubview(addGroupUserButton)
        
        // 中间聊天详情
        scrollView = NSScrollView(frame: NSRect(x: 2, y: 200, width: self.frame.width - 4, height: 400))
        scrollView.hasHorizontalScroller = false
        scrollView.hasVerticalScroller = true
        self.addSubview(scrollView)
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.reusedMiddleColumnId)
        column.title = "最近聊天"
        column.width = self.frame.width
        tableView = NSTableView(frame: scrollView.bounds)
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = NSColor.white
        // 去掉header
        tableView.headerView = nil
        scrollView.documentView = tableView
        tableView.reloadData()
        
        // 底部
        bottomContainerView = NSView(frame: NSRect(x: 2, y: 150, width: self.frame.width - 4, height: 60))
        bottomContainerView.wantsLayer = true
        bottomContainerView.layer?.backgroundColor = NSColor.red.cgColor
        self.addSubview(bottomContainerView)
        
        containerScrollView = NSScrollView(frame: bottomContainerView.bounds)
        containerScrollView.backgroundColor = NSColor.yellow
        bottomContainerView.addSubview(containerScrollView)
        
        let flowLayOut = NSCollectionViewFlowLayout()
        //flowLayOut.itemSize = CGSize(width: 40, height: 40)
        flowLayOut.minimumLineSpacing = 10
        flowLayOut.minimumInteritemSpacing = 10
        flowLayOut.scrollDirection = .horizontal
        bottomCollectionView = NSCollectionView(frame: containerScrollView.bounds)
        bottomCollectionView.backgroundColors = [NSColor.white]
        bottomCollectionView.collectionViewLayout = flowLayOut
        containerScrollView.documentView = bottomCollectionView
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.register(CollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier.reusedBottomItemId)
        
        // 聊天输入框
        inputTextView = NSTextView(frame: NSRect(x: 2, y: 0, width: self.bounds.width - 4, height: 150))
        //inputTextView.backgroundColor = NSColor.cyan
        inputTextView.textColor = NSColor.brown
        inputTextView.font = NSFont.systemFont(ofSize: 20)
        inputTextView.delegate = self
        self.addSubview(inputTextView)
    }
    
    // 聊天文件按钮回调
    @objc func foldButtonAction() -> Void {
        
    }
    
    // 想群中添加新的聊天成员回调
    @objc func addGroupUserButtonAction() -> Void {
        
    }
    
    /*
     * name: setupDataSource
     * description: 加载数据源
     * author: waitwalker
     * date: 4.27
     */
    private func setupDataSource() -> Void {
        AF.request("http://0.0.0.0:7300/mock/5ea0f178bf88582b7376c7a3/api/chatDetailList#!method=get", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil
            , requestModifier: nil).responseJSON { (response) in
                print("response:\(response)")
                switch response.result {
                case .success(let json):
                    print("json:\(json)")
                    self.chatDetailModel = ChatDetailListModel.deserialize(from: (json as! Dictionary))!
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("recent chat list error:\(error)")
                    break
                }
        }
    }
    
    // 设置collection view 数据源
    private func setupCollectionViewDataSource() -> Void {
        dataSource = [
            ["image":"bottom_emoji"],
            ["image":"bottom_screenshot"],
            ["image":"bottom_folder"],
            ["image":"bottom_office"],
            ["image":"bottom_phone"],
            ["image":"bottom_time"],
            ["image":"bottom_message"],
            ["image":"bottom_font"],
        ]
        self.bottomCollectionView.reloadData()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}

/*
* name:
* description: table view delegate && datasource
* author: waitwalker
* date: 4.27
*/
extension MiddleContainerView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return chatDetailModel.data == nil ? 0 : (chatDetailModel.data?.count)!
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.reusedMiddleChatDetailItemId, owner: self)
        if cell == nil {
            cell = ChatDetailCell(frame: NSRect(x: 0, y: 0, width:900, height: 60))
            cell!.identifier = NSUserInterfaceItemIdentifier.reusedMiddleChatDetailItemId
        }
        (cell as! ChatDetailCell).currentData = chatDetailModel.data?[row]
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let currentModel = chatDetailModel.data![row]
        return currentModel.cell_height
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return ChatDetailTableRowView()
    }
    
}

/*
 * name:
 * description: collection view delegate && datasource
 * author: waitwalker
 * date: 4.27
 */
extension MiddleContainerView: NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout, CollectionViewItemDelegate {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.reusedBottomItemId, for: indexPath) as! CollectionViewItem
        item.currentIndexPath = indexPath
        item.currentDataSource = dataSource[indexPath.item]
        item.delegate = self
        return item
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 30, height: 30)
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print("select current item:\(indexPaths)")
    }
    
    func didSelect(_ indexPath: IndexPath?) {
        print("current indexPath:\(indexPath)")
        switch indexPath?.item {
        case 0:
            print("点击的是:\(indexPath?.item)")
            break
        case 1:
            print("点击的是:\(indexPath?.item)")
            break
        case 2:
            print("点击的是:\(indexPath?.item)")
            break
        case 3:
            print("点击的是:\(indexPath?.item)")
            break
        case 4:
            print("点击的是:\(indexPath?.item)")
            break
        case 5:
            print("点击的是:\(indexPath?.item)")
            break
        case 6:
            print("点击的是:\(indexPath?.item)")
            break
        case 7:
            print("点击的是:\(indexPath?.item)")
            break
        
        default:
            break
        }
    }
}

/*
 * name:
 * description: 输入框回调 delegate
 * author: waitwalker
 * date: 4.27
 */
extension MiddleContainerView: NSTextViewDelegate {
    func textDidBeginEditing(_ notification: Notification) {
        
    }
}

/*
* name: ChatDetailCell
* description: 聊天详情table cell
* author: waitwalker
* date: 4.27
*/
class ChatDetailCell: NSView{
    
    var headerImageView: NSImageView!
    var nameLabel: NSTextField!
    var messageContentView: BubbleView!
    var mesageLabel: NSTextField!
    var messageImageView: NSImageView!
    
    
    
    var currentData: ChatDetailItemModel? {
        didSet {
            if let currentModel = currentData {
                layoutMessageContent(userType: currentModel.user_type, messageContentHeight: currentModel.measage_height)
                setupMessageValue(currentModel: currentModel)
            }
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    private func layoutMessageContent(userType: Int, messageContentHeight: CGFloat) -> Void {
        
        headerImageView = NSImageView()
        headerImageView.image = NSImage(named: "add_new_chat")
        headerImageView.wantsLayer = true
        headerImageView.layer?.cornerRadius = 15
        self.addSubview(headerImageView)
        
        nameLabel = NSTextField()
        nameLabel.isEditable = false
        nameLabel.textColor = NSColor.black
        nameLabel.backgroundColor = NSColor.clear
        nameLabel.font = NSFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.isBordered = false
        nameLabel.isBezeled = false
        nameLabel.font = NSFont.systemFont(ofSize: 13)
        nameLabel.backgroundColor = NSColor.clear
        self.addSubview(nameLabel)
        
        let position: UInt = userType == 1 ? 1 : 3
        messageContentView = BubbleView(frame: NSRect.zero, position: position)
        self.addSubview(messageContentView)
        
        mesageLabel = NSTextField()
        mesageLabel.isEditable = false
        mesageLabel.textColor = NSColor.black
        mesageLabel.backgroundColor = NSColor.clear
        mesageLabel.maximumNumberOfLines = 0
        mesageLabel.isBordered = false
        mesageLabel.isBezeled = false
        mesageLabel.sizeToFit()
        mesageLabel.font = NSFont.systemFont(ofSize: 16)
        messageContentView.addSubview(mesageLabel)
        
        messageImageView = NSImageView()
        messageImageView.imageScaling = .scaleAxesIndependently
        messageContentView.addSubview(messageImageView)
        
        if position == 1 {
            headerImageView.snp.makeConstraints { (make) in
                make.left.equalTo(15)
                make.height.width.equalTo(30)
                make.top.equalTo(20)
            }
            
            nameLabel.snp.makeConstraints { (make) in
                make.left.equalTo(headerImageView.snp.right)
                make.top.equalTo(headerImageView.snp.top).offset(-10)
            }
            
            messageContentView.snp.makeConstraints { (make) in
                make.left.equalTo(headerImageView.snp.right)
                make.top.equalTo(nameLabel.snp.bottom)
                make.width.equalTo(300)
                make.height.equalTo(messageContentHeight)
            }

            mesageLabel.snp.makeConstraints { (make) in
                make.left.equalTo(messageContentView.snp.left).offset(20)
                make.top.equalTo(20)
                make.bottom.right.equalTo(-10)
            }
            
            messageImageView.snp.makeConstraints { (make) in
                make.left.equalTo(messageContentView.snp.left).offset(20)
                make.top.equalTo(messageContentView.snp.top).offset(10)
                make.bottom.right.equalTo(-10)
            }
        } else {
            headerImageView.snp.makeConstraints { (make) in
                make.right.equalTo(-15)
                make.height.width.equalTo(30)
                make.top.equalTo(20)
            }
            
            nameLabel.snp.makeConstraints { (make) in
                make.right.equalTo(headerImageView.snp.left)
                make.bottom.equalTo(headerImageView.snp.top).offset(10)
            }
            
            messageContentView.snp.makeConstraints { (make) in
                make.right.equalTo(nameLabel.snp.left)
                make.top.equalTo(10)
                make.width.equalTo(300)
                make.height.equalTo(messageContentHeight)
            }
            
            mesageLabel.snp.makeConstraints { (make) in
                make.left.equalTo(messageContentView.snp.left).offset(10)
                make.top.equalTo(20)
                make.bottom.right.equalTo(-10)
            }
            
            messageImageView.snp.makeConstraints { (make) in
                make.left.equalTo(messageContentView.snp.left).offset(10)
                make.top.equalTo(messageContentView.snp.top).offset(20)
                make.bottom.right.equalTo(-10)
            }
        }
    }
    
    private func setupMessageValue(currentModel: ChatDetailItemModel) -> Void {

        headerImageView.image = NSImage(named: currentModel.header)
        
        if currentModel.message_type == 1 {
            mesageLabel.isHidden = false
            messageImageView.isHidden = true
            mesageLabel.stringValue = currentModel.last_message
        } else {
            mesageLabel.isHidden = true
            messageImageView.isHidden = false
            messageImageView.image = NSImage(named: currentModel.last_message)
        }
        
        if currentModel.user_type == 1 {
            nameLabel.stringValue = currentModel.user_name
            nameLabel.alignment = NSTextAlignment.left
        } else {
            nameLabel.stringValue = "我"
            nameLabel.alignment = NSTextAlignment.right
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/*
 * name: TableRowView
 * description: cell 选中背景色重写
 * author: waitwalker
 * date: 4.24
 */
class ChatDetailTableRowView: NSTableRowView {
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectRect = NSInsetRect(self.bounds, 0, 0)
            NSColor.clear.setFill()
            let selectionPath = NSBezierPath(roundedRect: selectRect, xRadius: 0, yRadius: 0)
            selectionPath.fill()
        }
    }
}
