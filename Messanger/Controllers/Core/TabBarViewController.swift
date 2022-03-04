//
//  TabBarViewController.swift
//  Messanger
//
//  Created by Noah Schmitt on 04.03.22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let vc1 = ChatsViewController()
        let vc2 = FriendsViewController()
        let vc3 = SettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        vc1.title = "Chats"
        vc2.title = "Friends"
        vc3.title = "Settings"
        
        nav1.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        nav2.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.below.square.filled.and.square"), selectedImage: UIImage(systemName: "slider.horizontal.below.square.filled.and.square"))
        
        
        tabBar.tintColor = UIColor(named: "blue")
        tabBar.barTintColor = .red
        
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    
    }
    

}
