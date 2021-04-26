import Foundation

class URLS {
    private let mainApi = "http://161.35.217.187:9001/api/v1"
    
    let signupPostUrl: String
    let signinPostUrl: String
    let restaurantsGetUrl: String
    
    init() {
        self.signupPostUrl = "\(mainApi)/users/sign-up"
        self.signinPostUrl = "\(mainApi)/users/sign-in"
        self.restaurantsGetUrl = "\(mainApi)/restaurants/"
    }
}
