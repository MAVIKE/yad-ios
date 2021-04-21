import Foundation

class MenuPresenter: MenuOutputProtocol {
    let view: MenuInputProtocol!
    let router: RouterModulesProtocol!
    
    let typeDishes = [
        TypeDish(nameType: "Pizza", nameImage: "pizza"),
        TypeDish(nameType: "Drinks", nameImage: "beer"),
        TypeDish(nameType: "Burger", nameImage: "burger"),
        TypeDish(nameType: "Sushi", nameImage: "sushi"),
        TypeDish(nameType: "Other", nameImage: "notfound"),
    ]
    
    required init(view: MenuInputProtocol, router: RouterModulesProtocol) {
        self.view = view
        self.router = router
    }
    
    func didDishTapped() {
        router.dishModule()
    }
    
    func getTypeDishes() -> [TypeDish] {
        return self.typeDishes
    }
}
