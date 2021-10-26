//
//  BucketData.swift
//  DataDemo
//
//  Created by Cody Henrichsen on 9/30/20.
//  Copyright © 2020 CTEC. All rights reserved.
//

import Foundation

var bucketData : [BucketListItem] = loadJSON(from: "bucketList.json") as! [BucketListItem]
var candyData : [CandyRank] = loadJSON(from: "candy.json") as! [CandyRank]

func loadJSON (from file : String) -> [Any]
{
    if let dataURL = Bundle.main.url(forResource: file, withExtension: "json")
    {
        let data = try! Data(contentsOf: dataURL)
        let decoder = JSONDecoder()
        
        if (file == "candy")
        {
            do
            {
                let results = try decoder.decode([CandyRank].self, from: data)
                return results
            }
            catch
            {
                print (error.localizedDescription)
            }
        }
        else if (file == "bucketList")
        {
            do
            {
                let results = try decoder.decode([BucketListItem].self, from: data)
                return results
            }
            catch
            {
                print (error.localizedDescription)
            }
        }
    }
    return [] //Data load Failure!!!
}

func load538JSON (from file : String) -> [CandyRank]
{
    if let dataURL = Bundle.main.url(forResource: file, withExtension: nil)
    {
        let data = try! Data(contentsOf: dataURL)
        let decoder = JSONDecoder()
        do
        {
            let results = try decoder.decode([CandyRank].self, from: data)
            return results
        }
        catch
        {
            print (error.localizedDescription)
        }
    }
    return [CandyRank]() //Data load Failure!!!
}
