//
//  ChatViewController.swift
//  proyecto01
//
//  Created by Rafael Asencio on 04/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var user1 = User(name: "rafa", email: "rafa@gmail.com", latitude: 23.2423, longitude: 645.34)
    

    //@IBOutlet weak var lblUsername: UILabel!
    
    //@IBOutlet weak var lblUserEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        //cell.imageView?.image = UIImage(named: "logoNasa")
        cell.textLabel?.text = user1.email ?? "no value"
        cell.backgroundColor = .green
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let DVC = homeStoryBoard.instantiateViewController(withIdentifier: "ConversationViewController") as! ConversationViewController
            self.navigationController?.pushViewController(DVC, animated: true)        }
    }
}
