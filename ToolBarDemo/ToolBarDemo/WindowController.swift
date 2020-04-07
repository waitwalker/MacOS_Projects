//
//  WindowController.swift
//  ToolBarDemo
//
//  Created by etiantian on 2020/4/7.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

extension NSToolbar.Identifier {
    static let AppToolBar: NSToolbar.Identifier = NSToolbar.Identifier("AppToolBar")
}

extension NSToolbarItem.Identifier {
    static let FontSetting: NSToolbarItem.Identifier = NSToolbarItem.Identifier("FontSetting")
    static let Save: NSToolbarItem.Identifier = NSToolbarItem.Identifier("Save")
}

extension NSImage.Name {
    static let FontSetting: NSImage.Name = NSImage.Name("FontSetting")
    static let Save: NSImage.Name = NSImage.Name("Save")
}

class WindowController: NSWindowController {

    @IBOutlet weak var toolBar: NSToolbar!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.window?.titleVisibility = .hidden
        
    }
    
    func setupToolBar() -> Void {
        let toolBar = NSToolbar(identifier: NSToolbar.Identifier.AppToolBar)
        toolBar.allowsUserCustomization = false
        toolBar.allowsExtensionItems = false
        toolBar.displayMode = .iconAndLabel
        toolBar.delegate = self
        self.window?.toolbar = toolBar
        
    }
    
    @IBAction func searchAction(_ sender: NSToolbarItem) {
        print("search clicked")
    }
    
    @IBAction func colorAction(_ sender: Any) {
        print("color click")
    }
    
    
}

extension WindowController: NSToolbarDelegate {
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier.FontSetting,NSToolbarItem.Identifier.Save]
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier.FontSetting,NSToolbarItem.Identifier.Save]
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let toolBarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
        if itemIdentifier == NSToolbarItem.Identifier.FontSetting {
            toolBarItem.label = "Fontt"
            toolBarItem.paletteLabel = "Fonttt"
            toolBarItem.toolTip = "Fontttt"
            toolBarItem.image = NSImage(named: NSImage.Name.FontSetting)
            toolBarItem.tag = 1
        }
        
        if itemIdentifier == NSToolbarItem.Identifier.Save {
            toolBarItem.label = "Savet"
            toolBarItem.paletteLabel = "Savett"
            toolBarItem.toolTip = "Savettt"
            toolBarItem.image = NSImage(named: NSImage.Name.Save)
            toolBarItem.tag = 2
        }
        
        toolBarItem.minSize = NSSize(width: 25, height: 25)
        toolBarItem.maxSize = NSSize(width: 125, height: 125)
        
        return toolBarItem
    }
}
