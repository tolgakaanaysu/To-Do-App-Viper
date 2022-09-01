//
//  HomepageRouter.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 31.08.2022.
//

import Foundation

class HomepageRouter: PresenterToRouterHomepageProtocol {
    static func createModule(ref: HomepageVC) {
        let presenter = HomepagePresenter()
        
        //View
        ref.homepagePresenter = presenter
        
        //Presenter
        ref.homepagePresenter?.homepageView = ref
        ref.homepagePresenter?.homepageInteractor = HomepageInteractor()
        
        
        //Interactor
        ref.homepagePresenter?.homepageInteractor?.homepagePresenter = presenter
        
    }
}
