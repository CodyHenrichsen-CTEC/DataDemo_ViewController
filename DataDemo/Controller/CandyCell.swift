//
//  CandyCell.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 10/23/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import SwiftUI

struct CandyCell: View
{
    var candy : String
    var score : Double
    
    var body: some View
    {
        HStack
        {
            Text("🍭")
            Spacer()
            Text(candy)
            Spacer()
            Text("\(score)%")
        }
    }
}

struct CandyCell_Previews: PreviewProvider
{
    static var previews: some View
    {
        CandyCell(candy : "Sour Gummy Stuff", score : 93.0)
    }
}
