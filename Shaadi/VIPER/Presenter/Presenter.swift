//
//  Presenter.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import Foundation

class ShaadiPresenter: ShaadiViewToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: ShaadiPresenterToViewProtocol?
    var interactor: ShaadiPresentorToInteractorProtocol?
    var router: ShaadiPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchLiveNews()
    }
    
    func getListCount() -> Int? {
        return interactor?.listShaadi?.count
    }
    
    func getList(index: Int) -> Results? {
        return interactor?.listShaadi?[index]
    }
    
}

// MARK: - ShaadiListInteractorToPresenterProtocol
extension ShaadiPresenter: ShaadiInteractorToPresenterProtocol {
    
    func liveNewsFetched() {
        view?.showNews()
    }
    
}

