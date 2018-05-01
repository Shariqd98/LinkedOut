//
//  User.swift
//  Group18Alpha
//
//  Created by kvaldez on 4/29/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

class User: NSObject {
    var age: AnyObject?
    var city: AnyObject?
    var fullName: AnyObject?
    var personality: AnyObject?
    var photoUrl: AnyObject?
    var state: AnyObject?
    var skillsAndInt = [String]()
    var searchIsPrivate: AnyObject? = "False" as? AnyObject
}
