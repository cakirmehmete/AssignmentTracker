//
//  Assignment.swift
//  ToDo
//
//  Created by Emre Cakir on 6/7/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import Foundation
import Firebase

struct Assignment {
    
    // MARK: - Properties
    var id: String
    var title: String
    var description: String
    var completed: Bool
    var classSchool: ClassSchool
    var dueDate: Date
    
    init(id: String, title: String, description: String, completed: Bool, classSchool: ClassSchool, dueDate: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
        self.classSchool = classSchool
        self.dueDate = dueDate
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let id = value["id"] as? String,
            let description = value["description"] as? String,
            let completed = value["completed"] as? Bool,
            let classSchoolId = value["classSchoolId"] as? String,
            let dueDateString = value["dueDate"] as? String else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
        self.classSchool = ClassSchool.getClassFromId(classId: classSchoolId);
        self.dueDate = dueDateString.toDate()
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "title": title,
            "description": description,
            "completed" : completed,
            "classSchoolId" : classSchool.id,
            "dueDate": dueDate.toString()
        ]
    }
}

extension Date
{
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: self)
    }
}

extension String
{
    func toDate() -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self)!
    }
    
}
