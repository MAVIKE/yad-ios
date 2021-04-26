import UIKit

final class ProfileScreenView: UIViewController, ProfileScreenInputProtocol {
    
    public var presenter: ProfileScreenOutputProtocol!
    
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
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
    
    private lazy var profileLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Профиль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()

//MARK: - ConstraintHidden
    private var nameConstraintHidden: NSLayoutConstraint?
    private var deliveryAddressConstraintHidden: NSLayoutConstraint?
    private var myOrdersConstraintHidden: NSLayoutConstraint?
    private var changePasswordConstraintHidden: NSLayoutConstraint?

//MARK: - User
    private lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.selectiveYellow
        view.layer.cornerRadius = 18
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(didTapNameButton))
        view.addGestureRecognizer(recognizer)
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Пользователь"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()

//MARK: - Address
    private lazy var deliveryAddressView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Ecstasy
        view.layer.cornerRadius = 18
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(didTapDeliveryAddressButton))
        view.addGestureRecognizer(recognizer)
        return view
    }()
    
    private lazy var deliveryAddressLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Адрес Доставки"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()

//MARK: - Order
    private lazy var myOrdersView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.JazzberryJam
        view.layer.cornerRadius = 18
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(didTapMyOrdersButton))
        view.addGestureRecognizer(recognizer)
        return view
    }()
    
    private lazy var myOrdersLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Заказы"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
//MARK: - Password
    private lazy var changePasswordView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Tabasco
        view.layer.cornerRadius = 18
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(didTapChangePasswordButton))
        view.addGestureRecognizer(recognizer)
        return view
    }()
    
    private lazy var changePasswordLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Смена пароля"
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
    
//MARK: - User Change Password
    private lazy var userPassword: UILabel = {
        let lable = UILabel()
        lable.text = "Старый пароль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userPasswordTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите Старый пароль"
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
    
    private lazy var userNewPassword: UILabel = {
        let lable = UILabel()
        lable.text = "Новый пароль"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    private lazy var userNewPasswordTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите Новый пароль"
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
        lable.text = "Еще раз"
        lable.font = .monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.bold)
        lable.textColor = Colors.BlueGem
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var userNewSecondPasswordTextView: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите Новый пароль"
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

//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    var flagName: Bool = false
    var flagAddress: Bool = false
    var flagOrder: Bool = false
    var flagChange: Bool = false
    
//MARK: - didTap
    @objc private func didTapNameButton(_ sender: Any) {
        
        if flagName {
            nameConstraintHidden?.isActive = false
            flagName = false
        } else {
            nameConstraintHidden?.isActive = true
            flagName = true
        }
        deliveryAddressConstraintHidden?.isActive = true
        myOrdersConstraintHidden?.isActive = true
        changePasswordConstraintHidden?.isActive = true
    }
    @objc private func didTapDeliveryAddressButton(_ sender: Any) {
        
        if flagAddress {
            deliveryAddressConstraintHidden?.isActive = false
            flagAddress = false
        } else {
            deliveryAddressConstraintHidden?.isActive = true
            flagAddress = true
        }
        
        nameConstraintHidden?.isActive = true
        myOrdersConstraintHidden?.isActive = true
        changePasswordConstraintHidden?.isActive = true
    }
    @objc private func didTapMyOrdersButton(_ sender: Any) {
        
        if flagOrder {
            myOrdersConstraintHidden?.isActive = false
            flagOrder = false
        } else {
            myOrdersConstraintHidden?.isActive = true
            flagOrder = true
        }
        
        nameConstraintHidden?.isActive = true
        deliveryAddressConstraintHidden?.isActive = true
        changePasswordConstraintHidden?.isActive = true
    }
    
    @objc private func didTapChangePasswordButton(_ sender: Any) {
        
        if flagChange {
            changePasswordConstraintHidden?.isActive = false
            flagChange = false
        } else {
            changePasswordConstraintHidden?.isActive = true
            flagChange = true
        }
        
        nameConstraintHidden?.isActive = true
        deliveryAddressConstraintHidden?.isActive = true
        myOrdersConstraintHidden?.isActive = true
        
    }
    
//MARK: - Configure
    private func configureUI() {
        view.addSubview(yadView)
        yadView.addSubview(yadLabel)
        view.addSubview(profileLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        contentView.addSubview(deliveryAddressView)
        deliveryAddressView.addSubview(deliveryAddressLabel)
        contentView.addSubview(myOrdersView)
        myOrdersView.addSubview(myOrdersLabel)
        contentView.addSubview(changePasswordView)
        changePasswordView.addSubview(changePasswordLabel)
        
        setupYAD()
        setupScroll()
        setupUser()
        setupDelivery()
        setupOrder()
        setupChange()
        
        nameConstraintHidden?.isActive = true
        deliveryAddressConstraintHidden?.isActive = true
        myOrdersConstraintHidden?.isActive = true
        changePasswordConstraintHidden?.isActive = true
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

        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.topAnchor.constraint(equalTo: yadView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        profileLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        profileLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
    }
    
//MARK: - setup Scroll
    private func setupScroll() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize = CGSize(width: 400, height: 1000)
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

//MARK: - setup User view
    private func setupUser() {
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        nameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        nameConstraintHidden = nameView.heightAnchor.constraint(equalToConstant: 50)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        
        nameView.addSubview(userName)
        nameView.addSubview(userNameTextView)
        nameView.addSubview(userNumber)
        nameView.addSubview(userNumberTextView)
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userNameTextView.translatesAutoresizingMaskIntoConstraints = false
        userNumber.translatesAutoresizingMaskIntoConstraints = false
        userNumberTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        userName.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 50).isActive = true
        userName.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        
        userNameTextView.topAnchor.constraint(equalTo: userName.bottomAnchor).isActive = true
        userNameTextView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        userNameTextView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -20).isActive = true
        
        userNumber.topAnchor.constraint(equalTo: userNameTextView.bottomAnchor, constant: 10).isActive = true
        userNumber.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        
        userNumberTextView.topAnchor.constraint(equalTo: userNumber.bottomAnchor).isActive = true
        userNumberTextView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20).isActive = true
        userNumberTextView.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -20).isActive = true
        userNumberTextView.bottomAnchor.constraint(equalTo: nameView.bottomAnchor, constant: -20).isActive = true
        
    }

