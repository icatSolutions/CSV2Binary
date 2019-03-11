//
//  Document.swift
//  CsvToBinary
//
//  Created by iCat Solutions on 3/7/17.
//  Copyright © 2017 iCat Solutions. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var mat = [[Double]]()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    override class func autosavesInPlace() -> Bool {
        return true
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        
        let fileContent = String(data: data, encoding: String.Encoding.utf8) as String!
        
        let d = Date()
        
        let rows = fileContent!.components(separatedBy: "\r\n")
        
        mat = [[Double]]()
        
        for row in rows {
            
            var doubleValues = [Double]()
            let stringValues = row.components(separatedBy: ",")
            for value in stringValues {
                if let v = Double(value) {
                    doubleValues.append(v)
                } else {
                    doubleValues.append(0)
                }
            }
            mat.append(doubleValues)
            
        }
        
        mat[0][0] = Double(mat[0].count)
        Log.d(msg: "\(Date().timeIntervalSince(d))")
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    
}

