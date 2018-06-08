//
//  User.swift
//  ToDo
//
//  Created by Emre Cakir on 6/7/18.
//  Copyright © 2018 Emre Cakir. All rights reserved.
//

import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
