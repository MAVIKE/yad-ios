import UIKit

protocol RouterProfileModulesProtocol: class {
    init(assembly: AssemblyProfileModulesProtocol,
         navigation: UINavigationController)
    func initProfileModule() -> UIViewController
}

class RouterProfileModules: RouterProfileModulesProtocol {
    let assembly: AssemblyProfileModulesProtocol!
    let navigation: UINavigationController!
    
    required init(assembly: AssemblyProfileModulesProtocol,
         navigation: UINavigationController) {
        self.assembly = assembly
        self.navigation = navigation
    }
    
    func initProfileModule() -> UIViewController {
        let module = assembly.profileModule(router: self)
        return module
    }
}
