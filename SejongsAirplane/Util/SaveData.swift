//
//  saveData.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import Foundation
import Firebase

class ItemInfo {
    
    var db: Firestore!
    
    func roomDataSet(item: FoodModel) {
        // [START setup]
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("food").addDocument(data: [
            "content": item.content,
            "password": "",
            "picture": item.picture,
            "rate": item.rate,
            "title": item.title,
            "username": "Test",
        ]){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func clubDataSet(item: FoodModel) {
        // [START setup]
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("admin-club").addDocument(data: [
            "content": item.content,
            "password": "",
            "picture": item.picture,
            "rate": item.rate,
            "title": item.title,
            "username": "Test",
        ]){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
