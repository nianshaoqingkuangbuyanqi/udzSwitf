//
//  HttpRequest.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/6/27.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import Foundation

//MARK: SEVER HOST


#if Debug
    
    //首页地址
let SEVER_INDEX = "http://mtest2.udz.com"
    
    //SEVER_HOST'
let SEVER_HOST = "http://testsup2.udz.com:9090/dzwindapi"
    
#else
    
    //首页地址
let SEVER_INDEX = "http://m.udz.com"
    
    //SEVER_HOST'
let SEVER_HOST = "http://appapi.udz.com"
    
#endif
//社区首页
let COMMUNITY_HOME = "\(SEVER_HOST)/_snsindex"


