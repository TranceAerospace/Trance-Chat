//
//  ChatViewController.swift
//  Messenger
//
//  Created by Mark Trance on 9/16/21.
//

import UIKit
import MessageKit

struct Message: MessageType {
	var sender: SenderType
	var messageId: String
	var sentDate: Date
	var kind: MessageKind
	
	
}

struct Sender: SenderType {
	var photoURL: String
	var senderId: String
	var displayName: String
}



class ChatViewController: MessagesViewController {
	
	private var messages = [Message]()
	private let selfSender = Sender(photoURL: "", senderId: "1", displayName: "Joe Smith")

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemRed
		
		messages.append(Message(sender: selfSender,
								messageId: "1",
								sentDate: Date(),
								kind: .text("Hello World Message")))
		
		messages.append(Message(sender: selfSender,
								messageId: "1",
								sentDate: Date(),
								kind: .text("Hello World Message. Hello World Message. Hello World Message")))
		
		messagesCollectionView.messagesDataSource = self
		messagesCollectionView.messagesLayoutDelegate = self
		messagesCollectionView.messagesDisplayDelegate = self
    }
    

}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
	func currentSender() -> SenderType {
		return selfSender
	}
	
	func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
		messages[indexPath.section]
	}
	
	func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
		return messages.count
	}
	
	
}
