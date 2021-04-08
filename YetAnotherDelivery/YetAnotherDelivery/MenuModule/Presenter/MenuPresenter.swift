import Foundation

class MenuPresenter: MenuOutputProtocol {
    let view: MenuInputProtocol!
    let router: RouterModulesProtocol!
    
    required init(view: MenuInputProtocol, router: RouterModulesProtocol) {
        self.view = view
        self.router = router
    }
    
    func didDishTapped() {
        router.dishModule()
    }
}
