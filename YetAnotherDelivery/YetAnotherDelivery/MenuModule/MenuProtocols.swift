import Foundation

protocol MenuInputProtocol {
    
}

protocol MenuOutputProtocol {
    init(view: MenuInputProtocol, router: RouterModulesProtocol)
    func didDishTapped(dish: Dish)
    func getTypeDishes() -> [TypeDish]
    func getDishes() -> [Dish]
}
