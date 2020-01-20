//
//  CustomInputTFCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/13.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit
import Hue

/// 根据具体业务自定义 
class CustomInputTFCell: UITableViewCell, RegisterCellFromNib {
    
    static var height: CGFloat = 50
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var accessoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        accessoryImageView.isHidden = true
    }
    
    enum inputCellStyle {
        case normal
        case starNormal
        case starImportant
    }
    func configUIStyle(_ style: inputCellStyle) {
        
        if style == .normal {
            titlelabel.textColor = UIColor(hex: "666666")
            starImageView.isHidden = true
        }else if style == .starNormal {
            titlelabel.textColor = UIColor(hex: "666666")
            starImageView.isHidden = false
        }else if style == .starImportant {
            titlelabel.textColor = UIColor(hex: "131212")
            starImageView.isHidden = false
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
