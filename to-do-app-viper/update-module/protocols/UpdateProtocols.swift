//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

protocol ViewToPresenterUpdateProtocol {
    var updateInteractor: PresenterToInteractorUpdateProtocol? { get set }
    
    func update(note_id: Int, note_title: String)
}

protocol PresenterToInteractorUpdateProtocol {
    func updateNote(note_id: Int, note_title: String)
}

protocol PresenterToRouterUpdateProtocol {
    static func createModule(ref: UpdateVC)
}
