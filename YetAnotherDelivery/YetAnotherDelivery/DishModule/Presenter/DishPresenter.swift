import Foundation

class DishPresenter: DishOutputProtocol {
    let view: DishInputProtocol!
    let router: RouterModulesProtocol!
    let dish: Dish!
    
    required init(view: DishInputProtocol, dish: Dish, router: RouterModulesProtocol) {
        self.view = view
        self.dish = dish
        self.router = router
    }
    
    func getDish() -> Dish {
        return dish
    }
}
