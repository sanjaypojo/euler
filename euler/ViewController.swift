//
//  ViewController.swift
//  euler
//
//  Created by sanjaypojo on 07/08/14.
//  Copyright (c) 2014 sanjaypojo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var limit: NSTextField!
    @IBOutlet var computeGraph: NSButton!
    @IBOutlet var graphArea: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
                                    
    }

    @IBAction func plotGraph(sender: AnyObject) {
        println("Yo")
        graphArea.drawBarGraph([1:4, 2:2, 3:1])
    }
}

