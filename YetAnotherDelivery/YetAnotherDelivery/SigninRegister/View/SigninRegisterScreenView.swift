import UIKit

final class SigninRegisterScreenViewController: UIViewController {
    
    //MARK: - Colors
    enum Colors {
        static let selectiveYellow = UIColor(red: 251/255, green: 187/255, blue: 0, alpha: 1)
        static let BlueGem =  UIColor(red: 65/255, green: 14/255, blue: 130/255, alpha: 1)
        static let Ecstasy =  UIColor(red: 248/255, green: 113/255, blue: 34/255, alpha: 1)
        static let JazzberryJam = UIColor(red: 182/255, green: 15/255, blue: 109/255, alpha: 1)
        static let Tabasco = UIColor(red: 182/255, green: 15/255, blue: 15/255, alpha: 1)
    }
    
    //MARK: - Scroll
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 18
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.selectiveYellow
        view.layer.cornerRadius = 18
        return view
    }()
    
    //MARK: - Top
    private lazy var yadView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.selectiveYellow
        view.layer.cornerRadius = 18
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private lazy var yadLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Yet Another Delivery"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var topLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Профиль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    //MARK: - User Info
    private lazy var userName: UILabel = {
        let lable = UILabel()
        lable.text = "Имя"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userNumber: UILabel = {
        let lable = UILabel()
        lable.text = "Номер"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userNameTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите имя"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userNumberTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите номер"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.numberPad
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userNewPassword: UILabel = {
        let lable = UILabel()
        lable.text = "Пароль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userNewPasswordTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите пароль"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userNewSecondPassword: UILabel = {
        let lable = UILabel()
        lable.text = "Еще раз пароль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userNewSecondPasswordTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Повторите пароль"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    //MARK: - User Address
    private lazy var userCity: UILabel = {
        let lable = UILabel()
        lable.text = "Город"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userCityTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите город"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    private lazy var userStreet: UILabel = {
        let lable = UILabel()
        lable.text = "Улица"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userStreetTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите улицу"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    private lazy var userHousNumber: UILabel = {
        let lable = UILabel()
        lable.text = "Номер дома"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userHousNumberTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите номер дома"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.numberPad
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userFloor: UILabel = {
        let lable = UILabel()
        lable.text = "Этаж"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userFloorTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите этаж"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.numberPad
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userFlat: UILabel = {
        let lable = UILabel()
        lable.text = "Квартира"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userFlatTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите номер квартиры"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.numberPad
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var userEntrace: UILabel = {
        let lable = UILabel()
        lable.text = "Подъезд"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userEntraceTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите номер подъезда"
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.textColor = Colors.BlueGem
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.numberPad
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return text
    }()
    
    private lazy var mainButton = UIButton(type: .system)
    var isUser: Bool = true
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Configure
    private func configureUI() {
        view.addSubview(yadView)
        yadView.addSubview(yadLabel)
        view.addSubview(topLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(mainButton)
        
        setupYAD()
        setupScroll()

        setupRegister()
    }
    
    //MARK: - setup Top
    private func setupYAD() {
        yadView.translatesAutoresizingMaskIntoConstraints = false
        yadView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        yadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        yadView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        yadView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        yadLabel.translatesAutoresizingMaskIntoConstraints = false
        yadLabel.bottomAnchor.constraint(equalTo: yadView.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        yadLabel.leadingAnchor.constraint(equalTo: yadView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: yadView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainButton.layer.cornerRadius = 10
        mainButton.tintColor = .white
        mainButton.backgroundColor = Colors.BlueGem
        mainButton.addTarget(self, action: #selector(registerButtonClicked(_ :)), for: .touchUpInside)
    }
    
    //MARK: - setup Scroll
    private func setupScroll() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -5).isActive = true
        scrollView.contentSize = CGSize(width: 400, height: 1000)
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    //MARK: - setup Register view
    private func setupRegister() {
        if isUser {
            topLabel.text = "Вход"
            mainButton.setTitle("Войти", for: .normal)
            contentView.backgroundColor = .clear
            contentView.addSubview(userNumber)
            contentView.addSubview(userNumberTextView)
            
            contentView.addSubview(userNewPassword)
            contentView.addSubview(userNewPasswordTextView)
            
            userNumber.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            setupSign()
            userNewPasswordTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
            
        } else {
            topLabel.text = "Регистрация"
            mainButton.setTitle("Зарегистрироваться", for: .normal)
            contentView.addSubview(userName)
            contentView.addSubview(userNameTextView)
            contentView.addSubview(userNumber)
            contentView.addSubview(userNumberTextView)
            
            contentView.addSubview(userNewPassword)
            contentView.addSubview(userNewPasswordTextView)
            contentView.addSubview(userNewSecondPassword)
            contentView.addSubview(userNewSecondPasswordTextView)
            
            contentView.addSubview(userCity)
            contentView.addSubview(userCityTextView)
            contentView.addSubview(userStreet)
            contentView.addSubview(userStreetTextView)
            contentView.addSubview(userHousNumber)
            contentView.addSubview(userHousNumberTextView)
            contentView.addSubview(userFloor)
            contentView.addSubview(userFloorTextView)
            contentView.addSubview(userFlat)
            contentView.addSubview(userFlatTextView)
            contentView.addSubview(userEntrace)
            contentView.addSubview(userEntraceTextView)
            
            
            userName.translatesAutoresizingMaskIntoConstraints = false
            userNameTextView.translatesAutoresizingMaskIntoConstraints = false
            
            userNewSecondPassword.translatesAutoresizingMaskIntoConstraints = false
            userNewSecondPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
            
            userCity.translatesAutoresizingMaskIntoConstraints = false
            userCityTextView.translatesAutoresizingMaskIntoConstraints = false
            userStreet.translatesAutoresizingMaskIntoConstraints = false
            userStreetTextView.translatesAutoresizingMaskIntoConstraints = false
            userHousNumber.translatesAutoresizingMaskIntoConstraints = false
            userHousNumberTextView.translatesAutoresizingMaskIntoConstraints = false
            userFloor.translatesAutoresizingMaskIntoConstraints = false
            userFloorTextView.translatesAutoresizingMaskIntoConstraints = false
            userFlat.translatesAutoresizingMaskIntoConstraints = false
            userFlatTextView.translatesAutoresizingMaskIntoConstraints = false
            userEntrace.translatesAutoresizingMaskIntoConstraints = false
            userEntraceTextView.translatesAutoresizingMaskIntoConstraints = false
            
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
            
            userNameTextView.topAnchor.constraint(equalTo: userName.bottomAnchor).isActive = true
            userNameTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
            userNameTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
            userNumber.topAnchor.constraint(equalTo: userNameTextView.bottomAnchor, constant: 10).isActive = true
            setupSign()
            setupInfo()
            
        }
    }
    
    @objc private func registerButtonClicked(_ : UIButton) {
        print("Заглушка")
    }
    
    private func setupInfo() {
        userNewSecondPassword.topAnchor.constraint(equalTo: userNewPasswordTextView.bottomAnchor, constant: 10).isActive = true
        userNewSecondPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        userNewSecondPasswordTextView.topAnchor.constraint(equalTo: userNewSecondPassword.bottomAnchor).isActive = true
        userNewSecondPasswordTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userNewSecondPasswordTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        
        userCity.topAnchor.constraint(equalTo: userNewSecondPasswordTextView.topAnchor, constant: 40).isActive = true
        userCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        userCityTextView.topAnchor.constraint(equalTo: userCity.bottomAnchor).isActive = true
        userCityTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userCityTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        userStreet.topAnchor.constraint(equalTo: userCityTextView.bottomAnchor, constant: 10).isActive = true
        userStreet.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        userStreetTextView.topAnchor.constraint(equalTo: userStreet.bottomAnchor).isActive = true
        userStreetTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userStreetTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        userHousNumber.topAnchor.constraint(equalTo: userStreetTextView.bottomAnchor, constant: 10).isActive = true
        userHousNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userHousNumberTextView.topAnchor.constraint(equalTo: userHousNumber.bottomAnchor).isActive = true
        userHousNumberTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userHousNumberTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        
        userFloor.topAnchor.constraint(equalTo: userHousNumberTextView.bottomAnchor, constant: 10).isActive = true
        userFloor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userFloorTextView.topAnchor.constraint(equalTo: userFloor.bottomAnchor).isActive = true
        userFloorTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userFloorTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        
        userFlat.topAnchor.constraint(equalTo: userFloorTextView.bottomAnchor, constant: 10).isActive = true
        userFlat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userFlatTextView.topAnchor.constraint(equalTo: userFlat.bottomAnchor).isActive = true
        userFlatTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userFlatTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        userEntrace.topAnchor.constraint(equalTo: userFlatTextView.bottomAnchor, constant: 10).isActive = true
        userEntrace.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userEntraceTextView.topAnchor.constraint(equalTo: userEntrace.bottomAnchor).isActive = true
        userEntraceTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userEntraceTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        userEntraceTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    //MARK: Setup Sign View
    private func setupSign() {
        userNumber.translatesAutoresizingMaskIntoConstraints = false
        userNumberTextView.translatesAutoresizingMaskIntoConstraints = false
        
        userNewPassword.translatesAutoresizingMaskIntoConstraints = false
        userNewPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
        
        userNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        userNumberTextView.topAnchor.constraint(equalTo: userNumber.bottomAnchor).isActive = true
        userNumberTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userNumberTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        
        userNewPassword.topAnchor.constraint(equalTo: userNumberTextView.bottomAnchor, constant: 10).isActive = true
        userNewPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        userNewPasswordTextView.topAnchor.constraint(equalTo: userNewPassword.bottomAnchor).isActive = true
        userNewPasswordTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        userNewPasswordTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
