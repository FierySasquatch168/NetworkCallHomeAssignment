//
//  RouterDelegate.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation

protocol RouterDelegate: AnyObject {
    func setupRootViewController(_ viewController: Presentable?)
}
