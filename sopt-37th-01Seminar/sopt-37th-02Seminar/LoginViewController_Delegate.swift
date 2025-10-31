//
//  LoginViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 10/18/25.
//

//
//  LoginViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 10/11/25.
//
import Foundation
import UIKit


final class LoginViewController_Delegate: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(10)
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(10)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.layer.cornerRadius = 6
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController_Delegate()
        vc.modalPresentationStyle = .overFullScreen
        vc.setLabelText(id: idTextField.text)
        self.present(vc, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.setLabelText(id: idTextField.text)
        welcomeViewController.delegate = self
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        guard let id = idTextField.text else { return }
        guard let pw = passwordTextField.text else { return }
        
        if !id.isEmpty && !pw.isEmpty {
            pushToWelcomeVC()
        }
    }
    
    
}

extension LoginViewController_Delegate: WelcomeReloginDelegate {
    
    func retryLogin(didTapReloginWith message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}
