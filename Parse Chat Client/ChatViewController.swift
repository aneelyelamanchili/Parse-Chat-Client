//
//  ChatViewController.swift
//  Parse Chat Client
//
//  Created by Aneel Yelamanchili on 10/3/16.
//  Copyright © 2016 Aneel Yelamanchili. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var textMessage: UITextField!
    var messageArray: NSArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: AnyObject) {
        var message = PFObject(className: "Message_fbuJuly2016")
        message["text"] = textMessage.text
        message.saveInBackground {
        (success, error) -> Void in
            if(success) {
                print(self.textMessage.text)
            } else {
                //error
            }
        
        }
        
    }
    
    func refresh() {
        messageArray = NSMutableArray()
        var query = PFQuery(className: "Message_fbuJuly2016")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground{
            (objects, error) -> Void in
            
            if error == nil {
                //success
                
                if let objects = objects {
                    for object in objects {
                        self.messageArray.adding(object)
                    }
                }
            }
            else {
                //we have an error
            }
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell")
        
        cell.cellLabel.text = messageArray[indexPath.row]["text"]
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
