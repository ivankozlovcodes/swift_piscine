//
//  PuppiesCollectionViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/13/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PuppiesCollectionViewController: UICollectionViewController {
    
    var puppies: [Puppy] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        buildPuppyList()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? PuppieCollectionViewCell {
            guard let vc = segue.destination as? ProfileViewController else { return }
            vc.puppies = puppies
            vc.puppy = sender.puppy
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return puppies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PuppieCollectionViewCell
    
        // Configure the cell
        cell.configure(puppy: puppies[indexPath.row])
    
        return cell
    }

    func buildPuppyList() {
        print("puppy init")
        puppies.append(Puppy(name: "One", info: "One info", avatar: #imageLiteral(resourceName: "puppie")))
        puppies.append(Puppy(name: "Two", info: "Very long info\n with new lines\n and stuf\n\n\n", avatar: #imageLiteral(resourceName: "pup1")))
        puppies.append(Puppy(name: "Three", info: "asdfgadsgadsgadsgsdgadsgadsg", avatar: #imageLiteral(resourceName: "pup2")))
        puppies.append(Puppy(name: "Four", info: "That one is cute", avatar: #imageLiteral(resourceName: "pup3")))
        puppies.append(Puppy(name: "Five", info: "I am the beast", avatar: #imageLiteral(resourceName: "pup4")))
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
}
