import UIKit

import Foundation

class ListEventsViewController: UIViewController{

    var ArrayEvents = [Event]()


    @IBOutlet weak var myTable: UITableView!

    override func viewDidLoad() {

        super.viewDidLoad()

        fetchData()

        myTable.dataSource = self

        myTable.delegate = self

        print(ArrayEvents)
    }

    

    func fetchData(){
        var data = Data()
        let url = URL(string: "https://superapi.netlify.app/api/db/eventos")
        
        do{
            data = try Data(contentsOf: url!)
        }catch{
            print("Data not founded")
        }
            print(data)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                var eList: [Any] = []
                
                for e in json as! [Any] {
                    if type(of: e) != NSNull.self{
                        eList.append(e)
                    }
                }
                
                for e in eList as! [[String:Any]]{
                    
                    self.ArrayEvents.append(Event(json: e))
                }
                print(eList)

                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }

                print(data)
            }
        
            catch{
                print("Error while decoding json \(error)")
            }
    
    }

}





extension ListEventsViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ArrayEvents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! row

        
        let evento = self.ArrayEvents[indexPath.row]
        // format date
        
        let timeInterval = TimeInterval(ArrayEvents[indexPath.row].date / 1000)
        let dateChanged = Date(timeIntervalSince1970: timeInterval)
        
        cell.name.text = evento.name
        cell.date.text = dateChanged.formatted().description

        return cell

    }

}


