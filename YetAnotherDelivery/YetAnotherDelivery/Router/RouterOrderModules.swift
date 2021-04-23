import UIKit

protocol RouterOrderModulesProtocol: class {
    init(assembly: AssemblyOrderModulesProtocol,
         navigation: UINavigationController)
    func initOrderModule()
}

class RouterOrderModules: RouterOrderModulesProtocol {
    let assembly: AssemblyOrderModulesProtocol!
    let navigation: UINavigationController!
    
    required init(assembly: AssemblyOrderModulesProtocol,
         navigation: UINavigationController) {
        self.assembly = assembly
        self.navigation = navigation
    }
    
    func initOrderModule() {
        let module = assembly.orderModule(router: self)
        navigation.pushViewController(module, animated: true)
    }
}
