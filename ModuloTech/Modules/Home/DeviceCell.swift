//
//  DeviceCell.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit

class DeviceCell: UITableViewCell {
    
    @IBOutlet weak var labelDeviceName: UILabel!
    @IBOutlet weak var labelProductType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(item: Device) {
        self.labelDeviceName.text = item.deviceName
        self.labelProductType.text = item.productType
    }
    
}
