//
//  ProfileViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/13/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {

    public var puppies: [Puppy] = []
    public var puppy: Puppy?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var isFavoriteLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!

    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarView.isUserInteractionEnabled = true
        updateViews(avatarAnim: 0)

        scrollView.isUserInteractionEnabled = true
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
    }

    @IBAction func tap(_ sender: Any) {
    }

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            guard let puppy = puppy else { return }
            puppy.isFavorite = !puppy.isFavorite!
            updateViews(avatarAnim: 0)
        }
    }

    @IBAction func swipe(_ sender: Any) {
        if let index = puppies.index(where: { $0 == puppy }) {
            updatePuppyProfile(index: index - 1, avatarAnim: -1)
        }
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        if let index = puppies.index(where: { $0 == puppy }) {
            updatePuppyProfile(index: index + 1, avatarAnim: 1)
        }
    }
    
    func updateViews(avatarAnim: Int) {
        guard let puppy = puppy else { return }
        
        nameLabel.text = puppy.name
        infoLabel.text = puppy.info
        isFavoriteLabel.text = String(puppy.isFavorite!)
        
        let oldPosition = avatarView.layer.position
        if avatarAnim != 0 {
            avatarView.layer.position = CGPoint(x: CGFloat(avatarAnim * 1000), y: oldPosition.y)
        }
        nameLabel.alpha = 0
        infoLabel.alpha = 0
        isFavoriteLabel.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.avatarView.image = puppy.avatar
            
            self.nameLabel.alpha = 1
            self.infoLabel.alpha = 1
            self.isFavoriteLabel.alpha = 1
            self.avatarView.layer.position = oldPosition
        }) { (_) in
            self.avatarView.alpha = 1
        }
    }
    
    func updatePuppyProfile(index: Int, avatarAnim: Int) {
        if index >= 0 && index < puppies.count {
            puppy = puppies[index]
            updateViews(avatarAnim: avatarAnim)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return avatarView
    }
}
