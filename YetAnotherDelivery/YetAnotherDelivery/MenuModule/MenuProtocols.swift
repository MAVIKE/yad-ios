import Foundation

protocol MenuInputProtocol {
    
}

protocol MenuOutputProtocol {
    init(view: MenuInputProtocol, router: RouterModulesProtocol)
    func didDishTapped()
    func getTypeDishes() -> [TypeDish]
}

struct TypeDish {
    var nameType: String
    var nameImage: String
}
