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
                
                if let dir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
                    let path = NSURL(fileURLWithPath: dir).appendingPathComponent(file)!
                    
                    //reading
                    do {
                        let jsonString = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue)
                        
                        if let dataFromString = jsonString.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false) {
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
    
