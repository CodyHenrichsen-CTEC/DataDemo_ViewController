//
//  BucketListItem.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 9/30/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import Foundation

struct BucketListItem : Codable, Identifiable
{
    var id : String
    var year : Int
    var creature : String
    var goal : String
}

