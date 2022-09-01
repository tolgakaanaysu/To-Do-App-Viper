//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class CreateInteractor: PresenterToInteractorCreateProtocol {
    let db = SqliteDatabase.share.database
    
    func createNote(text: String) {
        db?.open()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/yyyy")
        let time = dateFormatter.string(from: date)

        do{
            try db!.executeUpdate("INSERT INTO NOTES (note_title,note_date) VALUES (?,?) ", values: [text,time])
        }catch{
            print(error.localizedDescription)
        }
    }
}
