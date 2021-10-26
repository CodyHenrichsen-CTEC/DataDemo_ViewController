//
//  DataView.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 9/30/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct DataView: View
{
    @ObservedObject var bucketStore : BucketStore = BucketStore(buckets: bucketData)
    @ObservedObject var candyStore : CandyStore = CandyStore(candy : candyData)
    //Make an @ObservedObject like bucketStore but for your 538 data object
    
    @Environment(\.presentationMode) var presentation
    @State var showAddItem : Bool = false
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                //If your data source is Identifiable
                Section(header: Text("Bucket List Items"))
                {
                    ForEach(bucketStore.buckets)
                    {
                        bucket in

                        BucketItemCell(currentBucket: bucket, icon: self.generateRandomEmoji(ofType: self.randomString()))
                    }
                    .onDelete(perform: removeItems)
                }
                //If your data source is NOT Identifiable!
                Section(header: Text("other data section"))
                {
                    ForEach(candyData.indices)
                    {
                        index in
                        
                        CandyCell(candy: candyData[index].candyName, score: candyData[index].winpercent) 
                    }
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: Button( action: { self.showAddItem.toggle() } ) { Image(systemName: "plus") } )
        }
        .sheet(isPresented: $showAddItem)
        {
            AddBucketItem(bucketStore: self.bucketStore)
        }
    }
    
    private func removeItems(at offsets: IndexSet) -> Void
    {
        bucketStore.buckets.remove(atOffsets: offsets)
    }
    
    private func randomString() -> String
    {
        let choice = arc4random()
        
        if (choice % 3 == 0)
        {
            return "person"
        }
        else if (choice % 2 == 0)
        {
            return "animal"
        }
        else
        {
            return "symbol"
        }
    }
    
    private func generateRandomEmoji(ofType emojiType : String) -> String
    {
        
        let start : Int
        let range : Int
        
        if (emojiType == "person")
        {
            start = 0x1F601
            range = 79
        }
        else
        {
            start = 0x1F400
            range = 52
        }
        
        let unicodeValue = start + Int(arc4random_uniform(UInt32(range)))
        let currentEmoji = UnicodeScalar(unicodeValue)?.description ?? "broken"
        
        return currentEmoji
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DataView(bucketStore: BucketStore(buckets: bucketData))
    }
}
