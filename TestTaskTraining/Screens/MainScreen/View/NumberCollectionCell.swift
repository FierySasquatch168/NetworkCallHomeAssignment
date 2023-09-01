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
    
    private var numberButton: CustomViewButton? {
        didSet {
            setupButton()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        numberButton?.removeFromSuperview()
        numberButton = nil
        viewModel = nil
    }
}

// MARK: - Ext Bind
private extension NumberCollectionCell {
    func bind() {
        viewModel?.$number
            .sink(receiveValue: { [weak self] visibleNumberModel in
                self?.createButton(visibleNumberModel)
            }).cancel()
    }
}

// MARK: - Button setup
private extension NumberCollectionCell {
    func createButton(_ model: VisibleNumberModel) {
        numberButton = CustomViewButton(title: model.number, appearance: model.appearence)
    }
    
    func setupButton() {
        guard let numberButton else { return }
        addSubview(numberButton)
        numberButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
