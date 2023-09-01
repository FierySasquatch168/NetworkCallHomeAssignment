//
//  Presentable.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import UIKit

protocol Presentable: AnyObject {
    func getVC() -> UIViewController?
}

extension UIViewController: Presentable {
    func getVC() -> UIViewController? {
        return self
    }
}
