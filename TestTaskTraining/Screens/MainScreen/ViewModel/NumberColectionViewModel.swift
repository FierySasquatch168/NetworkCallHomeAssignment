//
//  NumberColectionViewModel.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

final class NumberColectionViewModel {
    
    @Published private (set) var number: VisibleNumberModel
        
    init(number: VisibleNumberModel) {
        self.number = number
    }
}
