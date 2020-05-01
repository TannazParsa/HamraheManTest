//
//  CharactersVM.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

class CharactersVM {
    
    weak var vc: CharactersVC!
    var page = 1
    var totalPages = Int()
    var characters = [JCharacter]()
    let dispatchGroup = DispatchGroup()

    init(_ vc: CharactersVC) {
        self.vc = vc
    }
    
    func requestToGetCharacters(_ page: Int) {
        if characters.count == 0 && page == 1 {
            self.vc.view.lock()
        }
        WebServices.getCharacter(page: page, success: { [weak self] (response) in
            self?.vc.view.unlock()
            self?.vc.endRefreshing()
            if let res = response.result as? [JCharacter] {
                if let pagination = response.info as? JInfo {
                    self?.vc?.endRefreshing()
                    self?.totalPages = pagination.pages
                        if page == 1 {
                            self?.characters = []
                        }
                    self?.characters.append(contentsOf: res)
                    self?.page = page
                    if res.count == 0 && page >= pagination.pages {
                        self?.vc.loadedAll = true
                    }else {
                      self?.vc.loadedAll = false
                    }
                self?.vc.successToGetCharacters()
                self?.requestToGetEpisode()
                }
            }
            
        }) { (response) in
            
        }
    }
    
    func requestToGetEpisode() {
        var episodes = [JResEpispde]()
        for i in 0...self.characters.count - 1 {
                self.characters[i].episodes = []
            for j in 0...self.characters[i].episode.count - 1 {
                self.dispatchGroup.enter()
                WebServices.getEpisode(url: self.characters[i].episode[j], success: { (response) in
                if let episode = response as? JResEpispde {
                    episodes.append(episode)
                    self.characters[i].episodes?.append(episode)
                    
                    self.dispatchGroup.leave()
                }
                
            }) { (response) in
                self.dispatchGroup.leave()
                }
        }
            dispatchGroup.notify(queue: .main) {
                self.characters[i].episodes = episodes
            }
        }
        
    }
    
}
