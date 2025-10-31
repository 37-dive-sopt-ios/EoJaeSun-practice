//
//  ScrollViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 10/18/25.
//

import UIKit
import SnapKit

final class ScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let rectangleSize:Int = 400
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [greenView, blueView, redView, yellowView, purpleView,orangeView].forEach {
            contentView.addSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            // 이게모게
            $0.height.greaterThanOrEqualToSuperview().priority(.low) // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.height.equalTo(rectangleSize)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.height.equalTo(rectangleSize)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.height.equalTo(rectangleSize)
        }
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.trailing.equalTo(contentView)
            $0.height.equalTo(rectangleSize)
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.bottom.equalTo(contentView)
            $0.height.equalTo(rectangleSize)
        }
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView)
            $0.height.equalTo(rectangleSize)
        }

        
        
//        greenView.snp.makeConstraints {
//            $0.top.leading.trailing.equalTo(contentView)
//            $0.height.equalTo(800)
//        }
//        
//        blueView.snp.makeConstraints {
//            $0.top.equalTo(greenView.snp.bottom)
//            $0.leading.trailing.equalTo(contentView)
//            $0.height.equalTo(800)
//            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다.
//        }
    }
}


#Preview {
    ScrollViewController()
}
