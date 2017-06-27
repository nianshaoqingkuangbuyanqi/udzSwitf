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
        //首页
        let indexVCL = UBIndexVCL.init()
        let indexNCL = UBBaseNCL.init(rootViewController: indexVCL)
        indexNCL.tabBarItem.title = "首页"
        
        indexNCL.tabBarItem.image = UIImage.init(named: "推荐未选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        indexNCL.tabBarItem.selectedImage = UIImage.init(named: "推荐已选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        indexNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_GREY_LIGHT_FONT], for: UIControlState.normal)
        indexNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_BLACK_FONT], for:UIControlState.selected)
        var nclArray:[UBBaseNCL] = [indexNCL]
        
        //创意社
        let communityVCL = UBOriginalityCommunityVCL.init()
        let communityNCL = UBBaseNCL.init(rootViewController: communityVCL)
        communityNCL.tabBarItem.title = "创意社"
        communityNCL.tabBarItem.image = UIImage.init(named: "社区未选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        communityNCL.tabBarItem.selectedImage = UIImage.init(named: "社区已选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        communityNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_GREY_LIGHT_FONT], for: UIControlState.normal)
        communityNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_BLACK_FONT], for: UIControlState.selected)
        nclArray.append(communityNCL)
        
        //购物车
        let shoppingCartVCL = UBShoppingCartVCL.init()
        let shoppingCartNCL = UBBaseNCL.init(rootViewController: shoppingCartVCL)
        shoppingCartNCL.tabBarItem.title = "购物车"
        shoppingCartNCL.tabBarItem.image = UIImage.init(named: "购物车未选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        shoppingCartNCL.tabBarItem.selectedImage = UIImage.init(named: "购物车已选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        shoppingCartNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_GREY_LIGHT_FONT], for: UIControlState.normal)
        shoppingCartNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_BLACK_FONT], for: UIControlState.selected)
        nclArray.append(shoppingCartNCL)
        
        //我的
        let mineVCL = UBMineVCL.init()
        let mineNCL = UBBaseNCL.init(rootViewController: mineVCL)
        mineNCL.tabBarItem.title = "我的"
        mineNCL.tabBarItem.image = UIImage.init(named: "我的未选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mineNCL.tabBarItem.selectedImage = UIImage.init(named: "我的已选择")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mineNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_GREY_LIGHT_FONT], for: UIControlState.normal)
        mineNCL.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:COLOR_BLACK_FONT], for: UIControlState.selected)
        nclArray.append(mineNCL)
        
        self.viewControllers = nclArray
        
    }
    
    
}
