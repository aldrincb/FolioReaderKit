//
//  AthenaeumSpanTracker.swift
//  FolioReaderKit
//
//  Created by Aldrin Balisi on 6/22/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import Foundation

protocol AthenaeumSpanTrackerDelegate: class {
    /**
     Notifies that the reader stopped scrolling
     */
    func readerStoppedScrolling()
}

class AthenaeumSpanTracker: NSObject {
    var currentSpan: String!
    
    weak var delegate: AthenaeumSpanTrackerDelegate!
    static let sharedInstance = AthenaeumSpanTracker()

    /**
     Reader stopped scrolling
     */
    func readerStoppedScrolling () {
        self.delegate.readerStoppedScrolling()
    }
}
    
