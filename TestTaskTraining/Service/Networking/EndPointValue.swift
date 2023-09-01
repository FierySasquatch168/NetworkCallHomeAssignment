//
//  EndPointProvider.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

enum EndPointValue {
    case main
    
    var stringValue: String {
        switch self {
        case .main:
            return K.baseUrl + K.baseQuery
        }
    }
}
