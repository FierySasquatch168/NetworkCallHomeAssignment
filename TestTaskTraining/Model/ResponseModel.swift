//
//  ResponseModel.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

struct ResponseModel: Decodable {
    var numbers: [NumberModel]
}

struct NumberModel: Decodable, Hashable {
    var number: Int
}
