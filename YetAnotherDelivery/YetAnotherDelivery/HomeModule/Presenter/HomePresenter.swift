import Foundation

class HomePresenter: HomeOutputProtocol {
    let view: HomeInputProtocol!
    let networkService: NetworkServiceProtocol!
    let router: RouterModulesProtocol!
    
    required init(view: HomeInputProtocol,
                  networkService: NetworkServiceProtocol,
                  router: RouterModulesProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func didRestaurantTapped() {
        router.detailModule()
    }
}
