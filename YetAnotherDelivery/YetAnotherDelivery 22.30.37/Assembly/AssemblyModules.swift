import UIKit

protocol AssemblyModulesProtocol {
    func homeModule(router: RouterModulesProtocol) -> UIViewController
    func menuModule(router: RouterModulesProtocol) -> UIViewController
    func dishModule(router: RouterModulesProtocol) -> UIViewController
}

class AssemblyModules: AssemblyModulesProtocol {
    func homeModule(router: RouterModulesProtocol) -> UIViewController {
        let view = HomeView()
        let networkService = NetworkService()
        let presenter = HomePresenter(view: view,
                                      networkService: networkService,
                                      router: router)
        view.presenter = presenter
        return view
    }
    
    func menuModule(router: RouterModulesProtocol) -> UIViewController {
        let view = MenuView()
        let presenter = MenuPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func dishModule(router: RouterModulesProtocol) -> UIViewController {
        let view = UIViewController()
        view.view.backgroundColor = .systemPink
        return view
    }
}
