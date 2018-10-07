//
//  mainViewController.swift
//  goodInsta
//
//  Created by Sierra Klix on 10/6/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class mainViewController: UIViewController, UITableViewDataSource {
   
    

    @IBOutlet weak var postTable: UITableView!
    var posts : [Post] = []
    var refresh : UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(getPost), for: .valueChanged)
        postTable.insertSubview(refresh, at: 0)
        postTable.dataSource = self
        postTable.rowHeight = UITableViewAutomaticDimension
        postTable.estimatedRowHeight = 500
        getPost()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    @IBAction func takePic(_ sender: Any) {
        self.performSegue(withIdentifier: "takePic", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTable.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! postCell
        if posts != []{
        let post = posts[indexPath.row]
        cell.indexPath = indexPath
        cell.Username.text = post.author.username
        cell.postDescript.text = post.caption
        if let imageFile : PFFile = post.media{
            imageFile.getDataInBackground{(data, error) in
                if error != nil{
                    print(error.debugDescription)
                }else{
                    cell.postImage.image = UIImage(data: data!)
                }
            }
        }
        }
        return cell
    }
   @objc func getPost(){
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.includeKey("createdAt")
        query?.limit = 20
        
        query?.findObjectsInBackground(block: {(posts, error) in
            if let posts = posts{
                self.posts = posts as! [Post]
                self.postTable.reloadData()
                self.refresh.endRefreshing()
            }else{
                print(error.debugDescription)
            }
        })
        
    }

    @IBAction func logOut(_ sender: Any) {
        PFUser.logOutInBackground()
        performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? detailpostViewController
        if let cell = sender as! postCell? {
            destination?.post = posts[(cell.indexPath?.row)!]
        }
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
