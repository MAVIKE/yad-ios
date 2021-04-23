import Foundation

protocol DishInputProtocol {
    
}

protocol DishOutputProtocol {
    init(view: DishInputProtocol, dish: Dish, router: RouterHomeModulesProtocol)
    func getDish() -> Dish
}
