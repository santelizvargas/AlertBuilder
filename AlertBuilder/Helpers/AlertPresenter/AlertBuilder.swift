//
//  AlertBuilder.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

final class AlertBuilder: AlertBuilderProtocol {
    
    // MARK: - Properties
    
    private var alertTitle: String?
    private var alertMessage: String?
    private var alertActions: [AlertAction] = []
    private var alertStyle: UIAlertController.Style = .alert
    
    // MARK: - Initialization
    
    init() {}
    
    // MARK: - Configuration Methods
    
    @discardableResult
    func withTitle(_ title: String) -> AlertBuilderProtocol {
        self.alertTitle = title
        return self
    }
    
    @discardableResult
    func withMessage(_ message: String) -> AlertBuilderProtocol {
        self.alertMessage = message
        return self
    }
    
    @discardableResult
    func addAlertAction(_ action: AlertAction) -> AlertBuilderProtocol {
        alertActions.append(action)
        return self
    }
    
    @discardableResult
    func withPreferredStyle(_ style: UIAlertController.Style) -> AlertBuilderProtocol {
        alertStyle = style
        return self
    }
    
    // MARK: - Build Method
    
    func buildAlert() -> UIAlertController {
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: alertStyle
        )
        
        alertActions.forEach { action in
            let uiAction = UIAlertAction(
                title: action.title,
                style: action.style) { _ in
                action.handler?()
            }
            alertController.addAction(uiAction)
        }
        
        if alertActions.isEmpty {
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
        }
        return alertController
    }
}
