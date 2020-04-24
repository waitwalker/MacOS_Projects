//
//  BubbleContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/24.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

// https://blog.csdn.net/quanhaoH/article/details/103634614
class BubbleContainerView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
 
    /*
     * name: makeBubble
     * description: 气泡位置 & 区域绘制; direction: 1左上,2左下,3右上,4右下
     * author: waitwalker
     * date: 4.24
     */
    func makeBubble(_ bezierPath: NSBezierPath, _ bubbleRect: NSRect, _ cornerRadius: CGFloat, _ direction: UInt) -> NSBezierPath {
        
        // 基本偏角
        let baseAngle: CGFloat = 40.0
        let cornerOffWidth: CGFloat = 10.0;
        
        
        let angle: CGFloat = 10.0
        var midCorner: Bool = false
        
        // 绘制宽高
        let rw: CGFloat = bubbleRect.width
        let rh: CGFloat = bubbleRect.height
        
        let minDiameter: CGFloat = rw > rh ? rh : rw
        
        // 半径
        var raidus: CGFloat = 0.0
        
        if cornerRadius > 0.0 {
            raidus = cornerRadius > minDiameter / 2.0 ? minDiameter / 2.0 : cornerRadius;
        }
        
        // 最小长度与圆角比
        let rate: CGFloat = raidus / minDiameter
        
        let leftBottom: NSPoint = NSPoint(x: bubbleRect.minX, y: bubbleRect.minY)
        let leftBottomX: NSPoint = NSPoint(x: leftBottom.x + raidus, y: leftBottom.y)
        let leftBottomY: NSPoint = NSPoint(x: leftBottom.x, y: leftBottom.y + raidus)
        
        
        let rightBottom: NSPoint = NSPoint(x: bubbleRect.maxX, y: bubbleRect.minY)
        let rightBottomX: NSPoint = NSPoint(x: rightBottom.x - raidus, y: rightBottom.y)
        let rightBottomY: NSPoint = NSPoint(x: rightBottom.x, y: rightBottom.y + raidus)
        
        let rightTop: NSPoint = NSPoint(x: bubbleRect.maxX, y: bubbleRect.maxY)
        let rightTopX: NSPoint = NSPoint(x: rightTop.x - raidus, y: rightTop.y)
        let rightTopY: NSPoint = NSPoint(x: rightTop.x, y: rightTop.y - raidus)
        
        let leftTop: NSPoint = NSPoint(x: bubbleRect.minX, y: bubbleRect.maxY)
        let leftTopX: NSPoint = NSPoint(x: leftTop.x + raidus, y: leftTop.y)
        let leftTopY: NSPoint = NSPoint(x: leftTop.x, y: leftTop.y - raidus)
        
    }
}
