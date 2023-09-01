//
//  RequestCreator.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

struct RequestCreator {
    static func createGetRequest(endPoint: EndPointValue) -> NetworkRequest {
        return NetworkRequest(endPoint: URL(string: endPoint.stringValue),
                              httpMethod: .get)
    }
}
