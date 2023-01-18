//
//  EventsModel.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 18/1/23.
//

import Foundation

struct ToDo: Decodable{
    let userId: Int
    let id: Int
    let tittle: String
    let completed: Bool
}
