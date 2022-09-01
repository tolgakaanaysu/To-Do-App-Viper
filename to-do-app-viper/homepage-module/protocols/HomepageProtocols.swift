//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

protocol ViewToPresenterHomepageProtocol {
    var homepageView: PresenterToViewHomepageProtocol? { get set }
    var homepageInteractor: PresenterToInteractorHomepageProtocol? { get set }
    
    func getAllNote()
    
    func deleteNote(note_id: Int)
    
    func searchNote(searchText: String)
    
}

protocol PresenterToInteractorHomepageProtocol {
    var homepagePresenter: InteractorToPresenterHomepageProtocol? { get set }
    func getAllNote()
    
    func delete(note_id: Int)
    
    func search(searhText: String)
}

protocol InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(notesList: Array<Note>)
}

protocol PresenterToViewHomepageProtocol {
    func sendDataToView(noteList: Array<Note>)
    
}

protocol PresenterToRouterHomepageProtocol {
    static func createModule(ref: HomepageVC)
}
