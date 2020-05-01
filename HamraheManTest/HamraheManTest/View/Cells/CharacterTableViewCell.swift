//
//  CharacterTableViewCell.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
protocol CellHandlerDelegate {
    func changeHeightTo()
    func characterAddedToFavorite(cell: CharacterTableViewCell)
}

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: MyView!
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblSpecied: UILabel!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnArrowDown: UIButton!
    @IBOutlet weak var btnArrowUp: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var delegate : CellHandlerDelegate?
    var cnsMainViewHeight: Constraint?
    var currentCharacter: JCharacter?
    
    func config(character: JCharacter, delegate: CellHandlerDelegate,isFavorites: Bool) {
        self.delegate = delegate
        self.currentCharacter = character
        btnStar.setImage(isFavorites ? UIImage(named: "starFill") : UIImage(named: "rates"), for: .normal)
        btnArrowDown.isHidden = false
        if let url = URL(string: character.image ) {
            imgCharacter.kf.setImage(with: url, placeholder: UIImage(), options: [.transition(.fade(0.1))])
        }
        lblName.text = character.name
        lblStatus.text = character.status
        lblSpecied.text = character.species
        if let episods = character.episodes {
            if episods.count > 0 {
            lblEpisode.text = episods[0].name
            }else {
                lblEpisode.text = ""
            }
        }
    }

    @IBAction func btnStarPressed(_ sender: Any) {
        
        if StoringData.favorites?.contains(where: { $0.id == currentCharacter?.id}) ?? false {
            btnStar.setImage(UIImage(named: "rates"), for: .normal)
        }else {
            btnStar.setImage(UIImage(named: "starFill"), for: .normal)
        }
        delegate?.characterAddedToFavorite(cell: self)
    }
    
    @IBAction func btnArrowDownPressed(_ sender: Any) {
        btnArrowDown.isHidden = true
        mainView.snp.makeConstraints { (make) in
            cnsMainViewHeight = make.height.equalTo(259.0).priority(999).constraint
        }
        delegate?.changeHeightTo()
    }
    @IBAction func btnArrowUpPressed(_ sender: Any) {
        btnArrowDown.isHidden = false
        mainView.snp.makeConstraints { (make) in
            cnsMainViewHeight = make.height.equalTo(162.0).priority(999).constraint
        }
        delegate?.changeHeightTo()
    }
    
}
