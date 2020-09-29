//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Marcus on 17/09/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var usuario: UILabel!
    
    fileprivate func getUser() {
        let preferences = UserDefaults.standard
        let userKey = "usuario"
        if preferences.object(forKey: userKey) == nil {
            //  Doesn't exist
        } else {
            guard let userName = preferences.string(forKey: userKey) else {return}
            usuario.text = "Olá, \(userName)"
            print("Usuario preferences\(userName)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        getUser()
    }
    override func viewWillAppear(_ animated: Bool) {
        getUser()
    }


}

