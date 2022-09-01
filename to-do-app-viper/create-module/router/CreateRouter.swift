//
//  CreateRouter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 31.08.2022.
//

import Foundation

class CreateRouter: PresenterToRouterCreatProtocol {
    static func createModule(ref: CreateVC) {
        ref.createPresenter = CreatePresenter()
        ref.createPresenter?.createInteractor = CreateInteractor()
    }
    
    
}
