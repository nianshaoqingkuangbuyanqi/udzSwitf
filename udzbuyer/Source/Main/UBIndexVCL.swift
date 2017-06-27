//
//  UBMainVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/26.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit
import WebKit

class UBIndexVCL: UBBaseVCL {

    var webview:WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置title 
        self.title = "首页"
        //添加webview
        initWebView()
        
        
        // Do any additional setup a
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 初始化webview
    func initWebView () {
        webview = WKWebView.init(frame: CGRect.init(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT), configuration: WKWebViewConfiguration.init())
        
        self.view.addSubview(webview!)
    }
    
    
}
