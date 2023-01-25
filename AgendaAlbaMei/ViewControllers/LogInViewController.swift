//
//  ViewController.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 17/1/23.
//

import UIKit

class LogInViewController: UIViewController {

    var loginCorrect: Bool = false
    
    @IBOutlet weak var LoginWarinig: UILabel!
    
    @IBOutlet weak var userNameIntroduced: UITextField!
    
    @IBOutlet weak var userPasswordIntroduced: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoginWarinig.text = ""
        UserManager.getUsers()
    }
    
    
    @IBAction func gotToEventListBtn(_ sender: UIButton) {
        UserManager.getUsers()

        checkUser()
    }

    
    func checkUser(){
        if isUserCorrect() && isPasswordCorrect() {
            performSegue(withIdentifier: "a", sender: self)
            print("Ok")
        } else {
            print("Wrong")
            LoginWarinig.text = "User or password wrong"

        }
    }
    
    func isUserCorrect() -> Bool{
        var userNameCorrect = false
        for user in UserManager.UserList {
            if userNameIntroduced.text == user.userName{
                userNameCorrect = true
            }
        }
        return userNameCorrect
    }
    
    func isPasswordCorrect() -> Bool {
        var passwordCorrect = false
        
        for user in UserManager.UserList {
            if userPasswordIntroduced.text == user.pass{
                passwordCorrect = true
            }
        }
        return passwordCorrect
        
        
    }
    
}
