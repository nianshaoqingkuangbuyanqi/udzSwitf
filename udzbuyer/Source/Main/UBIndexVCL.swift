//
//  UBMainVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/26.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit
import MJRefresh

class UBIndexVCL: UBBaseVCL,UIWebViewDelegate {

    var webview:UIWebView!
    var refreshControl:UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置背景色
        self.view.backgroundColor = UIColor.white
        
        //添加webview
        initWebView()
        
        //加载webview
        webview.scrollView.mj_header.beginRefreshing()
        
        // Do any additional setup a
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
    }
    
    //MARK: 初始化webview
    func initWebView () {
        
        //初始化webview
        webview = UIWebView.init(frame: CGRect.init(x: 0, y:STATUS_BAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - TABBAR_HEIGHT - STATUS_BAR_HEIGHT))
        //加载请求
        let url = URL.init(string: SEVER_INDEX)
        let request = URLRequest.init(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 60.0)
        webview.backgroundColor = UIColor.white
        webview.isOpaque = false
        webview.delegate = self
        self.view.addSubview(webview!)
        //添加刷新
        webview.scrollView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.webview.loadRequest(request)
        })
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webview.scrollView.mj_header.endRefreshing()
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webview.scrollView.mj_header.endRefreshing()
    }
    
}





