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

class CharacterMainVC: MainVC {
    
    @IBOutlet weak var vwMain: UIView!
        override func viewDidLoad() {
            // MARK: add childs to Top tabbar
            let characterVC = Storyboards.main.instantiateViewController(withIdentifier: "charactersVC") as! CharactersVC
            characterVC.title = "Characters"
            let favoritesVC = Storyboards.main.instantiateViewController(withIdentifier: "favoritesVC") as! FavoritesVC
            favoritesVC.title = "Favorites"
            // MARK: initianl Top tabbar
            let pagingViewController = PagingViewController(viewControllers: [
              characterVC,
              favoritesVC
            ])
            
            pagingViewController.includeSafeAreaInsets = true
            pagingViewController.textColor = .darkGray
            pagingViewController.reloadMenu()
            addChild(pagingViewController)
            vwMain.addSubview(pagingViewController.view)
            vwMain.constrainToEdges(pagingViewController.view)
            pagingViewController.didMove(toParent: self)

       }
}


