//
//  BucketStore.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 10/2/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import Combine
import Foundation

class BucketStore : ObservableObject
{
    @Published var buckets : [BucketListItem]
    {
        didSet //We have changed the value so we need to save!!!!
        {
            let encoder = JSONEncoder()
            if let encodedBuckets = try? encoder.encode(buckets)
            {
                UserDefaults.standard.set(encodedBuckets, forKey: "saved buckets")
            }
        }
    }
    
    init(buckets : [BucketListItem] = [])
    {
        if let stored = UserDefaults.standard.data(forKey: "saved buckets")
        {
            let decoder = JSONDecoder()
            if let savedBuckets = try? decoder.decode([BucketListItem].self, from: stored)
            {
                if (savedBuckets.count != 0)
                {
                    self.buckets = savedBuckets
                    return
                }
            }
        }

        self.buckets = buckets
    }
}
