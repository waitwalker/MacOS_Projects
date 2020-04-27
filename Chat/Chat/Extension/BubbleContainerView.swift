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
    
    
    private var currentPosition: UInt = 0
    
    init(frame: NSRect, position: UInt) {
        super.init(frame: frame)
        currentPosition = position
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        draw(position: currentPosition)
    }
    
    public func draw(position: UInt) -> Void {
        var bezierPath: NSBezierPath = NSBezierPath()
        bezierPath = makeBubble(bezierPath, NSRect(x: 0, y: 0.0, width: self.bounds.size.width - 10.0, height: self.bounds.size.height - 10.0), 8.0, position)
        NSColor.gray.withAlphaComponent(0.3).set()
        bezierPath.fill()
        NSColor.green.set()
        bezierPath.stroke()
    }
 
    /*
     * name: makeBubble
     * description: 气泡位置 & 区域绘制; direction: 1左上,2左下,3右上,4右下
     * author: waitwalker
     * date: 4.24
     */
    private func makeBubble(_ bezierPath: NSBezierPath, _ bubbleRect: NSRect, _ corner: CGFloat, _ direction: UInt) -> NSBezierPath {
        
        // 基本偏角
        let baseAngle: CGFloat = 40.0
        let cornerOffWidth: CGFloat = 10.0;
        
        var angle: CGFloat = 10.0
        
        // 绘制宽高
        let rw: CGFloat = bubbleRect.width
        let rh: CGFloat = bubbleRect.height
        
        let minDiameter: CGFloat = rw > rh ? rh : rw
        
        // 半径
        var radius: CGFloat = 0.0
        
        if corner > 0.0 {
            radius = corner > minDiameter / 2.0 ? minDiameter / 2.0 : corner;
        }
        
        // 最小长度与圆角比
        let rate: CGFloat = radius / minDiameter
        
        let leftBottom: NSPoint = NSPoint(x: bubbleRect.minX, y: bubbleRect.minY)
        let leftBottomX: NSPoint = NSPoint(x: leftBottom.x + radius, y: leftBottom.y)
        let leftBottomY: NSPoint = NSPoint(x: leftBottom.x, y: leftBottom.y + radius)
        
        let rightBottom: NSPoint = NSPoint(x: bubbleRect.maxX, y: bubbleRect.minY)
        let rightBottomX: NSPoint = NSPoint(x: rightBottom.x - radius, y: rightBottom.y)
        let rightBottomY: NSPoint = NSPoint(x: rightBottom.x, y: rightBottom.y + radius)
        
        let rightTop: NSPoint = NSPoint(x: bubbleRect.maxX, y: bubbleRect.maxY)
        let rightTopX: NSPoint = NSPoint(x: rightTop.x - radius, y: rightTop.y)
        let rightTopY: NSPoint = NSPoint(x: rightTop.x, y: rightTop.y - radius)
        
        let leftTop: NSPoint = NSPoint(x: bubbleRect.minX, y: bubbleRect.maxY)
        let leftTopX: NSPoint = NSPoint(x: leftTop.x + radius, y: leftTop.y)
        let leftTopY: NSPoint = NSPoint(x: leftTop.x, y: leftTop.y - radius)
        
        // 最小高度在30以下,只需要在左或右画即可
        if minDiameter < 30.0 {
            if rate > 0.33 && rate <= 0.5 {
                angle = 40.0
            } else {
                angle = 0
            }
        } else if minDiameter >= 30.0 && minDiameter <= 50.0 {
            if rate > 0.2 && rate < 0.4 {
                angle = 40.0
            } else if rate > 0.4 && rate <= 0.5 {
                angle = 10.0 //直角
            } else {
                angle = 0.0
            }
        } else {
            if corner >= 10.0 && corner <= 15.0 {
                angle = 40.0
            } else if corner < 10.0 {
                angle = 0.0
            }
        }
        
        var ABNodePoint: NSPoint = NSPoint(x: 0, y: 0)
        var APoint: NSPoint = NSPoint(x: 0, y: 0)
        var BPoint: NSPoint = NSPoint(x: 0, y: 0)
        
        var autoOffUpHeight: CGFloat = 0.0
        var autoOffDownHeight: CGFloat = 0.0
        
        switch direction {
        case 2: //左下
            if angle == 10.0 || angle == 40.0 {
                ABNodePoint = NSPoint(x: leftBottom.x - cornerOffWidth, y: leftBottom.y)
            } else {
                if rh <= 30.0 {
                    autoOffDownHeight = (rh - 2 * radius - 10.0) / 2.0
                    autoOffUpHeight = autoOffDownHeight
                    APoint = NSPoint(x: leftTopY.x, y: leftTopY.y - autoOffUpHeight)
                    BPoint = NSPoint(x: leftBottomY.x, y: leftBottomY.y + autoOffDownHeight)
                } else {
                    autoOffDownHeight = (rh - 2 * radius) / 30.0
                    autoOffDownHeight = autoOffDownHeight > 10.0 ? 10.0 : autoOffDownHeight
                    autoOffUpHeight = (rh - 2 * radius) - autoOffDownHeight;
                    APoint = NSPoint(x: leftTopY.x, y: leftTopY.y - autoOffUpHeight + 10.0)
                    BPoint = NSPoint(x: leftBottomY.x, y: leftBottomY.y + autoOffDownHeight)
                }
                
                ABNodePoint = NSPoint(x: leftBottom.x - cornerOffWidth, y: (APoint.y + BPoint.y) / 2.0)
            }
            break
        case 3: //右上
            if angle == 10.0 || angle == 40.0 {
                ABNodePoint = NSPoint(x: rightTop.x + cornerOffWidth, y: rightTop.y)
            } else {
                if rh <= 30.0 {
                    autoOffDownHeight = (rh - 2 * radius - 10.0) / 2.0
                    autoOffUpHeight = autoOffDownHeight
                    APoint = NSPoint(x: rightTopY.x, y: rightTopY.y - autoOffDownHeight)
                    BPoint = NSPoint(x: rightBottomY.x, y: rightBottomY.y + autoOffUpHeight)
                } else {
                    autoOffUpHeight = (rh - 2 * radius) / 30.0
                    autoOffUpHeight = autoOffUpHeight > 10.0 ? 10.0 : autoOffUpHeight
                    autoOffDownHeight = (rh - 2 * radius) - autoOffUpHeight;
                    APoint = NSPoint(x: rightTopY.x, y: rightTopY.y - autoOffUpHeight)
                    BPoint = NSPoint(x: rightBottomY.x, y: rightBottomY.y + autoOffDownHeight - 10.0)
                }
                
                ABNodePoint = NSPoint(x: rightTopY.x + cornerOffWidth, y: (APoint.y + BPoint.y) / 2.0)
            }
            break
        case 4: //右下
            if angle == 10.0 || angle == 40.0 {
                ABNodePoint = NSPoint(x: rightBottom.x + cornerOffWidth, y: rightBottom.y)
            } else {
                if rh <= 30.0 {
                    autoOffDownHeight = (rh - 2 * radius - 10.0) / 2.0
                    autoOffUpHeight = autoOffDownHeight
                    APoint = NSPoint(x: rightTopY.x, y: rightTopY.y - autoOffUpHeight)
                    BPoint = NSPoint(x: rightBottomY.x, y: rightBottomY.y + autoOffDownHeight)
                } else {
                    autoOffDownHeight = (rh - 2 * radius) / 30.0
                    autoOffDownHeight = autoOffDownHeight > 10.0 ? 10.0 : autoOffDownHeight
                    autoOffUpHeight = (rh - 2 * radius) - autoOffDownHeight;
                    APoint = NSPoint(x: rightTopY.x, y: rightTopY.y - autoOffUpHeight + 10.0)
                    BPoint = NSPoint(x: rightBottomY.x, y: rightBottomY.y + autoOffDownHeight)
                }
                
                ABNodePoint = NSPoint(x: rightBottomY.x + cornerOffWidth, y: (APoint.y + BPoint.y) / 2.0)
            }
            break
        default: //左上
            if angle == 10.0 || angle == 40.0 {
                ABNodePoint = NSPoint(x: leftTop.x - cornerOffWidth, y: leftTop.y)
            } else {
                if rh <= 30.0 {
                    autoOffDownHeight = (rh - 2 * radius - 10.0) / 2.0
                    autoOffUpHeight = autoOffDownHeight
                    APoint = NSPoint(x: leftTopY.x, y: leftTopY.y - autoOffDownHeight)
                    BPoint = NSPoint(x: leftBottomY.x, y: leftBottomY.y + autoOffUpHeight)
                } else {
                    autoOffUpHeight = (rh - 2 * radius) / 30.0
                    autoOffUpHeight = autoOffUpHeight > 10.0 ? 10.0 : autoOffUpHeight
                    autoOffDownHeight = (rh - 2 * radius) - autoOffUpHeight;
                    APoint = NSPoint(x: leftTopY.x, y: leftTopY.y - autoOffUpHeight)
                    BPoint = NSPoint(x: leftBottomY.x, y: leftBottomY.y + autoOffDownHeight - 10.0)
                }
                
                ABNodePoint = NSPoint(x: leftTop.x - cornerOffWidth, y: (APoint.y + BPoint.y) / 2.0)
            }
            break
        }
        
        
        let rightTopCenter: NSPoint = NSPoint(x: bubbleRect.maxX - radius, y: bubbleRect.maxY - radius)
        let leftTopCenter: NSPoint = NSPoint(x: bubbleRect.minX + radius, y: bubbleRect.maxY - radius)
        let leftBottomCenter: NSPoint = NSPoint(x: bubbleRect.minX + radius, y: bubbleRect.minY + radius)
        let rightBottomCenter: NSPoint = NSPoint(x: bubbleRect.maxY - radius, y: bubbleRect.minY + radius)
        
        // A点引出点的位置
        let Ax: CGFloat = radius * cos((90.0 - baseAngle - angle) * CGFloat(Double.pi) / 180.0)
        let Ay: CGFloat = radius * sin((90.0 - baseAngle - angle) * CGFloat(Double.pi) / 180.0)
        
        // B点引出点的位置
        let Bx: CGFloat = radius * cos(baseAngle * CGFloat(Double.pi) / 180.0)
        let By: CGFloat = radius * sin(baseAngle * CGFloat(Double.pi) / 180.0)
        
        // 右下角缺口位置的A,B点坐标
        let rBottomBPoint: NSPoint = NSPoint(x: rightBottomX.x + By, y: rightBottomY.y - Bx)
        let rTopBPoint: NSPoint = NSPoint(x: rightTopX.x + Ax, y: rightTopY.y + Ay)
        let lBottomAPoint: NSPoint = NSPoint(x: leftBottomX.x - Ax, y: leftBottomY.y - Ay)
        let lTopAPoint: NSPoint = NSPoint(x: leftTopX.x - By, y: leftTopY.y + Bx)
        
        
        switch direction {
        case 2:
            bezierPath.move(to: ABNodePoint)
            if angle != 0.0 {
                bezierPath.line(to: lBottomAPoint)
                bezierPath.appendArc(withCenter: leftBottomCenter,
                                     radius: radius,
                                     startAngle: -(90.0 + baseAngle + angle),
                                     endAngle: 180.0,
                                     clockwise: true)
            } else {
                bezierPath.line(to: APoint)
            }
            
            drawLeftTopPart(leftTopCenter, radius, bezierPath)
            drawRightTopPart(rightTopCenter, radius, bezierPath)
            drawRightBottomPart(rightBottomCenter, radius, bezierPath)
            
            if angle != 0.0 {
                bezierPath.appendArc(withCenter: leftBottomCenter,
                                     radius: radius,
                                     startAngle: -90.0,
                                     endAngle: -(90.0 + baseAngle),
                                     clockwise: true)
            } else {
                drawLeftBottomPart(leftBottomCenter, radius, bezierPath)
                bezierPath.line(to: BPoint)
            }
            
            break
        case 3:
            bezierPath.move(to: ABNodePoint)
            if angle != 0.0 {
                bezierPath.line(to: rTopBPoint)
                bezierPath.appendArc(withCenter: rightTopCenter,
                                     radius: radius,
                                     startAngle: (90.0 - baseAngle - angle),
                                     endAngle: 0.0,
                                     clockwise: true)
            } else {
                bezierPath.line(to: BPoint)
            }
            
            drawRightBottomPart(rightBottomCenter, radius, bezierPath)
            drawLeftBottomPart(leftBottomCenter, radius, bezierPath)
            drawLeftTopPart(leftTopCenter, radius, bezierPath)
            if angle != 0.0 {
                bezierPath.appendArc(withCenter:rightTopCenter,
                                     radius: radius,
                                     startAngle: 90.0,
                                     endAngle: 90.0 - baseAngle,
                                     clockwise: true)
            } else {
                drawRightTopPart(rightTopCenter, radius, bezierPath)
                bezierPath.line(to: APoint)
            }
            
            break
        case 4:
            bezierPath.move(to: ABNodePoint)
            if angle != 0.0 {
                bezierPath.line(to: rBottomBPoint)
                bezierPath.appendArc(withCenter:rightBottomCenter,
                                     radius: radius,
                                     startAngle: -(90.0 - baseAngle),
                                     endAngle: -90.0,
                                     clockwise: true)
            } else {
                bezierPath.line(to: BPoint)
                drawRightBottomPart(rightBottomCenter, radius, bezierPath)
            }
            
            drawLeftBottomPart(leftBottomCenter, radius, bezierPath)
            drawLeftTopPart(leftTopCenter, radius, bezierPath)
            drawRightBottomPart(rightTopCenter, radius, bezierPath)
            
            if angle != 0.0 {
                bezierPath.appendArc(
                    withCenter: rightBottomCenter,
                    radius: radius,
                    startAngle: 0,
                    endAngle: -(90.0 - baseAngle - angle),
                    clockwise: true)
            } else {
                bezierPath.line(to: APoint)
            }
            break
        default:
            bezierPath.move(to: ABNodePoint)
            if angle != 0.0 {
                bezierPath.line(to: lTopAPoint)
                bezierPath.appendArc(withCenter: leftTopCenter,
                                     radius: radius,
                                     startAngle: 90.0 + baseAngle,
                                     endAngle: 90.0,
                                     clockwise: true)
            } else {
                bezierPath.line(to: APoint)
                drawLeftTopPart(leftTopCenter, radius, bezierPath)
            }
            
            drawRightTopPart(rightTopCenter, radius, bezierPath)
            drawRightBottomPart(rightBottomCenter, radius, bezierPath)
            drawLeftBottomPart(leftBottomCenter, radius, bezierPath)
            if angle != 0.0 {
                bezierPath.appendArc(withCenter: leftTopCenter,
                                     radius: radius,
                                     startAngle: 180.0,
                                     endAngle: (90.0 + baseAngle + angle),
                                     clockwise: true)
            } else {
                bezierPath.line(to: BPoint)
            }
            break
        }
        
        bezierPath.close()
        return bezierPath
    }
    
    
    // 左下半圆
    private func drawLeftBottomPart(_ cornerCenter: NSPoint, _ radius: CGFloat, _ bezierPath: NSBezierPath) -> Void {
        bezierPath.appendArc(
            withCenter: cornerCenter,
            radius: radius,
            startAngle: -90.0,
            endAngle: -180.0,
            clockwise: true)
    }
    
    // 左上半圆
    private func drawLeftTopPart(_ cornerCenter: NSPoint, _ radius: CGFloat, _ bezierPath: NSBezierPath) -> Void {
        bezierPath.appendArc(
            withCenter: cornerCenter,
            radius: radius,
            startAngle: 180.0,
            endAngle: 90.0,
            clockwise: true)
    }
    
    // 右上半圆
    private func drawRightTopPart(_ cornerCenter: NSPoint, _ radius: CGFloat, _ bezierPath: NSBezierPath) -> Void {
        bezierPath.appendArc(
            withCenter: cornerCenter,
            radius: radius,
            startAngle: 90.0,
            endAngle: 0.0,
            clockwise: true)
    }
    
    // 右下半圆
    private func drawRightBottomPart(_ cornerCenter: NSPoint, _ radius: CGFloat, _ bezierPath: NSBezierPath) -> Void {
        bezierPath.appendArc(
            withCenter: cornerCenter,
            radius: radius,
            startAngle: 0.0,
            endAngle: 270.0,
            clockwise: true)
    }
    
}
