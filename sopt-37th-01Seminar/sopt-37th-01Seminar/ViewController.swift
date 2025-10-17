//
//  ViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 10/11/25.
//

import UIKit

class ViewController: UIViewController {
    private var redView: UIView = {
        var view = UIView(frame: CGRect(origin: CGPoint(x: 100, y: 200),
                                        size: CGSize(width: 100, height: 100)))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(redView)
        print("frame: \(self.redView.frame)\nbounds: \(self.redView.bounds)")
    }
}

