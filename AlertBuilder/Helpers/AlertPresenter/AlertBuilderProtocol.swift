//
//  AlertBuilderProtocol.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

protocol AlertBuilderProtocol {
    func withTitle(_ title: String) -> AlertBuilderProtocol
    func withMessage(_ message: String) -> AlertBuilderProtocol
    func addAlertAction(_ action: AlertAction) -> AlertBuilderProtocol
    func withPreferredStyle(_ style: UIAlertController.Style) -> AlertBuilderProtocol
    func buildAlert() -> UIAlertController
}
