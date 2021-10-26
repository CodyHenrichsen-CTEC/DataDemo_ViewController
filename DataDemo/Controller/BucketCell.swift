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
    @State var starColor : Color = .clear
    
    var icon : String
    var content : String
    var author : String
    
    init(icon:String, content:String, author:String)
    {
        self.icon = icon
        self.content = content
        self.author = author
    }
    
    var body: some View
    {
        NavigationLink(destination: BucketDetail(author: author, content: content, emoji: icon))
        {
            HStack
            {
                Text(icon)
                VStack
                {
                    Text(content)
                    Text(author)
                }
                Spacer()
                Image(systemName: "star.fill")
                    .imageScale( .small)
                    .foregroundColor(starColor)
            }
            
        }
        .onLongPressGesture {
            self.alternateStar()
        }
        
    }
    
    private func alternateStar()
    {
        if (starColor == .clear)
        {
            starColor = .purple
        }
        else
        {
            starColor = .clear
        }
    }
    
}

struct BucketCell_Previews: PreviewProvider
{
    static var previews: some View
    {
        BucketItemCell(icon:"🤢", content:"lots of words go here", author:"Name")
    }
}
