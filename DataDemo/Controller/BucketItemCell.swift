//
//  BucketCell.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 10/2/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct BucketItemCell: View
{
    @State var currentBucket : BucketListItem
    @State var moveOn : Bool = false
    var icon : String
    
    var body: some View
    {
        NavigationLink(destination: BucketDetail(bucketItem: $currentBucket, emoji: icon), isActive: $moveOn)
        {
            HStack
            {
                    Text(icon)
                    Spacer()
                    VStack
                    {
                            Text(currentBucket.goal)
                            Spacer()
                            Text(currentBucket.creature)
                    }
                    Spacer()
                    
            }
            .onTapGesture { self.moveOn = true }
            .onLongPressGesture(perform: change)
        }
    }

    private func change() -> Void
    {
        currentBucket.creature = "Change to what you want :D"
    }
}

struct BucketCell_Previews: PreviewProvider
{
    static var previews: some View
    {
        BucketItemCell(currentBucket: BucketListItem(id: "animaniacs", year: 123, creature: "The brain", goal: "take over the world"), icon:"🤢")
    }
}
