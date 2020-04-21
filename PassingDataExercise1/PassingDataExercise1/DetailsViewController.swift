//
//  DetailsViewController.swift
//  PassingDataExercise1
//
//  Created by Igor de Castro on 21/04/20.
//  Copyright © 2020 Igor de Castro. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UITableViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = contact?.photo
        nameLabel.text = contact?.name
        positionLabel.text = contact?.position
        emailButton.setTitle(contact?.email, for: .normal)
        phoneButton.setTitle(contact?.phone, for: .normal)
    }
    
    
}
