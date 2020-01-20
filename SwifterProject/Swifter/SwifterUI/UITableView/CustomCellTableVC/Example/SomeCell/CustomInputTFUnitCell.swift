//
//  CustomInputTFUnitCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

class CustomInputTFUnitCell: UITableViewCell, RegisterCellFromNib {
    
    static var height: CGFloat = 50
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
