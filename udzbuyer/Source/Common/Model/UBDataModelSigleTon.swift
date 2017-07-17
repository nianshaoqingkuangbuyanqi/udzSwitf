//
//  UBDataModelSigleTon.swift
//  udzbuyer
//
//  Created by mayibailing1 on 2017/7/5.
//  Copyright © 2017年 mayi121. All rights reserved.
//

import UIKit

class UBDataModelSigleTon: NSObject {
    var staticData:UBStaticData! = nil
    var uuid:String! = nil
    override init() {
        super.init()
        staticData = UBStaticData()
        uuid = "1234567890098765"
    }
    
}
