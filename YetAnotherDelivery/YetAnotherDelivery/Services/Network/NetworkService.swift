import Foundation
import Alamofire

protocol NetworkServiceProtocol: class {
    func registrationRequest(form signUpForm: SignUpForm, then handler: @escaping (Result<SignUpResponse, Error>) -> Void)
    func authorizationHandler(form signInForm: SignInForm, then handler: @escaping (Result<SignInResponse, Error>) -> Void)
    func getRestaurantsHandler(then handler: @escaping (Result<Restaurants, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private let urls = URLS()
    
    // MARK:- /sign-up/
    typealias registrationHandler = (Result<SignUpResponse, Error>) -> Void
    func registrationRequest(form signUpForm: SignUpForm, then handler: @escaping registrationHandler) {
        AF.request(urls.signupPostUrl, method: .post, parameters: signUpForm, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"]).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: data)
                        handler(.success(signUpResponse))
                    } catch {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    handler(.failure(error))
                }
        }
    }
    
    // MARK:- /sign-in/
    typealias authorizationHandler = (Result<SignInResponse, Error>) -> Void
    func authorizationHandler(form signInForm: SignInForm, then handler: @escaping authorizationHandler) {
        AF.request(urls.signinPostUrl, method: .post, parameters: signInForm, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"]).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
                        handler(.success(signInResponse))
                    } catch {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    handler(.failure(error))
                }
        }
    }
    
    // MARK:- /restaurants/
    typealias getRestaurantsHandler = (Result<Restaurants, Error>) -> Void
    func getRestaurantsHandler(then handler: @escaping getRestaurantsHandler) {
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjE5NDQ4NjMsImlhdCI6MTYxOTM1Mjg2MywiaWQiOjMsImNsaWVudF90eXBlIjoidXNlciJ9.oPi3Ts_bI4zFXkKEIQi3FKiAfTY80Mz7jzNDdzZeVjo"
        
        let header: HTTPHeaders = [
            .authorization(bearerToken: token)
        ]

        AF.request(urls.restaurantsGetUrl, method: .get, headers: header)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"]).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let restaurantsResponse = try JSONDecoder().decode(Restaurants.self, from: data)
                        handler(.success(restaurantsResponse))
                    } catch {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
