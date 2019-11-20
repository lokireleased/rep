//
//  StateRepTableViewCell.swift
//  Rep
//
//  Created by tyson ericksen on 11/20/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class StateRepTableViewCell: UITableViewCell {
    
    var stateRep: Representative? {
        didSet {
            updateView()
        }
    }

    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
   
    
    func updateView() {
        repNameLabel.text = stateRep?.name
        partyLabel.text = stateRep?.party
        districtLabel.text = stateRep?.district
        phoneNumberLabel.text = stateRep?.phone
        websiteLabel.text = stateRep?.link
    }

}
