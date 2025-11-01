//
//  LoginViewController_SnapKit.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/1/25.
//

import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        
        
    }
    
    
    
    // MARK: - setup
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    // MARK: - Private Methods
    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController_Delegate()
//        welcomeViewController.id = rootView.idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

#Preview {
    LoginViewController()
}
