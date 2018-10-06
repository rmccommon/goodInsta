//
//  ViewController.swift
//  goodInsta
//
//  Created by Sierra Klix on 10/1/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet weak var signInBut: UIButton!
    @IBOutlet weak var signUpBut: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signUpClick(_ sender: Any) {
        let newUser = PFUser()
       
        
        // set user properties
        newUser.username = username.text
        newUser.password = password.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                // manually segue to logged in view
            }
        }
        
        
    }
    
    @IBAction func signInClick(_ sender: Any) {
        let usernameT = username.text ?? ""
        let passwordT = password.text ?? ""

        PFUser.logInWithUsername(inBackground: usernameT, password: passwordT)
        { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

