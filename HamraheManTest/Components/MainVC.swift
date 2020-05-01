//
//  MainVC.swift
//  HamraheManTest
//
//  Created by tannaz on 5/1/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    // refresh
       var isRefreshing    = false
       var isLoadingMore   = false
       var loadedAll       = false
    var refreshControl  = UIRefreshControl()

    func initRefreshControl(_ tableView: UITableView, color: UIColor? = nil) {
        if refreshControl.superview != nil {
            return
        }
        if color == nil {
            refreshControl.tintColor = .white
        }
        refreshControl.removeTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.removeFromSuperview()
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender:AnyObject) {
        isRefreshing = true
    }
    
    func endRefreshing() {
        if isRefreshing {
            isRefreshing = false
        }
        refreshControl.endRefreshing()
    }
    func endLoadingMore() {
        isLoadingMore = false
    }
    
}
