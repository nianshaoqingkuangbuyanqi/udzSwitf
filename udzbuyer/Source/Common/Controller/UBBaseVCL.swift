//
//  UBBaseVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/26.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit

class UBBaseVCL: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置背景颜色
        self.view.backgroundColor = COLOR_BACKGROUND
        
        //自动调整页面位置关闭
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
