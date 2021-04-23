import Foundation

protocol HomeInputProtocol: class {
    
}

protocol HomeOutputProtocol: class {
    init(view: HomeInputProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterHomeModulesProtocol)
    func didRestaurantTapped()
}

