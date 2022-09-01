//
//  UpdateRouter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 31.08.2022.
//

import Foundation

class UpdateRouter: PresenterToRouterUpdateProtocol {
    static func createModule(ref: UpdateVC) {
        ref.updatePresenter = UpdatePresenter()
        ref.updatePresenter?.updateInteractor = UpdateInteractor()
    }
}
