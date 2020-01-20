//
//  GoodsAdVC.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit


class GoodsAdVC: UIViewController, CustomCellTableVCDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新增货源"
        
        configUI()
        
    }
    
    func configUI() {
        scrollView.direction = .ScrollVertically
        scrollView.bounces = false
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        contentView1.backgroundColor = UIColor.lightText
        contentView2.backgroundColor = UIColor.lightText
        contentView3.backgroundColor = UIColor.lightText
        contentView4.backgroundColor = UIColor.lightText
        scrollView.addVerticallyViews([contentView1, contentView2, contentView3, contentView4])
        
        
        receiptDeliveryInfoVC.tableTag = 1
        contentView1.addSubview(receiptDeliveryInfoVC.view)
        receiptDeliveryInfoVC.view.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        receiptDeliveryInfoVC.customCellDelegate = self
        receiptDeliveryInfoVC.cellCount = titleArray1.count
        receiptDeliveryInfoVC.headerHeight = headerHeight
        receiptDeliveryInfoVC.registerCell(cell: CustomInputTFCell.self)
        receiptDeliveryInfoVC.changeHeightCallback = { [weak self] height in
            self?.contentView1.snp_updateConstraints { (make) in
                make.height.equalTo(height)
            }
        }
        addChild(receiptDeliveryInfoVC)
        receiptDeliveryInfoVC.reloadData()
        
        
        goodsInfoVC.tableTag = 2
        contentView2.addSubview(goodsInfoVC.view)
        goodsInfoVC.view.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        goodsInfoVC.customCellDelegate = self
        goodsInfoVC.headerHeight = headerHeight
        goodsInfoVC.cellTagArray = tagArray21
        goodsInfoVC.cellCount = tagArray21.count
        goodsInfoVC.registerCell(cell: CustomInputTFCell.self)
        goodsInfoVC.registerCell(cell: CustomGoodsUnitCell.self)
        goodsInfoVC.registerCell(cell: CustomCargooCell.self)
        goodsInfoVC.registerCell(cell: ConversionRateCell.self)
        goodsInfoVC.registerCell(cell: CustomInputTFUnitCell.self)
        goodsInfoVC.changeHeightCallback = { [weak self] height in
            self?.contentView2.snp_updateConstraints { (make) in
                make.height.equalTo(height)
            }
        }
        addChild(goodsInfoVC)
        goodsInfoVC.reloadData()
        
        
        loadUnloadInfoVC.tableTag = 3
        contentView3.addSubview(loadUnloadInfoVC.view)
        loadUnloadInfoVC.view.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        loadUnloadInfoVC.customCellDelegate = self
        loadUnloadInfoVC.headerHeight = headerHeight
        loadUnloadInfoVC.cellTagArray = tagArray3
        loadUnloadInfoVC.cellCount = tagArray3.count
        loadUnloadInfoVC.registerCell(cell: CustomInputTFCell.self)
        loadUnloadInfoVC.registerCell(cell: CustomInputTFUnitCell.self)
        loadUnloadInfoVC.changeHeightCallback = { [weak self] height in
            self?.contentView3.snp_updateConstraints { (make) in
                make.height.equalTo(height)
            }
        }
        addChild(loadUnloadInfoVC)
        loadUnloadInfoVC.reloadData()
        
        otherInfoVC.tableTag = 4
        contentView4.addSubview(otherInfoVC.view)
        otherInfoVC.view.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
        }
        otherInfoVC.customCellDelegate = self
        otherInfoVC.headerHeight = headerHeight
        otherInfoVC.cellTagArray = tagArray4
        otherInfoVC.cellCount = tagArray4.count
        otherInfoVC.registerCell(cell: CustomInputTFCell.self)
        otherInfoVC.changeHeightCallback = { [weak self] height in
            self?.contentView4.snp_updateConstraints { (make) in
                make.height.equalTo(height)
            }
        }
        addChild(otherInfoVC)
        otherInfoVC.reloadData()
      
    }
    
    //MARK: - CustomCellTableVCDelegate
    func customCellTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, tagString: String) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell", for: indexPath) as! CustomInputTFCell
            cell.configUIStyle(.normal)
            cell.titlelabel.text = titleArray1[indexPath.row]
            if indexPath.row == 0 { //发货城市
                cell.configUIStyle(.starImportant)
                cell.inputTF.placeholder = "请选择发货城市"
                cell.inputTF.isEnabled = false
            }else if indexPath.row == 1 { //详细地址
                cell.inputTF.placeholder = "请输入详细地址"
                
            }else if indexPath.row == 2 { //发货人姓名
                cell.inputTF.placeholder = "请输入发货人姓名"
               
            }else if indexPath.row == 3 { //发货人电话
                cell.inputTF.placeholder = "请输入发货人电话"
                
            }else if indexPath.row == 4 {
                cell.inputTF.placeholder = "请选择收货城市"
                cell.configUIStyle(.starImportant)
                cell.inputTF.isEnabled = false
            }else if indexPath.row == 5 {
                cell.inputTF.placeholder = "请输入详细地址"
                
            }else if indexPath.row == 6 {
                cell.inputTF.placeholder = "请输入收货人姓名"
                cell.configUIStyle(.starNormal)
                
            }else if indexPath.row == 7 {
                cell.inputTF.placeholder = "请输入收货人电话"
                cell.configUIStyle(.starNormal)
                
            }else if indexPath.row == 8 {
                cell.inputTF.placeholder = "请输入收货企业名称"
                cell.configUIStyle(.starNormal)
                
            }
            
            
            return cell
        }
        
        else if tableView.tag == 2 {
            if tagString == "goodsName" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell") as! CustomInputTFCell
                cell.configUIStyle(.starNormal)
                cell.titlelabel.text = "货物名称"
                cell.inputTF.placeholder = "请输入货物名称"
                
                return cell
            }else if tagString == "goodsUnit" {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "CustomGoodsUnitCell") as! CustomGoodsUnitCell
                //cell.goodsUnitSelect = { [weak self] (type) in
                    //self?.paramGoodUnitType = type
                //}
                return cell
            }else if tagString == "cargoo" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCargooCell") as! CustomCargooCell
                cell.cargoUnitSelect = { [weak self] (type) in
                    //self?.paramCargoUnitType = type
                }
                
                return cell
            }else if tagString == "goodsPrice" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFUnitCell") as! CustomInputTFUnitCell
                cell.titlelabel.text = "货物单价"
                cell.inputTF.placeholder = "请输入货物单价"
                
                cell.unitLabel.text = "元/吨"
                
                return cell
            }else if tagString == "conversionRate" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConversionRateCell") as! ConversionRateCell
                return cell
            }
        }
        
        else if tableView.tag == 3 {
            if tagString == "VehicleType" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell") as! CustomInputTFCell
                cell.titlelabel.text = "车辆类型"
                cell.inputTF.placeholder = "请选择车辆类型"
                cell.inputTF.isEnabled = false
                cell.configUIStyle(.starNormal)
                cell.accessoryImageView.isHighlighted = false
                return cell
                
            }else if tagString == "FreightUnitPrice" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFUnitCell") as! CustomInputTFUnitCell
                cell.starImageView.isHidden = false
                cell.titlelabel.text = "运费单价"
                cell.inputTF.placeholder = "请输入运费单价"
                //cell.unitLabel.text = goodsUnitName
                return cell
            }else if tagString == "FreightCalculationRules" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell") as! CustomInputTFCell
                cell.titlelabel.text = "运费计算规则"
                cell.inputTF.placeholder = "请选择运费计算规则"
                cell.inputTF.isEnabled = false
                cell.configUIStyle(.starNormal)
                cell.accessoryImageView.isHighlighted = false
                return cell
            }else if tagString == "LoadFee" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFUnitCell") as! CustomInputTFUnitCell
                cell.starImageView.isHidden = false
                cell.titlelabel.text = "装车费"
                cell.inputTF.placeholder = "请输入装车费"
                cell.unitLabel.text = "元"
                return cell
            }else if tagString == "UnloadFee" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFUnitCell") as! CustomInputTFUnitCell
                cell.starImageView.isHidden = false
                cell.titlelabel.text = "卸车费"
                cell.inputTF.placeholder = "请输入卸车费"
                cell.unitLabel.text = "元"
                return cell
            }
        }
        else if tableView.tag == 4 {
            if tagString == "note" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell") as! CustomInputTFCell
                cell.titlelabel.text = "备注"
                cell.inputTF.placeholder = "请输入备注"
                cell.configUIStyle(.normal)
                return cell
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomInputTFCell") as! CustomInputTFCell
        return cell
    }
    
    func customCellTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1 {
            if indexPath.row == 0 {
                //选择发货城市
                
            }else if indexPath.row == 4 {
                //选择收货城市
                
            }
         }
        else if tableView.tag == 3 {
            if indexPath.row == 0 {
                //车辆类型
                
            }else if indexPath.row == 2 {
                //运费计算规则
                
            }
        }
    }
    
    func customCellTableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 0 {
            return nil
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: CGFloat(headerHeight)))
        view.backgroundColor = UIColor.white
        
        let grayLine = UIView()
        grayLine.backgroundColor = UIColor.lightText
        view.addSubview(grayLine)
        
        let conView = UIView()
        view.addSubview(conView)
        
        let label = UILabel()
        if tableView.tag == 1 {
            label.text = "收发货信息"
        }else if tableView.tag == 2 {
            label.text = "货物信息"
        }else if tableView.tag == 3 {
            label.text = "装运信息"
        }else if tableView.tag == 4 {
            label.text = "其他信息"
        }
        label.textColor = UIColor.darkText
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        conView.addSubview(label)
        let v = UIView()
        v.backgroundColor = UIColor.blue
        conView.addSubview(v)
        
        grayLine.snp_makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(15)
        }
        conView.snp_makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(grayLine.snp_bottom)
        }
        v.snp_makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 4, height: 12))
        }
        label.snp_makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        return view
    }
    
    //MARK: - params
    //MARK:UI
    let scrollView = SnapKitScrollView(frame: .zero)
    let contentView1 = UIView()
    let contentView2 = UIView()
    let contentView3 = UIView()
    let contentView4 = UIView()
    let headerHeight: Float = 45
    
    //MARK:收发货信息
    let receiptDeliveryInfoVC = CustomCellTableVC()
    let titleArray1 = ["发货城市", "详细地址", "发货人姓名", "发货人电话", "收货城市", "详细地址", "收货人姓名", "收货人电话", "收货企业名称"]
    var paramSendCity = ""
    var paramSendAddress = ""
    var paramSendName = ""
    var paramSendPhone = ""
    var paramReceiveCity = ""
    var paramReceiveAddress = ""
    var paramReceiveName = ""
    var paramReceivePhone = ""
    var paramReceiveCompany = ""
    
    //MARK:货物信息
    let goodsInfoVC = CustomCellTableVC()
    //let titleArray21 = ["货物名称", "货物单位", "合理货损", "货物单价"]
    let tagArray21 = ["goodsName", "goodsUnit", "cargoo", "goodsPrice"]
    //let titleArray22 = ["货物名称", "货物单位", "换算率"]
    let tagArray22 = ["goodsName", "goodsUnit", "conversionRate"]
    var paramGoodsName = ""
