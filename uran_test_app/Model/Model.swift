//
//  Model.swift
//  uran_test_app
//
//  Created by George Heints on 07.03.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import Foundation

struct info : Decodable {
    let list : [lists]
}

struct lists : Decodable{
    let title : String?
    let images : [String]?
}
