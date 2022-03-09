//
//  AuthManager.swift
//  Messanger
//
//  Created by Noah Schmitt on 09.03.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    public func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if(error != nil) {
                print(error as Any)
            } else {
                print(authResult?.user.email as Any)
            }
        }
    }
}
