//
//  TextAlert.swift
//  GB_Task list_KS
//
//  Created by Константин Шмондрик on 28.03.2022.
//


import UIKit

class TextAlert {
    
    func textAlert(_ handler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Add task", message: "Enter new task name", preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Enter new task name"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default) { [unowned alert] _ in handler(alert.textFields![0].text ?? "") })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        showAlert(alert: alert)
    }
    
    func showAlert(alert: UIAlertController) {
        if let controller = topMostViewController() {
            controller.present(alert, animated: true)
        }
    }
    
    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive}
            .compactMap {$0 as? UIWindowScene}
            .first?.windows.filter {$0.isKeyWindow}.first
    }
    
    private func topMostViewController() -> UIViewController? {
        guard let rootController = keyWindow()?.rootViewController else {
            return nil
        }
        return topMostViewController(for: rootController)
    }
    
    private func topMostViewController(for controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return topMostViewController(for: presentedController)
        } else if let navigationController = controller as? UINavigationController {
            guard let topController = navigationController.topViewController else {
                return navigationController
            }
            return topMostViewController(for: topController)
        } else if let tabController = controller as? UITabBarController {
            guard let topController = tabController.selectedViewController else {
                return tabController
            }
            return topMostViewController(for: topController)
        }
        return controller
    }
}
