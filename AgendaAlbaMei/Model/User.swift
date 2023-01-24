//
//  Usuario.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 23/1/23.
//

import UIKit

class User: Decodable {
    var userName: String
    var pass: String
    
    init(json: [String:Any]){
        
        userName = json["user"] as? String ?? ""
        pass = json["pass"] as? String ?? ""
        
    }
    
    
}
