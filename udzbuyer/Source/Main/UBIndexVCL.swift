//
//  UBMainVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/26.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit
import MJRefresh
import WebViewJavascriptBridge

class UBIndexVCL: UBBaseVCL,UIWebViewDelegate {

    var webview:UIWebView!
    var bridge:WebViewJavascriptBridge!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置背景色
        self.view.backgroundColor = UIColor.white
        
        //添加webview
        initWebView()
        
        //加载webview
        webview.scrollView.mj_header.beginRefreshing()
        
        //为webview注册和JS交互事件
        registerHandleWebviewWithJS()
        
        // Do any additional setup a
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
        //为webview添加useragent 
        addUserAgentForWebview()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
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
    
    //MARK: 为webview注册和JS交互事件
    func registerHandleWebviewWithJS() -> Void {
        
        bridge = WebViewJavascriptBridge.init(forWebView: webview)
        bridge.setWebViewDelegate(self)
        bridge.registerHandler("openProduct") { ( data, responseback) in
            
            print(data ?? "这难道是空？")
            
            let dic:[String:AnyObject] = data as! [String : AnyObject]
            let detail = UBGoodDetailVCL()
            detail.param!["id"] = dic["id"]
            self.navigationController?.pushViewController(detail, animated: true)
        }
        
        //注册搜索
        bridge.registerHandler("search") { (data, responseCallBack) in
            
        }
    }
    
    //MARK: webview 代理事件
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webview.scrollView.mj_header.endRefreshing()
        
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webview.scrollView.mj_header.endRefreshing()
    }
    
    
    //MARK: 为webview添加useragent
    func addUserAgentForWebview() {
        let webview = UIWebView.init()
        //获取oldagent
        let oldAgent = webview.stringByEvaluatingJavaScript(from: "navigator.userAgent")
        
        //循环old agent 中的每个值
        let oldFiled = oldAgent?.components(separatedBy: " ")
        var newAgent:String! = ""
        var index = 0
        while index < oldFiled!.count {
            if index == 0 {
                newAgent.append(oldFiled![index])
            } else {
                newAgent.append(" \(oldFiled![index])")
            }
            index += 1;
        }
        
        let dm = UBDataModelSigleTon.init()
        
        //添加appToken
        if (dm.staticData.appToken?.characters.count) ?? 0 > 0 {
            newAgent.append(" appToken\(dm.staticData.appToken!)")
        }
        
        //添加deviceId
        newAgent.append(" deviceId\(dm.uuid)")
        
        //添加udzbuyer 标识
        newAgent.append(" udzbuyer")
        
        //register new agent
        let dictionary = ["UserAgent":newAgent]
        UserDefaults.standard.register(defaults: dictionary as [String:AnyObject])
    }
    
    
}





