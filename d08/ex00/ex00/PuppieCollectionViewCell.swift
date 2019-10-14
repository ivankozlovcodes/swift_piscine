//
//  PuppieCollectionViewCell.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/13/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class PuppieCollectionViewCell: UICollectionViewCell {
    
    public var puppy: Puppy?

    @IBOutlet var avatar: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    func configure(puppy: Puppy) {
        self.puppy = puppy
        avatar.image = puppy.avatar
        nameLabel.text = puppy.name
        backgroundColor = puppy.isFavorite ?? false ? UIColor.yellow : UIColor.white
    }
}
