//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Jörg Klausewitz on 24.04.15.
//  Copyright (c) 2015 Stunlabs. All rights reserved.
//

import Foundation

class RecordedAudio {
    
    var filePathUrl:NSURL!
    var title:String!
    
    init(filePathUrl: NSURL, title: String){
        
        self.filePathUrl = filePathUrl
        self.title = title
        
    }
    
    init(_ filePathUrl: NSURL, _ title: String){
        
        self.filePathUrl = filePathUrl
        self.title = title
        
    }
    
    
}