//
//  HomepagePresenter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import Foundation

class CreatePresenter: ViewToPresenterCreateProtocol {
    var createInteractor: PresenterToInteractorCreateProtocol?
    
    func create(text: String) {
        createInteractor?.createNote(text: text)
    }
}
