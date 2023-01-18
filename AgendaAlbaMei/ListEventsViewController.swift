//
//  ListEventsViewController.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 17/1/23.
//

import UIKit
import Foundation


class ListEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var eventosProvisionales = ["comida faimiliar", "presentación", "Concierto", "Graduación", "Rodaje", "Examen", "Peluquería"]
    
    
    @IBOutlet weak var myTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventosProvisionales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = eventosProvisionales[indexPath.row]
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        // Do any additional setup after loading the view
        fetchingApiData(URL: "https://jsonplaceholder.typicode.com/todos") {result in
             print(result)
        }
    }


    func fetchingApiData(URL url:String, completion: @escaping ([ToDo]) -> Void){
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) {data, response, error in
            if data != nil && error == nil {
                do{
                    let parsingData = try JSONDecoder().decode([ToDo].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("Parsing Error")
                }
            }
        }
        dataTask.resume()
    }
    
    
}



