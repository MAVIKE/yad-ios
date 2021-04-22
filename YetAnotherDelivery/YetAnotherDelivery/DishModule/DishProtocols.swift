import Foundation

protocol DishInputProtocol {
    
}

protocol DishOutputProtocol {
    init(view: DishInputProtocol, dish: Dish, router: RouterModulesProtocol)
    func getDish() -> Dish
}
