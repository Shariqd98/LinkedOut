//
//  SettingToggleTableViewCell.swift
//  Group18Alpha
//
//  Created by kvaldez on 4/12/18.
//  Copyright © 2018 CS329E. All rights reserved.
//

import UIKit

class SettingToggleTableViewCell: UITableViewCell {
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var toggleSetting: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
