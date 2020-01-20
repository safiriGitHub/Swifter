//
//  CustomCellTableVC.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/13.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

protocol CustomCellTableVCDelegate: NSObjectProtocol {
    
    func customCellTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, tagString: String) -> UITableViewCell
    func customCellTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func customCellTableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
}

class CustomCellTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - UI
    func configTableView() {
        
        tableView.tag = tableTag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        //tableView.separatorColor = UIColor.appTextColor4
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaInsets)
            } else {
                make.top.equalTo(topLayoutGuide.snp.top)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(bottomLayoutGuide.snp.bottom)
            }
        }
    }
    
    func registerCell<T: UITableViewCell>(cell: T.Type) where T:RegisterCellFromNib {
        tableView.zs_registerCell(cell: cell)
    }
    func reloadData() {
        tableView.reloadData()
    }
    
    //MARK: - delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        changeHeightCallback?(allHeight)
        return cellCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var tag = ""
        if indexPath.row < cellTagArray.count {
            tag = cellTagArray[indexPath.row]
        }
        if let cell = customCellDelegate?.customCellTableView(tableView, cellForRowAt: indexPath, tagString: tag) {
            return cell
        }else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        customCellDelegate?.customCellTableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return customCellDelegate?.customCellTableView(tableView, viewForHeaderInSection: section)
    }
    
    
    //MARK: - params
    var cellCount: Int = 0
    var cellTagArray: [String] = []
    var tableTag: Int = 0 {
        willSet {
            tableView.tag = newValue
        }
    }
    var sectionTitle: String = ""
    var cellHeight: Float = 50
    var headerHeight: Float = 0
    var allHeight: Float {
        get {
            cellHeight * Float(cellCount) + headerHeight
        }
    }
    var changeHeightCallback:((_ height: Float)->Void)?
    
    let tableView: UITableView = UITableView()
    
    weak var customCellDelegate: CustomCellTableVCDelegate?
}
