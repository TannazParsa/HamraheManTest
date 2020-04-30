//
//  MyBBViewController.swift
//  HamraheManTest
//
//  Created by tannaz on 4/30/20.
//  Copyright © 2020 HamraheManTest. All rights reserved.
//

//import Foundation
//import UIKit
//import XLPagerTabStrip
//
//class MyBBViewController: ButtonBarPagerTabStripViewController {
//    
//    var childs: [UIViewController]!
//    
//    var isReload = false
//    
//    
//    override func viewDidLoad() {
//        settings.style.selectedBarHeight = 2
//        
//      //  super.viewDidLoad()
//        
//        // {S} Customize tabBar
//        buttonBarView.selectedBar.backgroundColor = HamrahTestColors.purple
//        buttonBarView.backgroundColor = HamrahTestColors.darkGray
//        settings.style.selectedBarBackgroundColor = UIColor.blue
//        settings.style.buttonBarItemTitleColor = .red
//        settings.style.buttonBarItemBackgroundColor = UIColor.clear
//        changeCurrentIndexProgressive = { (oldCell : ButtonBarViewCell?, newCell : ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated : Bool) -> Void in
//            oldCell?.label.textColor = HamrahTestColors.lightGrayBackground
//            newCell?.label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
//        }
//        changeCurrentIndex = { (oldCell : ButtonBarViewCell?, newCell : ButtonBarViewCell?, animated : Bool) -> Void in
//            oldCell?.label.textColor = .darkGray
//            newCell?.label.textColor = .red
//        }
//        delegate = self
//        // {E}
//    }
//    
//    override open var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
//    
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        guard isReload else {
//            return childs
//        }
//        
//        for index in children.indices {
//            let nElements = children.count - index
//            let n = (Int(arc4random()) % nElements) + index
//            if n != index {
//                childs.swapAt(index, n)
//            }
//        }
//        let nItems = 1 + (arc4random() % 8)
//        return Array(children.prefix(Int(nItems)))
//    }
//    
//    override func reloadPagerTabStripView() {
//        isReload = true
//        if arc4random() % 2 == 0 {
//            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
//        } else {
//            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
//        }
//        super.reloadPagerTabStripView()
//    }
//    
//    
//    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
//        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
//        if (indexWasChanged) {
//            newTitleIs(childs[toIndex].title)
//        }
//    }
//    func newTitleIs(_ title: String?) {}
//    
//}
