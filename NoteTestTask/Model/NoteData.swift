//
//  ModelNote.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//


import UIKit
import RealmSwift

class NoteData: Object {
    @Persisted var titleNote: String = ""
    @Persisted var descriptionNote: String = ""
    @Persisted var pinnedNote: Bool = false
    @Persisted var colorNote: String = "6A3EA1"
    @Persisted var tagNote: String = ""
    @Persisted var editedData: Date?
}
