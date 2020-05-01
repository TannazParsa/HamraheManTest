//
//  FavoriteTableViewCell.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFAvorites: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblEpisodes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ character: JCharacter) {
        if let url = URL(string: character.image ) {
            imgFAvorites.kf.setImage(with: url, placeholder: UIImage(), options: [.transition(.fade(0.1))])
        }
        lblName.text = character.name
        lblStatus.text = character.status
        lblSpecies.text = character.species
        lblType.text = character.type
        lblGender.text = character.gender
        lblOrigin.text = character.origin?.name
        lblLocation.text = character.locations?.name
        if let episodes = character.episodes {
            if episodes.count > 0 {
                lblEpisodes.text = episodes[0].name
            }
        }
    }
    
}
