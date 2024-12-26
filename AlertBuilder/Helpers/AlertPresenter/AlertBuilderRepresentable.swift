//
//  AlertBuilderRepresentable.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

protocol AlertBuilderRepresentable {
    func setTitle(_ title: String) -> AlertBuilderRepresentable
    func setMessage(_ message: String) -> AlertBuilderRepresentable
    func addAction(_ action: AlertAction) -> AlertBuilderRepresentable
    func setPreferredStyle(_ style: UIAlertController.Style) -> AlertBuilderRepresentable
    func build() -> UIAlertController
}
