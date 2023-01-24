//
//  CreatedNewUserViewController.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 24/1/23.
//

import UIKit

class CreatedNewUserViewController: UIViewController {


    @IBOutlet weak var UserNameIntroduced: UITextField!
    
    @IBOutlet weak var passWordIntroduced: UITextField!
    
    @IBOutlet weak var userCreatedLabel: UILabel!
    
    
    
    @IBAction func CreateUserBtn(_ sender: UIButton) {
        createUser()
    }
    
    func createUser(){
        let parameters: [String: Any] = ["user": UserNameIntroduced.text, "pass": passWordIntroduced.text]
        guard let url = URL(string: "https://superapi.netlify.app/api/db/users") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("The error was: \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
            
        }.resume()
        
        userCreatedLabel.text = "User created!"
    }
    
}
