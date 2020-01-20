//
//  CustomGoodsUnitCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

class CustomGoodsUnitCell: UITableViewCell, RegisterCellFromNib {
    
    static var height: CGFloat = 50
    @IBOutlet weak var tonButton: UIButton!
    @IBOutlet weak var CubicmetersButton: UIButton!
    @IBOutlet weak var CarButton: UIButton!
//    var goodsUnitSelect: ((_ type: GoodUnitType)->Void)?
    
    @IBAction func tonButtonClick(_ sender: Any) {
        normal(tonButton, CubicmetersButton, CarButton)
        highlighted(tonButton)
//        goodsUnitSelect?(.TonUnit)
    }
    @IBAction func CubicmetersButtonClick(_ sender: Any) {
        normal(tonButton, CubicmetersButton, CarButton)
        highlighted(CubicmetersButton)
//        goodsUnitSelect?(.CubicmetersUnit)
    }
    @IBAction func CarButtonClick(_ sender: Any) {
        normal(tonButton, CubicmetersButton, CarButton)
        highlighted(CarButton)
//        goodsUnitSelect?(.CarUnit)
    }
    func normal(_ buttons: UIButton...) {
        buttons.forEach { (button) in
//            button.appAddNormalLayer()
        }
    }
    func highlighted(_ button: UIButton) {
//        button.appAddHighlightedLayer()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        normal(tonButton, CubicmetersButton, CarButton)
        highlighted(tonButton)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
