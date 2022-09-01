//
//  Task.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class Note {
    var note_id: Int?
    var note_title: String?
    var note_date: String?
    
    init(note_id: Int,note_title: String, note_date: String?) {
        self.note_id = note_id
        self.note_title = note_title
        self.note_date = note_date
    }
}
