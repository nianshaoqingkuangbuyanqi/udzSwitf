//
//  UBHomeTabbarVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/26.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit

class UBHomeTabbarVCL: UBBaseTCL {

    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化tabbar
        initTabbarVCL()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTabbarVCL() -> Void {
       let mainVCL = UBMainVCL.init()
       let mainNCL = UBBaseNCL.init(rootViewController: mainVCL)
       mainVCL.tabBarItem.title = "首页"
       let nclArray:[UBBaseNCL] = [mainNCL]
        self.viewControllers = nclArray
    }
    

}
