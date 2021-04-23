import UIKit

protocol AssemblyOrderModulesProtocol: class {
    func orderModule(router: RouterOrderModulesProtocol) -> UIViewController
}

class AssemblyOrderModules: AssemblyOrderModulesProtocol {
    func orderModule(router: RouterOrderModulesProtocol) -> UIViewController {
        let view = OrderView()
        let presenter = OrderPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
