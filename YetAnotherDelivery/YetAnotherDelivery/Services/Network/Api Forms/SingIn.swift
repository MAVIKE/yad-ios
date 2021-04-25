import Foundation

struct SignInForm: Encodable {
    let phone: String
    let password: String
}

struct SignInResponse: Decodable {
    let token: String
}
