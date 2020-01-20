//
//  CustomCargooCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

class CustomCargooCell: UITableViewCell, RegisterCellFromNib {
    
    static var height: CGFloat = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        normal(tonButton, micrometerButton)
        highlighted(tonButton)
    }
    
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var tonButton: UIButton!
    @IBOutlet weak var micrometerButton: UIButton!
    var cargoUnitSelect: ((_ type: Int)->Void)?
    
    @IBAction func tonButtonClick(_ sender: Any) {
        normal(tonButton, micrometerButton)
        highlighted(tonButton)
        cargoUnitSelect?(1)
    }
    @IBAction func micrometerButtonClick(_ sender: Any) {
        normal(tonButton, micrometerButton)
        highlighted(micrometerButton)
        cargoUnitSelect?(2)
    }
    
    func normal(_ buttons: UIButton...) {
        buttons.forEach { (button) in
            var layer = CALayer()
            if let oldlayer = button.layer.sublayers?[0] {
                layer = oldlayer
            }else {
                button.layer.addSublayer(layer)
            }
            
            layer.frame = button.bounds
            layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            layer.shadowOffset = CGSize(width: 0, height: 1)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = 4
        }
    }
    func highlighted(_ button: UIButton) {
        var layer = CALayer()
         if let oldlayer = button.layer.sublayers?[0] {
             layer = oldlayer
         }else {
             button.layer.addSublayer(layer)
         }
        
         layer.frame = button.bounds
         layer.backgroundColor = UIColor.blue.cgColor
         layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
         layer.shadowOffset = CGSize(width: 0, height: 1)
         layer.shadowOpacity = 0.25
         layer.shadowRadius = 4
         layer.borderColor = UIColor.blue.cgColor
         layer.cornerRadius = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
