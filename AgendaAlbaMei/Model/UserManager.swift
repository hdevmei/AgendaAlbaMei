//
//  UserManager.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 23/1/23.
//

import Foundation


class UserManager: NSObject{
    static var UserList: [User] = []
    
    static let urlUser: String = "https://superapi.netlify.app/api/db/users"
    
    static let urlLogin: String = "https://superapi.netlify.app/api/login"
    
    static let signUp: String = "https://superapi.netlify.app/api/register"
    
    
    static func getUsers(){
        var data = Data()
        
        let url = URL(string: urlUser)
        
        do {
            data = try Data(contentsOf: url!)
        }catch{
            print("Error while getting users")
        }
        do{
            let json =  try JSONSerialization.jsonObject(with: data,
                                                         options: .mutableContainers)
            var tempList : [Any] = []
            
            for i in json as! [Any]{
                if type(of: i) != NSNull.self{
                    tempList.append(i)
                }
            }
            
            for i in tempList as! [[String:Any]]{
                UserManager.UserList.append(User(json: i))
            }
            
            for i in UserList{
                print("user:", i.userName, "pass:", i.pass)
            }
            
        }catch{
            print("no se ha podido recibir los usuarios")
        }
    }
    
    
    
    
    
    
    
}



