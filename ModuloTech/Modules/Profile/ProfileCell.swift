//
//  ProfileCell.swift
//  ModuloTech
//
//  Created by Lucas Lee on 30/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ value: String) {
        
    }
    
}
