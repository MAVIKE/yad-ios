import Foundation

struct TypeDish {
    var nameType: String
    var nameImage: EatTypeImages
}

enum EatTypeImages: String {
    case pizza = "pizza"
    case sushi = "sushi"
    case beer = "beer"
    case burger = "burger"
    case notfound = "notfound"
}
