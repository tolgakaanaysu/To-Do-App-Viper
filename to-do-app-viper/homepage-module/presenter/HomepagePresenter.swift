//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class HomepagePresenter: ViewToPresenterHomepageProtocol {
    var homepageView: PresenterToViewHomepageProtocol?
    
    var homepageInteractor: PresenterToInteractorHomepageProtocol?
    
    func getAllNote() {
        homepageInteractor?.getAllNote()
    }
    
    func deleteNote(note_id: Int) {
        homepageInteractor?.delete(note_id: note_id)
    }
    
    func searchNote(searchText: String) {
        homepageInteractor?.search(searhText: searchText)
    }
}

extension HomepagePresenter: InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(notesList: Array<Note>) {
        homepageView?.sendDataToView(noteList: notesList)
    }
}
