import UIKit

protocol RouterModulesProtocol {
    init(assembly: AssemblyModulesProtocol,
         navigation: UINavigationController)
    func initHomeModule()
    func detailModule()
    func dishModule(dish: Dish)
    func popToRoot()
    func pop()
}

class RouterModules: RouterModulesProtocol {
    let assembly: AssemblyModulesProtocol!
    let navigation: UINavigationController!
    
    required init(assembly: AssemblyModulesProtocol,
                  navigation: UINavigationController) {
        self.assembly = assembly
        self.navigation = navigation
    }
    
    func initHomeModule() {
        let module = assembly.homeModule(router: self)
        navigation.pushViewController(module, animated: true)
    }
    
    func detailModule() {
        let module = assembly.menuModule(router: self)
        navigation.pushViewController(module, animated: true)
    }
    
    func dishModule(dish: Dish) {
        let module = assembly.dishModule(dish: dish, router: self)
        navigation.pushViewController(module, animated: true)
    }
    
    func pop() {
        navigation.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigation.popToRootViewController(animated: true)
    }
}
