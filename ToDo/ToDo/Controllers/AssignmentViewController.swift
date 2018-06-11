//
//  AssignmentViewController.swift
//  ToDo
//
//  Created by Emre Cakir on 6/5/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import UIKit
import Firebase

class AssignmentViewController: UITableViewController {
    
    // MARK: Properties
    var assignments: [Assignment] = []
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ref = Database.database().reference(withPath: "assignments")
        ref.observe(.value, with: { snapshot in
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let assignment = Assignment(snapshot: snapshot) {
                    self.assignments.append(assignment)
                }
            }
            self.assignments = self.assignments.sorted(by: {
                $0.dueDate.compare($1.dueDate) == .orderedDescending
            })
            self.tableView.reloadData()
        })
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
    
    // MARK: Add Assignment Action
    @IBAction func addButtonDidTouch(_ sender: Any) {
        
        // TODO: Remove Test Data
        var classSchool = ClassSchool(id: "0", name: "COS217", color: Constants.Colors.green, assignments: [])
        var classSchool1 = ClassSchool(id: "1", name: "COS226", color: Constants.Colors.blue, assignments: [])
        var classSchool2 = ClassSchool(id: "2", name: "PHI203", color: Constants.Colors.red, assignments: [])
        var classSchool3 = ClassSchool(id: "3", name: "SCI103", color: Constants.Colors.teal, assignments: [])
        var classSchool4 = ClassSchool(id: "4", name: "PHY103", color: Constants.Colors.orange, assignments: [])
        var classSchool5 = ClassSchool(id: "5", name: "PHI203", color: Constants.Colors.lightGreen, assignments: [])
        
        var assignment = Assignment(id: "0", title: "Shell Assignment", description: "Lab TAs available next week", completed: false, classSchool: classSchool, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool.assignments.append(assignment)
        
        assignment = Assignment(id: "1", title: "Virtual Memory Practice", description: "Finish first page using Ch. 10", completed: false, classSchool: classSchool, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool.assignments.append(assignment)
        
        assignment = Assignment(id: "2", title: "Kd Trees", description: "Lab TAs available during the week", completed: false, classSchool: classSchool1, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool1.assignments.append(assignment)
        
        assignment = Assignment(id: "21", title: "Free Will Paper", description: "Finish rough draft during precept", completed: false, classSchool: classSchool2, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool2.assignments.append(assignment)
        
        assignment = Assignment(id: "3", title: "Assignment #2", description: "Lab TAs available during the week", completed: false, classSchool: classSchool3, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool3.assignments.append(assignment)
        
        assignment = Assignment(id: "4", title: "Expert TA #9", description: "Office hours available", completed: false, classSchool: classSchool4, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool4.assignments.append(assignment)
        
        assignment = Assignment(id: "4asd", title: "Free Will Paper", description: "Finish rough draft during the week", completed: false, classSchool: classSchool5, dueDate: Date())
        dataReciever.addAssignment(assignment: assignment)
        classSchool5.assignments.append(assignment)
        
        dataReciever.addClassSchool(classSchool: classSchool)
        dataReciever.addClassSchool(classSchool: classSchool1)
        dataReciever.addClassSchool(classSchool: classSchool2)
        dataReciever.addClassSchool(classSchool: classSchool3)
        dataReciever.addClassSchool(classSchool: classSchool4)
        dataReciever.addClassSchool(classSchool: classSchool5)
        
    }
}
