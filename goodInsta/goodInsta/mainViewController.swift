//
//  mainViewController.swift
//  goodInsta
//
//  Created by Sierra Klix on 10/5/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class mainViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTable.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! postCell
        return cell;
    }
    
    @IBAction func takePic(_ sender: Any) {
        self.performSegue(withIdentifier: "takePic", sender: nil)
    }
    
    @IBAction func pleaseLogOut(_ sender: Any) {
        PFUser.logOutInBackground(block: {(error: Error?) in
        })
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    @IBOutlet weak var postTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
