//
//  AddContactsViewController.swift
//  Messanger
//
//  Created by Noah Schmitt on 04.03.22.
//

import UIKit

class AddContactsViewController: UIViewController, UISheetPresentationControllerDelegate {

    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        sheetPresentationController?.delegate = self
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.preferredCornerRadius = 30
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.detents = [
            .medium(),
            .large()
        ]
    }
    

}
