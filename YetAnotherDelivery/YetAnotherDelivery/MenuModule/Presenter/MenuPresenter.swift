import Foundation

class MenuPresenter: MenuOutputProtocol {
    let view: MenuInputProtocol!
    let router: RouterModulesProtocol!
    
    let typeDishes = [
        TypeDish(nameType: "Burger", nameImage: .burger),
        TypeDish(nameType: "Pizza", nameImage: .pizza),
        TypeDish(nameType: "Sushi", nameImage: .sushi),
        TypeDish(nameType: "Drinks", nameImage: .beer),
        TypeDish(nameType: "Other", nameImage: .notfound),
    ]
    
    let dishes = [
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 15.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0),
        Dish(imageUrlStr: "https://eda.yandex/images/1370147/2c9a9c2375da1cf9a822bc25c66f593b-1100x825.jpeg", title: "Картошка", description: "Традиционный печёный картофель, горячие супы, сытные обеды на любой вкус и многое другое вы найдете в Меню сети", price: 12.0)
    ]
    
    required init(view: MenuInputProtocol, router: RouterModulesProtocol) {
        self.view = view
        self.router = router
    }
    
    func didDishTapped(dish: Dish) {
        router.dishModule(dish: dish)
    }
    
    func getTypeDishes() -> [TypeDish] {
        return self.typeDishes
    }
    
    func getDishes() -> [Dish] {
        return self.dishes
    }
}
