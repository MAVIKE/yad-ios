import Foundation

class HomePresenter: HomeOutputProtocol {
    let view: HomeInputProtocol!
    let networkService: NetworkServiceProtocol!
    let router: RouterHomeModulesProtocol!
    
    required init(view: HomeInputProtocol,
                  networkService: NetworkServiceProtocol,
                  router: RouterHomeModulesProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func didRestaurantTapped() {
        router.detailModule()
    }
}
