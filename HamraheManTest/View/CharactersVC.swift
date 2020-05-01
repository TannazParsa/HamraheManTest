//
//  CharactersVC.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit


class CharactersVC: MainVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel : CharactersVM!
    
// MARK: ViewController LifeCycle
    override func viewDidLoad() {
        viewModel = CharactersVM(self)
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: .main), forCellReuseIdentifier: "characterCell")
        refresh(self)
        
    }
// MARK: Get API Response
    func downloadData(_ page: Int) {
        if page == 1, viewModel.characters.count == 0 {
            view.lock()
        } else {
            view.unlock()
        }
        viewModel.requestToGetCharacters(page)
    }
    override func refresh(_ sender: AnyObject) {
        super.refresh(sender)
        downloadData(1)
    }
    
    override func endRefreshing() {
        super.endRefreshing()
    }
    
    func loadMoreIfNeeded() {
        if isRefreshing || isLoadingMore || loadedAll {
            return
        }
        isLoadingMore = true
        downloadData(viewModel.page+1)
    }
    
    // MARK: get Api Success
     func successToGetCharacters() {
         tableView.reloadData()
     }
    
}
// MARK: TableView DataSource/Delegate
 
extension CharactersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell
            var favorite = false
            if StoringData.favorites?.contains(where: { $0.id == viewModel.characters[indexPath.row].id }) ?? false {
                favorite = true
            }else {
                favorite = false

            }
            cell.config(character: viewModel.characters[indexPath.row] , delegate: self, isFavorites: favorite)
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > viewModel.characters.count - 5 {
            loadMoreIfNeeded()
        }
    }
    
}
// MARK: Cell handler Delegate
extension CharactersVC: CellHandlerDelegate {
    func changeHeightTo() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    func characterAddedToFavorite(cell: CharacterTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return }
        let selectedCharacter = viewModel.characters[indexPath.row]
        //remove character if in favorites now
        if let favorites = StoringData.favorites {
            if favorites.contains(where: { $0.id == selectedCharacter.id}) {
               for i in 0 ..< (favorites.count) {
                    if favorites[i].id == selectedCharacter.id {
                    StoringData.favorites?.remove(at: i)
                    return
                    }
                }
            }
        }
        // add to favorites
        if StoringData.favorites == nil {
            StoringData.favorites = []
            StoringData.favorites?.append(selectedCharacter)
        }else {
            StoringData.favorites?.append(selectedCharacter)

        }
    }
    
}
