//
//  SnapkitScrollView.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/11/30.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit
import SnapKit

enum ScrollDirection {
    case ScrollVertically, ScrollHorizontally
}

class SnapKitScrollView: UIScrollView {
    //MARK: - params-public
    /// 设置为滚动方向 默认为纵向
    var direction = ScrollDirection.ScrollVertically
    
    /// contentView的子View数目
    lazy var allViewsCount: Int = {
        return self.contentView.subviews.count
    }()
    
    /// scrollView的容器View，自定义的视图添加到上面
    lazy var contentView: UIView = {
        //初始化方法先放到这里。
        let view = UIView()
        self.addSubview(view)
        if direction == .ScrollHorizontally {
            view.snp_makeConstraints { (make) in
                make.edges.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }else {
            view.snp_makeConstraints { (make) in
                make.edges.equalToSuperview()
                make.centerX.equalToSuperview()
            }
        }
        return view
    }()
    
    //MARK: - params-private
    var allPageCount: Int = 0
    private var lastContentViewWidthConstraint: Constraint?
    private var lastTrailingConstraint: Constraint?
    private var contentViewWidthConstraint: Constraint?
    private var lastBottomConstraint: Constraint?
    //MARK: - params-public
    
    //MARK: - init
    required override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - funcs
    
    /// 添加水平切换页面的多个view  direction=ScrollHorizontally pagingEnabled = NO
    /// - Parameter views: view数组
    func addHorizontallyScrollViews(_ views: [UIView]) {
        let count = views.count
        allPageCount = count
        self.contentView.snp_updateConstraints { (make) in
            if let lc = lastContentViewWidthConstraint {//是否还有存在的必要？
                lc.uninstall()
                lastContentViewWidthConstraint = make.width.equalTo(self).multipliedBy(count).constraint
            }
        }
        
        for i in 0..<count {
            let view = views[i]
            contentView.addSubview(view)
            view.snp_makeConstraints { (make) in
                if i == 0 {
                    make.leading.equalToSuperview()
                }else {
                    make.left.equalTo(contentView.subviews[i-1].snp_right)
                }
                if i == count-1 {
                    lastTrailingConstraint = make.trailing.equalToSuperview().constraint
                }
                make.top.bottom.equalToSuperview()
                make.width.equalTo(self)
            }
        }
    }
    
    /// 添加水平切换页面的单个view 此方法还无法使用
    /// - Parameter view: 单个view
    func addHorizontallyScrollView(_ view: UIView) {
        allPageCount += 1
        contentView.snp_updateConstraints { (make) in
            if let lc = lastContentViewWidthConstraint {
                lc.uninstall()
            }
            lastContentViewWidthConstraint = make.width.equalTo(self).multipliedBy(allPageCount).constraint
        }
        contentView.addSubview(view)
        
        view.snp_makeConstraints { (make) in
            if allPageCount == 1 {
                make.leading.equalToSuperview()
            }else {
                make.left.equalTo(contentView.subviews[allViewsCount-2].snp_right)
            }
            if let lc = lastTrailingConstraint {
                lc.uninstall()
            }
            lastTrailingConstraint = make.trailing.equalToSuperview().constraint
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self)
        }
    }
    
    
    /// 添加一定数量的View 上下滚动 高度为0,将高度约束
    /// - Parameter views: views
    func addVerticallyViews(_ views: [UIView]) {
        let count = views.count
        allPageCount = count
        for i in 0..<count {
            let view = views[i]
            contentView.addSubview(view)
            view.snp_makeConstraints { (make) in
                if i == 0 {
                    make.top.equalToSuperview()
                }else {
                    make.top.equalTo(views[i-1].snp_bottom)
                }
                if i == count-1 {
                    lastBottomConstraint = make.bottom.equalToSuperview().constraint
                }
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }
    }
}
