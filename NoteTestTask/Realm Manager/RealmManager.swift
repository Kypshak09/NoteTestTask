//
//  RealmManager.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//


import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init () {}
    
    let localRealm = try! Realm()
    
    func saveData(data: NoteData) {
        try! localRealm.write {
            localRealm.add(data)
        }
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
    func deleteData(data: NoteData) {
        try! localRealm.write {
            localRealm.delete(data)
        }
    }
    
}
