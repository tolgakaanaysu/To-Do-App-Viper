//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class UpdatePresenter: ViewToPresenterUpdateProtocol {
    var updateInteractor: PresenterToInteractorUpdateProtocol?
    
    func update(note_id: Int, note_title: String) {
        updateInteractor?.updateNote(note_id: note_id, note_title: note_title)
    }
}
