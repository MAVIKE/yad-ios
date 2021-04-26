import Foundation


class ProfileScreenPresenter: ProfileScreenOutputProtocol {
    let view: ProfileScreenInputProtocol!
    let router: RouterProfileModulesProtocol!
    
    required init(view: ProfileScreenInputProtocol, router: RouterProfileModulesProtocol) {
        self.view = view
        self.router = router
    }
}
