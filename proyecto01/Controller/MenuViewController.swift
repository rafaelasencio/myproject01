//
//  MenuViewController.swift
//  proyecto01
//
//  Created by Rafael Asencio on 04/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import UIKit
import Firebase

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index: Int32)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    @IBAction func btnHome(_ sender: UIButton) {
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HVC = homeStoryBoard.instantiateViewController(withIdentifier: "Main") as! HomeViewController
        self.navigationController?.pushViewController(HVC, animated: true)
    }
    
    @IBAction func btnCloseMenu(_ sender: UIButton) {
            btnMenu.tag = 0
            btnMenu.isHidden = false
        if (self.delegate != nil){
            var index = Int32(sender.tag)
            if (sender == self.btnCloseMenuOverlay) {
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    var btnMenu: UIButton!
    var delegate: SlideMenuDelegate?
    var menuOptions = ["???","Messages","Payment","Help","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = menuOptions[indexPath.row]
        tableView.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
        } else if indexPath.row == 1 {
            let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let LMVC = homeStoryBoard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
            self.navigationController?.pushViewController(LMVC, animated: true)
            
        }  else if indexPath.row == 2 {
    let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let SVC = homeStoryBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
    self.navigationController?.pushViewController(SVC, animated: true)
            
        } else if indexPath.row == 4 {
            handleSignOut()
        }
    }
    
    func signOut() {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func handleSignOut() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
