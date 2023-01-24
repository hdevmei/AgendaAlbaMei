//
//  ViewController.swift
//  AgendaAlbaMei
//
//  Created by Apps2M on 17/1/23.
//

import UIKit

class LogInViewController: UIViewController {
    var usernameProvisional = "Mei"
    var contrasenaProvisional = "1234"
    var userNameIntroducido = ""
    var contrasenaIntroducida = ""
    var loginCorrect: Bool = false
    
    
    
    @IBAction func UserNameChange(_ sender: UITextField) {
        userNameIntroducido = sender.text!
        print(userNameIntroducido)
    }
    
    
    @IBAction func passwordChange(_ sender: UITextField) {
        contrasenaIntroducida = sender.text!
        print(contrasenaIntroducida)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserManager.getUsers()
        checkUser()
    }
    
    
    @IBAction func gotToEventListBtn(_ sender: UIButton) {
        
        if contrasenaIntroducida == contrasenaProvisional && userNameIntroducido == usernameProvisional{
            print("Acceso correcto")
            goToListEvent()
        } else {
            print("Contraseña incorrecta")
        }
    }
    
    func goToListEvent(){
       performSegue(withIdentifier: "a", sender: self)
    }
    
    
    
    func checkUser(){
        for name in UserManager.UserList{
            
        }
        print(UserManager.UserList[1].userName)
    }
    

    
}

