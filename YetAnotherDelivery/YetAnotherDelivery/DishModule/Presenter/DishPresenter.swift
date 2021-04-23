import Foundation

class DishPresenter: DishOutputProtocol {
    let view: DishInputProtocol!
    let router: RouterHomeModulesProtocol!
    let dish: Dish!
    
    required init(view: DishInputProtocol, dish: Dish, router: RouterHomeModulesProtocol) {
        self.view = view
        self.dish = dish
        self.router = router
    }
    
    func getDish() -> Dish {
        return dish
    }
}
