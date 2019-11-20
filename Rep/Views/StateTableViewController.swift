//
//  StateTableViewController.swift
//  Rep
//
//  Created by tyson ericksen on 11/20/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit



class StateTableViewController: UITableViewController {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return State.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        let state = State.all[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRepViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? RepTableViewController {
                    let state = State.all[indexPath.row]
                    destinationVC.state = state
                }
            }
        }
    }
}
