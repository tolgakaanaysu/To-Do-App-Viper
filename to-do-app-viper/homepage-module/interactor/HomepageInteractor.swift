//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class HomepageInteractor: PresenterToInteractorHomepageProtocol  {
    var homepagePresenter: InteractorToPresenterHomepageProtocol?
    
    
    let db = SqliteDatabase.share.database

    func getAllNote() {
        var list: [Note] = []
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM NOTES", values: nil)
            while q.next() {
                let note = Note(note_id: Int(q.string(forColumn: "note_id"))!,
                                note_title: q.string(forColumn: "note_title"),
                                note_date: q.string(forColumn: "note_date"))
                list.append(note)
            }
            homepagePresenter?.sendDataToPresenter(notesList: list)
        } catch  {
                print(error.localizedDescription)
        }
        db?.close()
      
    }
    
    func delete(note_id: Int) {
        db?.open()
    do{
        try db!.executeUpdate("DELETE FROM NOTES WHERE note_id = ?", values: [note_id])
        getAllNote()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()

    }
    func search(searhText: String) {
        var list: [Note] = []
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM NOTES WHERE note_title like '%\(searhText)%'", values: nil)
            while q.next() {
                let note = Note(note_id: Int(q.string(forColumn: "note_id"))!,
                                note_title: q.string(forColumn: "note_title"),
                                note_date: q.string(forColumn: "note_date"))
                list.append(note)
            }
            homepagePresenter?.sendDataToPresenter(notesList: list)
        } catch  {
                print(error.localizedDescription)
        }
        db?.close()
    }
}


