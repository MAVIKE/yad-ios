import Foundation

protocol MenuInputProtocol {
    func updateOrders()
}

protocol MenuOutputProtocol {
    init(view: MenuInputProtocol, router: RouterHomeModulesProtocol)
    func didDishTapped(dish: Dish)
    func getTypeDishes() -> [TypeDish]
    func getDishes() -> [Dish]
    func getCountDishes() -> Int
    
    func plusCountDish()
    func minusCountDish()
}
