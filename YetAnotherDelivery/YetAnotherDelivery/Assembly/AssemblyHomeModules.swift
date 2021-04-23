import UIKit

protocol AssemblyHomeModulesProtocol {
    func homeModule(router: RouterHomeModulesProtocol) -> UIViewController
    func menuModule(router: RouterHomeModulesProtocol) -> UIViewController
    func dishModule(dish: Dish, router: RouterHomeModulesProtocol) -> UIViewController
}

class AssemblyHomeModules: AssemblyHomeModulesProtocol {
    func homeModule(router: RouterHomeModulesProtocol) -> UIViewController {
        let view = HomeView()
        let networkService = NetworkService()
        let presenter = HomePresenter(view: view,
                                      networkService: networkService,
                                      router: router)
        view.presenter = presenter
        return view
    }
    
    func menuModule(router: RouterHomeModulesProtocol) -> UIViewController {
        let view = MenuView()
        let presenter = MenuPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func dishModule(dish: Dish, router: RouterHomeModulesProtocol) -> UIViewController {
        let view = DishView()
        let presenter = DishPresenter(view: view, dish: dish, router: router)
        view.presenter = presenter
        return view
    }
}
