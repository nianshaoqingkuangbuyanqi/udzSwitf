//
//  UBOriginalityCommunityVCL.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/27.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit
import Alamofire

class UBOriginalityCommunityVCL: UBBaseVCL,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var dataArray:[AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置title
        self.title = "创意社"
        
        //获取数据
        obtainCommunityData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 获取创意社数据
    func obtainCommunityData() {
        let params:Parameters = ["pageSize":pageSize,"currentPage":currentPage]
        Alamofire.request(COMMUNITY_HOME, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result {
            case .success(let dic):
                print(dic)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //创建tableview
    func createTableView() {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT), style: UITableViewStyle.grouped);
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    //tableview的代理函数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100000000
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        return cell
    }
    
    
}
