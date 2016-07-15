//
//  SecondViewController.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/7/13.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class ButtonBarExampleViewController: ButtonBarPagerTabStripViewController {
    
    var isReload = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBarView.selectedBar.backgroundColor = .orangeColor()
        buttonBarView.backgroundColor = UIColor(red: 7/255, green: 185/255, blue: 155/255, alpha: 1)
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = TableChildExampleViewController(style: .Plain, itemInfo: "Table View")
        let child_2 = ChildExampleViewController(itemInfo: "View")
        let child_3 = TableChildExampleViewController(style: .Grouped, itemInfo: "Table View 2")
        let child_4 = ChildExampleViewController(itemInfo: "View 2")
        let child_5 = TableChildExampleViewController(style: .Plain, itemInfo: "Table View 3")
        let child_6 = ChildExampleViewController(itemInfo: "View 3")
        let child_7 = TableChildExampleViewController(style: .Grouped, itemInfo: "Table View 4")
        let child_8 = ChildExampleViewController(itemInfo: "View 4")
        
        guard isReload else {
            return [child_1, child_2, child_3, child_4, child_5, child_6, child_7, child_8]
        }

        var childViewControllers = [child_1, child_2, child_3, child_4, child_6, child_7, child_8]
        
        for (index, _) in childViewControllers.enumerate(){
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index{
                swap(&childViewControllers[index], &childViewControllers[n])
            }
        }
        let nItems = 1 + (rand() % 8)
        return Array(childViewControllers.prefix(Int(nItems)))
    }
    
    override func reloadPagerTabStripView() {
        isReload = true
        if rand() % 2 == 0 {
            pagerBehaviour = .Progressive(skipIntermediateViewControllers: rand() % 2 == 0 , elasticIndicatorLimit: rand() % 2 == 0 )
        }
        else {
            pagerBehaviour = .Common(skipIntermediateViewControllers: rand() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }
}
