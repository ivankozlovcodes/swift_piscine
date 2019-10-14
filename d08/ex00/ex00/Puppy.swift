//
//  Puppy.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/13/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class Puppy: NSObject {
    public var name: String?
    public var info: String?
    public var avatar: UIImage?
    public var isFavorite: Bool?
    
    init(name: String, info: String, avatar: UIImage) {
        self.name = name
        self.info = info
        self.avatar = avatar
        isFavorite = false
    }
}