//MARK: - setup Delivery view
    private func setupDelivery() {
        deliveryAddressView.translatesAutoresizingMaskIntoConstraints = false
        deliveryAddressView.topAnchor.constraint(equalTo: nameView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        deliveryAddressView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        deliveryAddressView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        deliveryAddressView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        deliveryAddressConstraintHidden = deliveryAddressView.heightAnchor.constraint(equalToConstant: 50)
        
        deliveryAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryAddressLabel.topAnchor.constraint(equalTo: deliveryAddressView.topAnchor, constant: 10).isActive = true
        deliveryAddressLabel.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        
        
        deliveryAddressView.addSubview(userCity)
        deliveryAddressView.addSubview(userCityTextView)
        deliveryAddressView.addSubview(userStreet)
        deliveryAddressView.addSubview(userStreetTextView)
        deliveryAddressView.addSubview(userHousNumber)
        deliveryAddressView.addSubview(userHousNumberTextView)
        deliveryAddressView.addSubview(userFloor)
        deliveryAddressView.addSubview(userFloorTextView)
        deliveryAddressView.addSubview(userFlat)
        deliveryAddressView.addSubview(userFlatTextView)
        deliveryAddressView.addSubview(userEntrace)
        deliveryAddressView.addSubview(userEntraceTextView)
        
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
        
        userCity.topAnchor.constraint(equalTo: deliveryAddressView.topAnchor, constant: 40).isActive = true
        userCity.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        
        userCityTextView.topAnchor.constraint(equalTo: userCity.bottomAnchor).isActive = true
        userCityTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userCityTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        
        userStreet.topAnchor.constraint(equalTo: userCityTextView.bottomAnchor, constant: 10).isActive = true
        userStreet.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        
        userStreetTextView.topAnchor.constraint(equalTo: userStreet.bottomAnchor).isActive = true
        userStreetTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userStreetTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        
        userHousNumber.topAnchor.constraint(equalTo: userStreetTextView.bottomAnchor, constant: 10).isActive = true
        userHousNumber.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userHousNumberTextView.topAnchor.constraint(equalTo: userHousNumber.bottomAnchor).isActive = true
        userHousNumberTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userHousNumberTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        
        
        userFloor.topAnchor.constraint(equalTo: userHousNumberTextView.bottomAnchor, constant: 10).isActive = true
        userFloor.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userFloorTextView.topAnchor.constraint(equalTo: userFloor.bottomAnchor).isActive = true
        userFloorTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userFloorTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        
        
        userFlat.topAnchor.constraint(equalTo: userFloorTextView.bottomAnchor, constant: 10).isActive = true
        userFlat.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userFlatTextView.topAnchor.constraint(equalTo: userFlat.bottomAnchor).isActive = true
        userFlatTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userFlatTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        
        userEntrace.topAnchor.constraint(equalTo: userFlatTextView.bottomAnchor, constant: 10).isActive = true
        userEntrace.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userEntraceTextView.topAnchor.constraint(equalTo: userEntrace.bottomAnchor).isActive = true
        userEntraceTextView.leadingAnchor.constraint(equalTo: deliveryAddressView.leadingAnchor, constant: 20).isActive = true
        userEntraceTextView.trailingAnchor.constraint(equalTo: deliveryAddressView.trailingAnchor, constant: -20).isActive = true
        userEntraceTextView.bottomAnchor.constraint(equalTo: deliveryAddressView.bottomAnchor, constant: -20).isActive = true
        
    }

//MARK: - setup Order view
    private func setupOrder() {
        myOrdersView.translatesAutoresizingMaskIntoConstraints = false
        myOrdersView.topAnchor.constraint(equalTo: deliveryAddressView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        myOrdersView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        myOrdersView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        myOrdersView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        myOrdersConstraintHidden = myOrdersView.heightAnchor.constraint(equalToConstant: 50)
        
        myOrdersLabel.translatesAutoresizingMaskIntoConstraints = false
        myOrdersLabel.topAnchor.constraint(equalTo: myOrdersView.topAnchor, constant: 10).isActive = true
        myOrdersLabel.leadingAnchor.constraint(equalTo: myOrdersView.leadingAnchor, constant: 20).isActive = true
        
    }
    
//MARK: - setup Change view
    private func setupChange() {
        changePasswordView.translatesAutoresizingMaskIntoConstraints = false
        changePasswordView.topAnchor.constraint(equalTo: myOrdersView.bottomAnchor, constant: 20).isActive = true
        changePasswordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        changePasswordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        changePasswordView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        changePasswordView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        changePasswordConstraintHidden = changePasswordView.heightAnchor.constraint(equalToConstant: 50)
        
        changePasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        changePasswordLabel.topAnchor.constraint(equalTo: changePasswordView.topAnchor, constant: 10).isActive = true
        changePasswordLabel.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        
        userPassword.translatesAutoresizingMaskIntoConstraints = false
        userNewPassword.translatesAutoresizingMaskIntoConstraints = false
        userPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
        userNewPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
        userNewPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
        
        changePasswordView.addSubview(userPassword)
        changePasswordView.addSubview(userPasswordTextView)
        changePasswordView.addSubview(userNewPassword)
        changePasswordView.addSubview(userNewPasswordTextView)
        changePasswordView.addSubview(userNewSecondPassword)
        changePasswordView.addSubview(userNewSecondPasswordTextView)
        
        userPassword.topAnchor.constraint(equalTo: changePasswordView.topAnchor, constant: 40).isActive = true
        userPassword.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        
        userPasswordTextView.topAnchor.constraint(equalTo: userPassword.bottomAnchor).isActive = true
        userPasswordTextView.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        userPasswordTextView.trailingAnchor.constraint(equalTo: changePasswordView.trailingAnchor, constant: -20).isActive = true
        
        userNewPassword.topAnchor.constraint(equalTo: userPasswordTextView.bottomAnchor, constant: 10).isActive = true
        userNewPassword.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        
        userNewPasswordTextView.topAnchor.constraint(equalTo: userNewPassword.bottomAnchor).isActive = true
        userNewPasswordTextView.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        userNewPasswordTextView.trailingAnchor.constraint(equalTo: changePasswordView.trailingAnchor, constant: -20).isActive = true
        
        userNewSecondPassword.topAnchor.constraint(equalTo: userNewPasswordTextView.bottomAnchor, constant: 10).isActive = true
        userNewSecondPassword.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        
        userNewSecondPasswordTextView.topAnchor.constraint(equalTo: userNewSecondPassword.bottomAnchor).isActive = true
        userNewSecondPasswordTextView.leadingAnchor.constraint(equalTo: changePasswordView.leadingAnchor, constant: 20).isActive = true
        userNewSecondPasswordTextView.trailingAnchor.constraint(equalTo: changePasswordView.trailingAnchor, constant: -20).isActive = true
        userNewSecondPasswordTextView.bottomAnchor.constraint(equalTo: changePasswordView.bottomAnchor, constant: -20).isActive = true
        
    }
}
