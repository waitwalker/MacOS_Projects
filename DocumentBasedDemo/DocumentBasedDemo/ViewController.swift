//
//  ViewController.swift
//  DocumentBasedDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: NSButton) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "Word Count Window Controller") as! NSWindowController
        if let wordCountWindow = wordCountWindowController.window {
            let wordCountVC = wordCountWindowController.contentViewController as! WordCountViewController
            NSApplication.shared.runModal(for: wordCountWindow)
            wordCountWindow.close()
        }
        
        
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func ThirdAction(_ sender: NSButton) {
        let thirdVC = ThirdViewController()
        self.presentAsSheet(thirdVC)
    }
    
    @IBAction func secondAction(_ sender: NSButton) {
        let secondVC = SecondViewController()
        self.presentAsModalWindow(secondVC)
    }
}

