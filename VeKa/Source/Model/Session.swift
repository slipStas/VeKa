//
//  Session.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 23.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class Session {
    
    static let shared = Session()
    private init () {}
    
    var token = String()
    var userId = String()
    var login = "" // for debugging
    var password = "" // for debugging
    
}
