//
//  UserTableViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/10/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit
import os.log

class UserTableViewController: UITableViewController {
    //MARK: Properties
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Users"
        let backgroundImage = UIImage(named: "background")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        if let savedUser = loadUsers() {
            users += savedUser
        }
        else {
            loadSampleUsers()
        }
    }
    
    private func loadSampleUsers() {
        let photo1 = UIImage(named: "taurus")
        let photo2 = UIImage(named: "libra")
        let date1 = NSDate()
        
        let date2 = NSDate()
        
        
        guard let user1 = User(firstName: "JD", lastName: "Choi", gender: "Male", dob: date1,
                               zodiac: "taurus", photo : photo1) else {
                                fatalError("Unable to instantiate user1")
        }
        guard let user2 = User(firstName: "Dennis", lastName: "Park", gender: "Male", dob: date2,
                               zodiac: "libra", photo : photo2) else {
                                fatalError("Unable to instantiate user2")
        }
        users += [user1, user2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UserTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? UserTableViewCell else {
                                                        fatalError("The dequeued cell is not an instance of UserTableViewCell.")
        }
        let user = users[indexPath.row]
        let name = user.firstName + " " + user.lastName
        cell.nameLabel.text = name
        cell.photoImageView.image = user.photo
        // cell.dobLabel.text = user.dob
        cell.genderLabel.text = user.gender
        
        return cell
    }
    
    @IBAction func unwindToUserList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as?
            AddUserViewController, let user = sourceViewController.user{
            //            let newIndexPath = IndexPath(row: users.count, section: 0)
            //            users.append(user)
            //            tableView.insertRows(at: [newIndexPath], with: .automatic)
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                users[selectedIndexPath.row] = user
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: users.count, section: 0)
                users.append(user)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveUser()
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            saveUser()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    private func saveUser() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(users, toFile: User.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Users successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save users...", log: OSLog.default, type: .error)
        }
    }
    private func loadUsers() -> [User]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? [User]
    }
    
}