//    var paramGoodUnitType: GoodUnitType = .TonUnit {
//        willSet {
//            if newValue == paramGoodUnitType {
//                return
//            }
//            if newValue == .TonUnit {
//                goodsInfoVC.cellTagArray = tagArray21
//                goodsInfoVC.cellCount = tagArray21.count
//            }else if newValue == .CubicmetersUnit || newValue == .CarUnit {
//                goodsInfoVC.cellTagArray = tagArray22
//                goodsInfoVC.cellCount = tagArray22.count
//            }
//            goodsInfoVC.reloadData()
//            loadUnloadInfoVC.reloadData()
//        }
//    }
    var paramCargo = ""
//    var paramCargoUnitType: CargoUnitType = .TonUnit
    var paramGoodsPrice = ""
    var paramConversionRate = ""
//    var goodsUnitName: String {
//        get {
//            switch paramGoodUnitType {
//            case .TonUnit:
//                return "元/吨"
//            case .CubicmetersUnit:
//                return "元/立方米"
//            case .CarUnit:
//                return "元/车"
//            }
//        }
//    }
    //MARK: 装运信息
    let loadUnloadInfoVC = CustomCellTableVC()
    //let titleArray3 = ["车辆类型", "运费单价", "运费计算规则", "装车费", "卸车费"]
    let tagArray3 = ["VehicleType", "FreightUnitPrice", "FreightCalculationRules", "LoadFee", "UnloadFee"]
    var paramVehicleType = ""
    var paramFreightUnitPrice = ""
    var paramFreightCalculationRules = ""
    var paramLoadFee = ""
    var paramUnloadFee = ""
    
    //MARK: 其他信息
    let otherInfoVC = CustomCellTableVC()
    //let titleArray3 = ["备注"]
    let tagArray4 = ["note"]
    var paramNote = ""
    
    
    //let disposeBag = DisposeBag()
}
