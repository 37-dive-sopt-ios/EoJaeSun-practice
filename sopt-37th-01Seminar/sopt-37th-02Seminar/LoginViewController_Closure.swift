//
//  LoginViewController_Closure.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 10/18/25.
//

import Foundation
import UIKit
import SnapKit


final class LoginViewController_Closure: UIViewController {

    
    private let defualtPadding: CGFloat = 20
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(10)
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
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
//            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(160)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().offset(defualtPadding)
            $0.trailing.equalToSuperview().offset(-defualtPadding)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(defualtPadding)
            $0.trailing.equalToSuperview().offset(-defualtPadding)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(defualtPadding)
            $0.trailing.equalToSuperview().offset(-defualtPadding)
            $0.height.equalTo(58)
        }
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 163)
//        ])
//        
//        NSLayoutConstraint.activate([
//            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71),
//            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defualtPadding),
//            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defualtPadding),
//            idTextField.heightAnchor.constraint(equalToConstant: 52)
//            
//        ])
//        
//        NSLayoutConstraint.activate([
//            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 6),
//            passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor),
////            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defualtPadding),
////            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defualtPadding),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 52)
//        ])
//        
//        NSLayoutConstraint.activate([
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 35),
//            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defualtPadding),
//            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defualtPadding),
//            loginButton.heightAnchor.constraint(equalToConstant: 58)
//        ])
    }
    
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController_Closure()
        vc.modalPresentationStyle = .overFullScreen
        vc.setLabelText(id: idTextField.text)
        vc.completionHandler = { [weak self] message in
            guard let self = self else { return }
            self.handleCompletion(message: message)
        }
        self.present(vc, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.setLabelText(id: idTextField.text)
        welcomeViewController.completionHandler = { [weak self] message in
            guard let self = self else { return }
            self.handleCompletion(message: message)
        }
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
    
    private func handleCompletion(message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
        
    }

    
}

