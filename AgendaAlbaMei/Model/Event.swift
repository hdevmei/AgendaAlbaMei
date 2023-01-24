//
//  Event.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 20/1/23.
//

import Foundation


struct Event: Decodable{
    let name: String
    let date: Double
    
    init(json: [String:Any]) {
        name = json["name"] as? String ?? ""
        date = json["date"] as? Double ?? 0
    }
}
