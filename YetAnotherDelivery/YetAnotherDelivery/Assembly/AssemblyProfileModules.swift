import UIKit

protocol AssemblyProfileModulesProtocol: class {
    func profileModule(router: RouterProfileModulesProtocol) -> UIViewController
}

class AssemblyProfileModules: AssemblyProfileModulesProtocol {
    func profileModule(router: RouterProfileModulesProtocol) -> UIViewController {
        let view = ProfileScreenView()
        let presenter = ProfileScreenPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

