//
//  ContactViewController.swift
//  PassingDataExercise1
//
//  Created by Igor de Castro on 21/04/20.
//  Copyright © 2020 Igor de Castro. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewController: UITableViewController {
    let contacts: [Contact] = [
        Contact(photo: UIImage(named: "1")!, name: "Madison", position: "Sales", email: "madison@galefoods.com", phone: "4-(968) 705-1370"),
        Contact(photo: UIImage(named: "2")!, name: "Tyler Porter", position: "Software developer", email: "tyles@propehcy.com", phone: "2-(513) 832-7517"),
        Contact(photo: UIImage(named: "3")!, name: "Katherin", position: "Marketing", email: "katherine@goldenroads.com", phone: "1-(722) 844-1495"),
        Contact(photo: UIImage(named: "4")!, name: "Gary", position: "Web Developer", email: "gary@bluewares.com", phone: "9-(687) 559-3525")
    ]
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.photoImageView?.image = contact.photo
        cell.nameLabel?.text = contact.name
        cell.positionLabel?.text = contact.position
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailsViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else{
                return
        }
        detailViewController.contact = contacts[index]
    }
    
}
class ContactCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var positionLabel: UILabel?
}
