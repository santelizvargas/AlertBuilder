//
//  AlertBuilder.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

final class AlertBuilder: AlertBuilderRepresentable {
    
    // MARK: - Properties
    
    private var title: String?
    private var message: String?
    private var actions: [AlertAction] = []
    private var preferredStyle: UIAlertController.Style = .alert
    
    // MARK: - Initialization
    
    init() {}
    
    // MARK: - Implementation
    
    @discardableResult
    func setTitle(_ title: String) -> AlertBuilderRepresentable {
        self.title = title
        return self
    }
    
    @discardableResult
    func setMessage(_ message: String) -> AlertBuilderRepresentable {
        self.message = message
        return self
    }
    
    @discardableResult
    func addAction(_ action: AlertAction) -> AlertBuilderRepresentable {
        actions.append(action)
        return self
    }
    
    @discardableResult
    func setPreferredStyle(_ style: UIAlertController.Style) -> AlertBuilderRepresentable {
        preferredStyle = style
        return self
    }
    
    // MARK: - Build Method
    
    func build() -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        actions.forEach { action in
            let action = UIAlertAction(title: action.title,
                                       style: action.style) { _ in
                action.handler?()
            }
            alertController.addAction(action)
        }
        
        if actions.isEmpty {
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
        }
        return alertController
    }
}
