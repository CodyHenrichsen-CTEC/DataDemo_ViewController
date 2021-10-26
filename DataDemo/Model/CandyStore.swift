//
//  CandyStore.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 10/23/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import Combine

class CandyStore : ObservableObject
{
    @Published var candy : [CandyRank]
    
    init(candy : [CandyRank] = [])
    {
        self.candy = candy
    }
}
