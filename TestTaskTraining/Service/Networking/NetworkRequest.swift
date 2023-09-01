//
//  NetworkRequest.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

struct NetworkRequest {
    let endPoint: URL?
    let httpMethod: HttpMethod
}

enum HttpMethod: String {
    case get = "GET"
}
