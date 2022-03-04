//
//  ChatsViewController.swift
//  Messanger
//
//  Created by Noah Schmitt on 04.03.22.
//

import UIKit

class ChatsViewController: UIViewController {
    
    private let createButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: nil)
        button.tintColor = .secondaryLabel
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()

        
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = createButton
    }

    
}
