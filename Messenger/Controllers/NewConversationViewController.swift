//
//  NewConversationViewController.swift
//  Messenger
//
//  Created by Mark Trance on 9/6/21.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {
	
	private let spinner = JGProgressHUD()
	
	private let searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "Search for users..."
		return searchBar
	}()

	private let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		table.isHidden = true
		return table
	}()
	
	private let noResultsLabel: UILabel = {
		let label = UILabel()
		label.isHidden = true
		label.text = "No Results"
		label.textAlignment = .center
		label.textColor = .systemGreen
		label.font = .systemFont(ofSize: 21, weight: .medium)
		return label
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.topItem?.titleView = searchBar
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(disMissSelf))
		
		searchBar.becomeFirstResponder()
		
    }
    
	@objc private func disMissSelf() {
		dismiss(animated: true)
	}

 

}

extension NewConversationViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
	}
}
