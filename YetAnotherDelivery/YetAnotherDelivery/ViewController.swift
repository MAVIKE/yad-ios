import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        testAlamofire()
    }
    
    func testAlamofire() {
        let networkService = NetworkService()
        //        let signUpForm = SignUpForm(email: "antontimonin13@mail.ru", name: "Anton TIMONIN", password: "ImperatorZurg123", phone: "79842674549", address: Address(latitude: 89.89, longitude: 11.11))
        //        networkService.registrationRequest(form: signUpForm) { (result) in
        //            switch result {
        //            case .success(let response):
        //                print(response)
        //            case .failure(let error):
        //                print(error)
        //            }
        
//        let singin = SignInForm(phone: "79772675542", password: "ImperatorZurg123")
//        networkService.authorizationHandler(form: singin) { (result) in
//            switch result {
//            case .success(let signInResponse):
//                print(signInResponse)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        networkService.getRestaurantsHandler { (result) in
            switch result {
            case .success(let restaurants):
                restaurants.forEach { (restaurant) in
                    print("\n")
                    print(restaurant)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: " + error.localizedDescription)
    }
    
    func render(_ location: CLLocation) {
        let location = Location(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
        print(location)
    }
}
