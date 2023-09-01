//
//  CustomViewButton.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit

final class CustomViewButton: UIButton {

    init(title: Int, appearance: Appearance) {
        super.init(frame: .zero)
        setAppearance(for: appearance)
        setTitle("\(title)", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomViewButton {
    func setAppearance(for appearance: Appearance) {
        switch appearance {
        case .red:
            backgroundColor = .red
            heightAnchor.constraint(equalToConstant: 100).isActive = true
        case .orange:
            backgroundColor = .orange
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
    }
}

extension CustomViewButton {
    enum Appearance {
        case red, orange
    }
}
