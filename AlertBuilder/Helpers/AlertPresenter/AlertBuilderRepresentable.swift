//
//  AlertBuilderRepresentable.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

protocol AlertBuilderRepresentable {
    func setTitle(_ title: String) -> Self
    func setMessage(_ message: String) -> Self
    func addAction(_ action: AlertAction) -> Self
    func setPreferredStyle(_ style: UIAlertController.Style) -> Self
    func build() -> UIAlertController
}
