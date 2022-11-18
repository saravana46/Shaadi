//
//  Protocol.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import Foundation
import UIKit

protocol ShaadiPresenterToViewProtocol: class {
    func showNews()
}

protocol ShaadiInteractorToPresenterProtocol: class {
    func liveNewsFetched()
}

protocol ShaadiPresentorToInteractorProtocol: class {
    var presenter: ShaadiInteractorToPresenterProtocol? { get set }
    var listShaadi: [Results]? { get }
    
    func fetchLiveNews()
}

protocol ShaadiViewToPresenterProtocol: class {
    var view: ShaadiPresenterToViewProtocol? { get set }
    var interactor: ShaadiPresentorToInteractorProtocol? { get set }
    var router: ShaadiPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getListCount() -> Int?
    func getList(index: Int) -> Results?
    
}

protocol ShaadiPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
