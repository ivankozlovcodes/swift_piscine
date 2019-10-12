//
//  MessagesCollectionViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/11/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "Cell"

class MessagesCollectionViewController: UIViewController, UICollectionViewDataSource {

    var messages: [Message] = []
    
    @IBOutlet var textInput: UITextField!
    @IBOutlet var messagesView: UICollectionView!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        
        ref = Database.database().reference()
        
        ref.child("messages").observe(DataEventType.childAdded) { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else { return }
            self.updateMessage(id: snapshot.key, data: value)
            self.messagesView.reloadData()
        }
        ref.child("messages").observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.value as? NSDictionary {
                snapshot.forEach({ (key, value) in
                    guard let key = key as? String else { return }
                    guard let value = value as? NSDictionary else { return }
                    self.updateMessage(id: key, data: value)
                })
            }
            self.messagesView.reloadData()
        }

        messagesView.dataSource = self
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MessageCollectionViewCell
        
        //        cell.imageView.image = UIImage(named: "cat_\(indexPath.row%10)")
        cell.backgroundColor = UIColor.blue
        let message = messages[indexPath.row]
        cell.textLabel.text = message.text
        cell.statusLabel.text = message.sending ? "sending..." : "sent"
        
        return cell
    }
    
    func updateMessage(id: String, data: NSDictionary) {
        let index = messages.index { (m) in
            return m.id == id
        }
        
        let message = index != nil ? messages[index!] : Message()
        message.id = id
        message.text = data["text"] as! String
        message.sending = false
        if index == nil {
            messages.append(message)
        }
    }
    
    func updateMessages(snapshot: NSDictionary) {
        snapshot.forEach({ (key, value) in
            print(value)
            if let data = value as? NSDictionary {
                let message = Message()
                message.text = data["text"] as! String
                self.messages.append(message)
            }
        })
        self.messagesView.reloadData()
    }
    
    func addNewMessage(data: NSDictionary) {
        
    }

    @IBAction func sendMessage(_ sender: Any) {
        let message = Message()

        if let text = textInput.text {
            guard let key = ref.child("messages").childByAutoId().key else { return }
            message.id = key
            message.text = text;
            message.sending = true
            messages.append(message)
            messagesView.reloadData()
            
            let message = ["text": text]
            let childUpdates = ["/messages/\(key)": message]
            ref.updateChildValues(childUpdates)
            
            textInput?.text = ""
        }
    }
}
