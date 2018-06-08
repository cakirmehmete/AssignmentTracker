//
//  AssignmentViewController.swift
//  ToDo
//
//  Created by Emre Cakir on 6/5/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import UIKit

class AssignmentViewController: UITableViewController {
    
    // MARK: Properties
    var assignments: [Assignment] = []
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView Delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell",
                                                 for: indexPath) as! AssignmentCell
        
        let assignment = assignments[indexPath.row]
        cell.assignment = assignment
        return cell
    }
}

