//
//  SearchResponse.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 10/16/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//

import Foundation
struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
    
}
struct Track: Decodable  {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl60: String
}
