import Foundation

class OrderPresenter: OrderOutputProtocol {
    let view: OrderInputProtocol!
    let router: RouterOrderModulesProtocol!
    var dishes: [Dish]?
    
    required init(view: OrderInputProtocol, router: RouterOrderModulesProtocol) {
        self.view = view
        self.router = router
        
        self.dishes = [
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
    }
    
    func getDishes() -> [Dish] {
        guard let dishes = self.dishes else {
            return []
        }
        return dishes
    }
}
