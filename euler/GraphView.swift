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
        super.drawRect(dirtyRect)

        // Drawing code here.
        let context:CGContextRef = NSGraphicsContext.currentContext().CGContext
        CGContextSetLineWidth(context, 0.1)
        var graphX:CGFloat = 0
        for var i = 1; i <= 80; i++ {
            graphX = 10*CGFloat(i)
            CGContextMoveToPoint(context, graphX, 0)
            CGContextAddLineToPoint(context, graphX, 300)
            CGContextMoveToPoint(context, 0, graphX)
            CGContextAddLineToPoint(context, 400, graphX)
            
        }
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
        let context:CGContextRef = NSGraphicsContext.currentContext().CGContext
        var graphX:CGFloat = 0
        var graphY:CGFloat = 0
        self.lockFocus()
        CGContextSetLineWidth(context, 3)
        for (x, y) in xyNormalized {
            println(y)
            graphX = 300*CGFloat(x)
            graphY = 150*CGFloat(y)
            CGContextSetStrokeColorWithColor(context, CGColorCreateGenericRGB(0, CGFloat(y)/6, 0.2, 1))
            CGContextMoveToPoint(context, graphX, 0)
            CGContextAddLineToPoint(context, graphX, graphY)
            CGContextStrokePath(context)
        }
        self.unlockFocus()
    }
    
}
