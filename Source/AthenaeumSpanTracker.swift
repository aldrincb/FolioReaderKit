//
//  AthenaeumSpanTracker.swift
//  FolioReaderKit
//
//  Created by Aldrin Balisi on 6/22/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AthenaeumSpanTrackerDelegate: class {
    /**
     Notifies that the reader stopped scrolling
     */
    func readerStoppedScrolling()
}

class AthenaeumSpanTracker: NSObject {
//    var currentSpan: String!
//    var currentChapterName: String!
    var currentMUS: JSON!
    
    weak var delegate: AthenaeumSpanTrackerDelegate!
    static let sharedInstance = AthenaeumSpanTracker()
    
    
    /**
     Current Book Title
     */
    var currentBookTitle: String = "" {
        didSet {
            print(currentBookTitle)
        }
    }

    /**
     Current Span Setter
     */
    var currentSpan: String = "" {
        didSet {
            print(currentSpan)
        }
    }
    

    /**
     Current Chapter HREF Setter
     */
    var currentChapterHREF: String = ""{
        didSet {
            print(currentChapterHREF)
            if (oldValue != currentChapterHREF) {
                
                let file = "\(currentBookTitle)/\(currentChapterHREF).muse" //this is the file. we will write to and read from it
                
                if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
                    let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
                    
                    //reading
                    do {
                        let jsonString = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding)
                        
                        if let dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                            let json = JSON(data: dataFromString)
                            currentMUS = json
                        }
                    }
                    catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

    
    /**
     Reader stopped scrolling
     */
    func readerStoppedScrolling() {
        self.delegate.readerStoppedScrolling()
    }
}
    
