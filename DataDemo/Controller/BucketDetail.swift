//
//  BucketDetail.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 9/30/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct BucketDetail: View
{
    @Binding var bucketItem : BucketListItem
//    let author : String
//    let content : String
    let emoji : String
    
    
    var body: some View
    {
        ZStack
        {
            Image("bucket")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .contrast(0.2)
            VStack
            {
                EmojiLogo(emoji: emoji)
                Text(bucketItem.creature)
                Text(bucketItem.goal)
            }
        }
        
    }
}

//struct BucketDetail_Previews: PreviewProvider
//{
//
//    static var previews: some View
//    {
//        BucketDetail(BucketListItem(id: "demo", year: 123, creature: "ghost", goal: "test"), emoji: "🤬")
//    }
//}
