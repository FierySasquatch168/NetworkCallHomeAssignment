//
//  NumberCollectionCell.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit

final class NumberCollectionCell: UICollectionViewCell {
    var viewModel: NumberColectionViewModel? {
        didSet {
            bind()
        }
    }
    
    private var heightConstraint: NSLayoutConstraint?
        
    private lazy var numberButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func prepareForReuse() {
        heightConstraint?.isActive = false
    }
}

// MARK: - Ext Bind
private extension NumberCollectionCell {
    func bind() {
        viewModel?.$number
            .sink(receiveValue: { [weak self] model in
                self?.setupButton(model)
                self?.addButtonToView(model)
            }).cancel()
    }
}

// MARK: - UI setup
private extension NumberCollectionCell {
    func setupButton(_ model: VisibleNumberModel) {
        numberButton.setTitle("\(model.number)", for: .normal)
        numberButton.backgroundColor = .init(hexString: model.color)
    }
    
    func addButtonToView(_ model: VisibleNumberModel) {
        addSubview(numberButton)
        numberButton.translatesAutoresizingMaskIntoConstraints = false
        
        heightConstraint = numberButton.heightAnchor.constraint(equalToConstant: model.height)
        heightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            numberButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
