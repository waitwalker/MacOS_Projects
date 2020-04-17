//
//  ViewController.swift
//  UndoDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textFieldOne: NSTextField!
    @IBOutlet weak var textFieldTwo: NSTextField!
    @IBOutlet weak var textFieldThree: NSTextField!
    
    lazy var viewUndoManager: UndoManager = {
        let undo = UndoManager()
        return undo
    }()
    
    var para1: NSInteger = 0
    var para2: NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.compute(para1: 1, para2: 2)
    }
    
    
    @IBAction func computeAction(_ sender: NSButton) {
        let pa1 = self.textFieldOne.integerValue
        let pa2 = self.textFieldTwo.integerValue
        self.compute(para1: pa1, para2: pa2)
        
    }
    
    
    @IBAction func undoAction(_ sender: NSButton) {
        self.viewUndoManager.undo()
    }
    
    
    @IBAction func redoAction(_ sender: NSButton) {
        self.viewUndoManager.redo()
    }
    
    func compute(para1 firstPara: NSInteger, para2 secondPara: NSInteger) -> Void {
        let p1 = self.para1
        let p2 = self.para2
        if self.para1 == firstPara && self.para2 == secondPara {
            
        } else {
            // 注册undo操作
            self.viewUndoManager.comptableRegisterUndo(withTarget: self) { (target) in
                
                target.compute(para1: p1, para2: p2)
                let actionName = "\(firstPara)+\(secondPara)"
                print("actionName:\(actionName)")
                target.viewUndoManager.setActionName(actionName)
            }
        }
        
        let ss = self.viewUndoManager.prepare(withInvocationTarget: self)
        print("ss = \(ss)")
        
        if let tar = ss as? ViewController {
            print("tar = \(tar)")
        }
        
        self.para1 = firstPara
        self.para2 = secondPara
        let sum = firstPara + secondPara
        self.textFieldOne.integerValue = self.para1
        self.textFieldTwo.integerValue = self.para2
        self.textFieldThree.integerValue = sum
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension UndoManager {
    func comptableRegisterUndo<TargetType: AnyObject>(withTarget target: TargetType, handler: @escaping (TargetType) -> ()) -> Void {
        self.registerUndo(withTarget: target, handler: handler)
    }
    
    @objc func performUndo(operation: Operation) -> Void {
        operation.start()
    }
}
