import Foundation

class OrderPresenter: OrderOutputProtocol {
    let view: OrderInputProtocol!
    let router: RouterOrderModulesProtocol!
    
    required init(view: OrderInputProtocol, router: RouterOrderModulesProtocol) {
        self.view = view
        self.router = router
    }
}
