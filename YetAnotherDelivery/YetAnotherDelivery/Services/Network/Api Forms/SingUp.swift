import Foundation

struct SignUpForm: Encodable {
    let email: String
    let name: String
    let password: String
    let phone: String
    let address: Address
}

struct Address: Encodable {
    let latitude: Double
    let longitude: Double
}

struct SignUpResponse: Decodable {
    let id: Int
}

