//
//  Router.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import Foundation
import UIKit

class ShaadiRouter: ShaadiPresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let presenter: ShaadiViewToPresenterProtocol & ShaadiInteractorToPresenterProtocol = ShaadiPresenter()
        let interactor: ShaadiPresentorToInteractorProtocol = ShaadiInteractor()
        let router: ShaadiPresenterToRouterProtocol = ShaadiRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
