//
//  TabBarViewController.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 14/07/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        configTaBar()
    }
    
    private func createNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTabBar() {
        viewControllers = [
            createNavigationController(for: HomeViewController(), title: "Home", image: UIImage(systemName: "house") ?? UIImage()),
            createNavigationController(for: HomeViewController(), title: "Stats", image: UIImage(systemName: "flag.checkered.2.crossed") ?? UIImage()),
            createNavigationController(for: HomeViewController(), title: "Drivers", image: UIImage(systemName: "crown") ?? UIImage()),
            createNavigationController(for: HomeViewController(), title: "Seasons", image: UIImage(systemName: "doc.text.magnifyingglass") ?? UIImage()),
        ]}
    
    private func configTaBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .black
        tabBar.tintColor = .red
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
    }
    


}
