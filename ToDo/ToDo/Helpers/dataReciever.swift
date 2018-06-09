//
//  dataReciever.swift
//  ToDo
//
//  Created by Emre Cakir on 6/9/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import Foundation
import Firebase

final class dataReciever {
    static func getClasses() {
        
    }
    
    static func addAssignment(assignment: Assignment) {
        let ref = Database.database().reference(withPath: "assignments")
        
        let assignmentRef = ref.child(String(assignment.id))
        assignmentRef.setValue(assignment.toAnyObject())
    }
    
    static func addClassSchool(classSchool: ClassSchool) {
        let ref = Database.database().reference(withPath: "classes")
        
        let classSchoolRef = ref.child(String(classSchool.id))
        classSchoolRef.setValue(classSchool.toAnyObject())
    }
}
