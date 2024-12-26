//
//  AlertPresenter.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

final class AlertPresenter {
    private init() { }
    
    // MARK: - Public Methods
    
    static func present(_ alert: UIAlertController) {
        presentFromTop(alert)
    }
    
    static func present(_ message: String) {
        let alert = AlertBuilder()
            .withMessage(message)
            .buildAlert()
        presentFromTop(alert)
    }
    
    static func present(_ title: String, message: String) {
        let alert = AlertBuilder()
            .withTitle(title)
            .withMessage(message)
            .buildAlert()
        presentFromTop(alert)
    }
    
    // MARK: - Private Methods
    
    static private func presentFromTop(_ alert: UIAlertController) {
        guard let topViewController = UIWindow.topViewController() else { return }
        topViewController.present(alert, animated: true)
    }
}
