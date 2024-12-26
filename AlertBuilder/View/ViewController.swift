//
//  ViewController.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 25/12/24.
//

import UIKit

// MARK: - Constants

private enum AlertMessages {
    static let internalAlert = "This is a custom message"
    static let presenterAlert = "This is an alert from presenter"
    static let simpleAlert = "This is a simple alert"
}

final class ViewController: UIViewController {
    
    // MARK: - Alert Builders
    
    private lazy var internalAlert: UIAlertController = {
        let doneAction = AlertAction(title: "Done")
        
        return AlertBuilder()
            .setMessage(AlertMessages.internalAlert)
            .addAction(doneAction)
            .setPreferredStyle(.actionSheet)
            .build()
    }()
    
    private lazy var presenterAlert: UIAlertController = {
        AlertBuilder()
            .setMessage(AlertMessages.presenterAlert)
            .build()
    }()
    
    // MARK: - Alert Presentation
    
    private func presentInternalAlert() {
        navigationController?.present(internalAlert, animated: true)
    }
    
    private func presentPresenterAlert() {
        AlertPresenter.present(presenterAlert)
    }
    
    private func presentSimpleAlert() {
        AlertPresenter.present(AlertMessages.simpleAlert)
    }
    
    // MARK: - Actions
    
    @IBAction private func showAlert() {
//        presentInternalAlert()
        presentSimpleAlert()
//        presentPresenterAlert()
    }
}
