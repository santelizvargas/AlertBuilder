//
//  AlertBuilder.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//


import UIKit

final class AlertBuilder: AlertBuilderRepresentable {
    private var title: String?
    private var message: String?
    private var actions: [AlertAction] = []
    private var preferredStyle: UIAlertController.Style = .alert
    
    // MARK: - Functions
    
    func setTitle(_ title: String) -> Self {
        self.title = title
        return self
    }
    
    func setMessage(_ message: String) -> Self {
        self.message = message
        return self
    }
    
    func addAction(_ action: AlertAction) -> Self {
        actions.append(action)
        return self
    }

    func setPreferredStyle(_ style: UIAlertController.Style) -> Self {
        preferredStyle = style
        return self
    }
    
    func build() -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        actions.forEach { action in
            let alertAction = UIAlertAction(title: action.title,
                                            style: action.style) { _ in
                action.handler?()
            }
            alertController.addAction(alertAction)
        }
        return alertController
    }
}
