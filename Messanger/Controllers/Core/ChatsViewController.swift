//
//  ChatsViewController.swift
//  Messanger
//
//  Created by Noah Schmitt on 04.03.22.
//

import UIKit

class ChatsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()

        
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(didTapped))
    }
    
    @objc func didTapped() {
        self.present(AddContactsViewController(), animated: true, completion: nil)
    }

    
}
