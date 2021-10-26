//
//  AddBucketView.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 10/29/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct AddBucketItem: View
{
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var bucketStore : BucketStore
    @State var author : String = ""
    @State var bucketItem : String = ""

    var body: some View
    {
        Form
        {
            Section(header: Text("New BucketItem info")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center))
            {
                InputField(title: "Creature", hint: "What creature made the goal", result: $author)
                InputField(title: "Goal", hint: "What Goal??", result: $bucketItem)
            }
            Button("Add a BucketItem!", action: addBucketItem)
                .padding(.horizontal, 100.0)
            
        }
    }
    
    private func addBucketItem() -> Void
    {
        let year = Calendar.current.component(.year, from: Date())
        let coolNewBucketItem = BucketListItem(id: UUID().uuidString, year: year, creature: author, goal: bucketItem)
        bucketStore.buckets.insert(coolNewBucketItem, at: 0)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct InputField : View
{
    let title : String
    let hint : String
    
    @Binding var result : String
    
    var body : some View
    {
        VStack(alignment: .leading)
        {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .disableAutocorrection(true) //To fix Apple layout bug
            TextField(hint, text: $result)
                .disableAutocorrection(true) //To fix Apple layout bug
        }
    }
}

