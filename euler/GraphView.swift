//
//  GraphView.swift
//  euler
//
//  Created by sanjaypojo on 08/08/14.
//  Copyright (c) 2014 sanjaypojo. All rights reserved.
//

import Cocoa

class GraphView: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        let context:CGContextRef = NSGraphicsContext.currentContext().CGContext
        CGContextSetLineWidth(context, 0.2)
        var graphGap:CGFloat = 0
        let lines = 50
        for var i = 1; i <= lines; i++ {
            graphGap = dirtyRect.width * CGFloat(i)/CGFloat(lines)
            CGContextMoveToPoint(context, graphGap, 10)
            CGContextAddLineToPoint(context, graphGap, dirtyRect.height)
            CGContextMoveToPoint(context, 10, graphGap)
            CGContextAddLineToPoint(context, dirtyRect.width, graphGap)
        }
        CGContextStrokePath(context)
        CGContextSetLineWidth(context, 1)
        CGContextMoveToPoint(context, 9, 5)
        CGContextAddLineToPoint(context, 9, dirtyRect.height + 5)
        CGContextMoveToPoint(context, 5, 9)
        CGContextAddLineToPoint(context, dirtyRect.width + 5, 9)
        CGContextStrokePath(context)
    }
    
    func drawBarGraph(xyData: [Float: Float]) {
        func normalizeData(xyData:[Float:Float]) -> [Float:Float] {
            var xyNormalized = [Float:Float]()
            var xBig:Float = 0.0
            var yBig:Float = 0.0
            for (x, y) in xyData {
                if y > yBig {
                    yBig = y
                }
                if x > xBig {
                    xBig = x
                }
            }
            println(xBig)
            println(yBig)
            for (x, y) in xyData {
                xyNormalized[x/xBig] = y / yBig
            }
            return xyNormalized
        }
        var xyNormalized = normalizeData(xyData)
        println(xyNormalized)
        var graphX:CGFloat = 0
        var graphY:CGFloat = 0
        self.lockFocus()
        let context:CGContextRef = NSGraphicsContext.currentContext().CGContext
        CGContextSetLineWidth(context, 3)
        for (x, y) in xyNormalized {
            println(y)
            graphX = 300*CGFloat(x) + 10
            graphY = 150*CGFloat(y) + 10
            CGContextSetStrokeColorWithColor(context, CGColorCreateGenericRGB(0, CGFloat(y)/6, 0.2, 1))
            CGContextMoveToPoint(context, graphX, 10)
            CGContextAddLineToPoint(context, graphX, graphY)
            CGContextStrokePath(context)
        }
        self.unlockFocus()
    }
    
}
