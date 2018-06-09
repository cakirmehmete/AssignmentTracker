//
//  ClassSchool.swift
//  ToDo
//
//  Created by Emre Cakir on 6/7/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//
import UIKit

struct ClassSchool {
    
    // MARK: - Properties
    var id: String
    var name: String
    var color: UIColor 
    var assignments: [Assignment]
    
    private func getAssignmentIds() -> [String] {
        var assignmentIds: [String] = []
        
        for assignment in assignments {
            assignmentIds.append(assignment.id)
        }
        
        return assignmentIds
    }
    
    static func getClassFromId(classId: String) -> ClassSchool {
        return ClassSchool(id: "0", name: "COS217", color: Constants.Colors.green, assignments: [])
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "name": name,
            "color": color.hexString,
            "assignments" : getAssignmentIds(),
        ]
    }
}
