//
//  ViewController.swift
//  euler
//
//  Created by sanjaypojo on 07/08/14.
//  Copyright (c) 2014 sanjaypojo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var computeGraph: NSButton!
    @IBOutlet var graphArea: GraphView!
    @IBOutlet var primesFrom: NSTextField!
    @IBOutlet var primesUpto: NSTextField!
    @IBOutlet var progressBar: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.indeterminate = false
        progressBar.minValue = 0.0
        progressBar.maxValue = 100.0
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
                                    
    }

    @IBAction func plotGraph(sender: AnyObject) {
        progressBar.doubleValue = 2.0
        var plotData = [Float:Float]()
        let start = primesFrom.integerValue
        let end = primesUpto.integerValue
        var primeArray = [2]
        var flag = false
        var count = 0
        var bucket = 1.0
        let bucketSize = Float(start + end)/50.0
        var limit:Double = 0
        
        if (start + 100) < end {
            var startTime = NSDate()
            var count = 0
            var bucket = 1.0
            startTime = NSDate()
            for var i=3; i < end; i+=2 {
                flag = true
                limit = sqrt(Double(i)) + 1
                for factor in primeArray {
                    if factor > Int(limit + 1) {
                        break
                    }
                    if i%factor == 0 {
                        flag = false
                        break
                    }
                }
                if flag == true {
                    count++
                    primeArray.append(i)
                }

                if Float(i)/(Float(bucket)*bucketSize) > 1.0 {
                    plotData[Float(bucket)] = Float(count)
                    bucket++
                    count = 0
                    print(".")
                    progressBar.incrementBy(2.0)
                    progressBar.displayIfNeeded()
                }
            }
            var duration = -startTime.timeIntervalSinceNow
            println("Time taken: \(round(duration*100)/100) seconds")

            graphArea.drawBarGraph(plotData)
        }
        else {
            var alert = NSAlert()
            alert.messageText = "Woopsie"
            alert.runModal()
        }
    }
}

