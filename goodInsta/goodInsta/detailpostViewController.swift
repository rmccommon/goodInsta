//
//  detailpostViewController.swift
//  goodInsta
//
//  Created by Sierra Klix on 10/6/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit
import Parse

class detailpostViewController: UIViewController {
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var postDescript: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image : PFFile = post?.media{
            image.getDataInBackground(block: {(data, error) in
                if error != nil{
                    print(error.debugDescription)
                }else{
                    self.postImage.image = UIImage(data: data!)
                }
            })
        }
        authorLabel.text = post?.author.username
        likes.text = String((post?.likesCount)!)
        let format = DateFormatter()
        format.dateFormat = "MMMM dd,yyyy"
        
        dateCreated.text = format.string(from: (post?.createdAt)!)
        
        postDescript.text = post?.caption
        
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
