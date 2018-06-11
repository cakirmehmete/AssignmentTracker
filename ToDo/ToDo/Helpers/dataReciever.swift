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
    
    static func randomId() -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< 16 {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
