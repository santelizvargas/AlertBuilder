//
//  UIWindow+TopViewController.swift
//  AlertBuilder
//
//  Created by Steven Santeliz on 26/12/24.
//

import UIKit

extension UIWindow {
    static private var root: UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }
        return keyWindow.rootViewController
    }
    
    static func topViewController(from viewController: UIViewController? = root) -> UIViewController? {
        switch viewController {
            case let tabBarController as UITabBarController:
                topViewController(from: tabBarController.selectedViewController)
                
            case let navigationController as UINavigationController:
                topViewController(from: navigationController.visibleViewController)
                
            case let presentedViewController where viewController?.presentedViewController != nil:
                topViewController(from: presentedViewController)
                
            default: viewController
        }
    }
}

