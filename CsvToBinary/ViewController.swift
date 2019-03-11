//
//  ViewController.swift
//  CsvToBinary
//
//  Created by iCat Solutions on 3/7/17.
//  Copyright © 2017 iCat Solutions. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var exportButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        let doc = self.view.window?.windowController?.document as! Document
        exportButton.isHidden = doc.mat.count == 0
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func exportToBinary(_ sender: Any) {
        
        let doc = self.view.window?.windowController?.document as! Document
        
        let mat = doc.mat
        
        var stream = [Double]()
        for y in 0..<mat.count {
            stream.append(contentsOf: mat[y])
        }
        
        var fileName = doc.fileURL?.absoluteString
        fileName = fileName?.replacingOccurrences(of: ".csv", with: ".fsg")
        let path = URL(string: fileName!)!
        
        let data = Data(buffer: UnsafeBufferPointer(start: stream, count: stream.count))
        
        do {
            try data.write(to: path)
        } catch {
            Log.d(msg: "Can't write file at \(path)")
            
        }
    }
}

