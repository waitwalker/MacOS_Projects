//
//  NSTextFieldExtension.swift
//  Chat
//
//  Created by etiantian on 2020/4/23.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Foundation
import AppKit
import Cocoa

class VerticalCenteredTextFieldCell: NSTextFieldCell {
  override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
    // call super and pass in our modified frame
    super.drawInterior(withFrame: titleRect(forBounds: cellFrame), in: controlView)
  }

  override func select(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, start selStart: Int, length selLength: Int) {
    // call super and pass in our modified frame
    super.select(withFrame: titleRect(forBounds: rect), in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
  }
}
