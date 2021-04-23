import Foundation

protocol OrderInputProtocol {
    
}

protocol OrderOutputProtocol {
    init(view: OrderInputProtocol, router: RouterOrderModulesProtocol)
}
