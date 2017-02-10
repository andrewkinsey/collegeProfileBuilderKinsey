//
//  CollegeClass.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 2/8/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var enrollment = ""
    var image = UIImage(named: "default")

    init(Name: String, Location: String, Enrollment: String, Image: UIImage)
    {
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
    }
    
    init(Name: String, Location: String)
    {
        name = Name
        location = Location
    }
}
