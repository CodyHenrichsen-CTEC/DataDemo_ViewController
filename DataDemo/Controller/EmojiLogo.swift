//
//  CircleEmoji.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 9/30/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct EmojiLogo: View
{
    var emoji : String
    
    var body: some View
    {
        Text(emoji)
            .font((.system(size: 150.0)))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 10))
            .shadow(radius: 7)
    }
}

struct CircleEmoji_Previews: PreviewProvider
{
    static var previews: some View
    {
        EmojiLogo(emoji: "😻")
    }
}
