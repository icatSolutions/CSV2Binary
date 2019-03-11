//
//  EMLog.swift
//
//  Created by Andrey Pervushin on 12/7/16.
//  Copyright © 2016 dbdest. All rights reserved.
//
//  Add ability to make console out more readable and informative
import Foundation
public class Log: NSObject {
    
    /**
     * Print execution place with timestamp
     */
    public class func t(function: String = #function, file: String = #file, line: Int = #line){
        print("📄 \(makeTag(function: function, file: file, line: line)) 🕒 \(time()) ")
    }
    
    /**
     * Print execution place with timestamp and message
     */
    public class func t(msg:String, function: String = #function, file: String = #file, line: Int = #line){
        print("📄 \(makeTag(function: function, file: file, line: line)) 🕒 \(time()) 💡 \(msg)")
    }
    
    /**
     * Print execution place
     */
    public class func d(function: String = #function, file: String = #file, line: Int = #line){
        print("📄 \(makeTag(function: function, file: file, line: line))")
    }
    
    /**
     * Print execution place with message
     */
    public class func d(msg:String, function: String = #function, file: String = #file, line: Int = #line){
        print("📄 \(makeTag(function: function, file: file, line: line)) 💡 \(msg)")
    }
    
    private class func makeTag(function: String, file: String, line: Int) -> String{
        let className = NSURL(fileURLWithPath: file).lastPathComponent ?? file
        return "\(className) 👉 \(function) ➡ \(line)"
    }
    
    private class func time() -> String {
        let d = Date()
        let df = DateFormatter()
        df.dateFormat = "H:m:ss+SSSS"
        
        return df.string(from: d)
    }
    
}

