//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

protocol ViewToPresenterCreateProtocol {
    var createInteractor: PresenterToInteractorCreateProtocol? { get set }
    func create(text: String)
}

protocol PresenterToInteractorCreateProtocol {
    func createNote(text: String)
}

protocol PresenterToRouterCreatProtocol {
    static func createModule(ref: CreateVC)
}
