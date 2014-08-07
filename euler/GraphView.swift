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
        println(xyData)
        let context:CGContextRef = NSGraphicsContext.currentContext().CGContext
        let gap = 5
        let fat = 15
        var graphX:CGFloat = 0
        var graphY:CGFloat = 0
        CGContextSetLineWidth(context, 0.8)
        CGContextMoveToPoint(context, 5, 0)
        CGContextAddLineToPoint(context, 5, 300)
//        CGContextSetCMYKStrokeColor(context, 20, 20, 20, 20, 0.5)
//        for (x, y) in xyData {
//            println(y)
//            graphX = 10*CGFloat(x)
//            graphY = 50*CGFloat(y)
//            CGContextMoveToPoint(context, graphX, 0)
//            CGContextAddLineToPoint(context, graphX, graphY)
//        }
        CGContextStrokePath(context)
        self.setNeedsDisplayInRect(NSRect())
    }
    
}
