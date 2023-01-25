//
//  AddEventViewController.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 17/1/23.
//

import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var EventCreated: UILabel!
    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var EventDate: UIDatePicker!
    @IBAction func addEvent(_ sender: Any) {
        postEvent()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func postEvent(){
        let parameters: [String: Any] = ["name": EventName.text, "date": EventDate.date.timeIntervalSince1970]
        
        
        guard let url = URL(string: "https://superapi.netlify.app/api/db/eventos") else { return }
        
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
        
        EventCreated.text = "Event created!"
    }
    
}
    
    
