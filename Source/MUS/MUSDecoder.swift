//
//  MUSDecoder.swift
//  FolioReaderKit
//
//  Created by Aldrin Balisi on 7/19/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import Cocoa
import SwiftyJSON

class MUSDecoder: NSObject {

    class func MUSFromJSONString(jsonString: String) -> JSON {
        
        if let dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            return json
        }
        
        return nil
    }

}
