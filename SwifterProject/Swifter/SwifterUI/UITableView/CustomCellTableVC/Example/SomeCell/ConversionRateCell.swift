//
//  ConversionRateCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

class ConversionRateCell: UITableViewCell, RegisterCellFromNib {
    
    static var height: CGFloat = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    @IBOutlet weak var inputTF: UITextField!
    @IBAction func introduceButtonClick(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
