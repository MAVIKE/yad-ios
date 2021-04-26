import Foundation

struct Restaurant: Decodable {
    public var id: Int
    public var name: String
    public var phone: String
    public var password: String = ""
    public var working_status: Int
    
    struct Location: Decodable {
        public var latitude: Double
        public var longitude: Double
    }

    public var location: Location
    public var image: String
}

typealias Restaurants = [Restaurant]
