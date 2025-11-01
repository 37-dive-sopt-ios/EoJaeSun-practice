//
//  UIView+Extension.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/1/25.
//
    
import UIKit

extension UIView {

    /// UIView 여러 개 인자로 받아서 한 번에 addSubview 합니다.
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
