//
//  Intractor.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import Foundation
import Alamofire

class ShaadiInteractor: ShaadiPresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: ShaadiInteractorToPresenterProtocol?
    var listShaadi: [Results]?
    
    // MARK: - Methods
    func fetchLiveNews() {
        AF.request(Constants.URL).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(ShaadiList.self, from: data)
                    guard let articles = newsResponse.results else { return }
                    self.listShaadi = articles
                    self.presenter?.liveNewsFetched()
                } catch let error {
                    print(error)
                }
            }
            else {
                //self.presenter?.liveNewsFetchedFailed()
            }
        }
    }
    
    
}
