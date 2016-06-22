//
//  AthenaeumSpanTracker.swift
//  FolioReaderKit
//
//  Created by Aldrin Balisi on 6/22/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import Foundation



protocol AthenaeumSpanTrackerDelegate {
    /**
     Notifies that the reader stopped scrolling
     */
    func readerStoppedScrolling()
}

class AthenaeumSpanTracker: NSObject {
    weak var delegate: AthenaeumSpanTrackerDelegate!
    var currentSpan: Int!
    
    static let sharedInstance = AthenaeumSpanTracker()
    private init() {} // This prevents others from using the default '()' initializer for this class.

    /**
     Reader stopped scrolling
     */
    func readerStoppedScrolling () {
        self.delegate.readerStoppedScrolling()
    }
}
    
