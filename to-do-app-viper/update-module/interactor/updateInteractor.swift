//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation



class UpdateInteractor: PresenterToInteractorUpdateProtocol {
    let db = SqliteDatabase.share.database
   
    func updateNote(note_id: Int, note_title: String) {
        db?.open()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/yyyy")
        let note_date = dateFormatter.string(from: date)
        do{
            try db!.executeUpdate(
                "UPDATE NOTES SET note_title = ?, note_date = ? WHERE note_id = ?",
                values: [note_title, note_date, note_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
