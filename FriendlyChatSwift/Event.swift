//
//  Event.swift
//  FindABuddy
//
//  Created by Andrii Dremov on 27.10.17.
//  Copyright © 2017 Dremov. All rights reserved.
//

import UIKit

class Event {
    
    //MARK: Properties
    var label: String
    var photo: UIImage?
    var description: String
    var expectedPersons: Int
    
    //MARK: Initialization
    init?(label: String, photo: UIImage?, description: String, expectedPersons: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        guard !label.isEmpty else {
            return nil
        }
        
        guard expectedPersons > 0 else {
            return nil
        }
        
        self.label = label
        self.photo = photo
        self.description = description
        self.expectedPersons = expectedPersons
    }
}

