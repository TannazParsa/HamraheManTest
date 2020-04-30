//
//  CharacterMainVC.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import Parchment

import UIKit

class CharacterMainVC: UIViewController {
    
    @IBOutlet weak var vwMain: UIView!
    var startTab = 0
        override func viewDidLoad() {
            let characterVC = Storyboards.main.instantiateViewController(withIdentifier: "charactersVC") as! CharactersVC
            characterVC.title = "Characters"
            characterVC.view.backgroundColor = .gray
            let favoritesVC = Storyboards.main.instantiateViewController(withIdentifier: "favoritesVC") as! FavoritesVC
            favoritesVC.title = "Favorites"
            let pagingViewController = PagingViewController(viewControllers: [
              characterVC,
              favoritesVC
            ])
            
            pagingViewController.delegate = self
            pagingViewController.includeSafeAreaInsets = true
            //pagingViewController.sizeDelegate = self
            pagingViewController.textColor = .red
           // pagingViewController.te
            pagingViewController.reloadMenu()
            addChild(pagingViewController)
            vwMain.addSubview(pagingViewController.view)
            vwMain.constrainToEdges(pagingViewController.view)
            pagingViewController.didMove(toParent: self)

       }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
extension CharacterMainVC: PagingViewControllerDelegate {
    
}

