//
//  KeyboardResponder.swift
//  KeyboardTesting
//
//  Created by Igor Malyarov on 18.12.2020.
//

import SwiftUI

@available(iOS 14.0, *)
final class KeyboardResponder: ObservableObject {

    @Published private(set) var currentHeight: CGFloat = 0
    private let notificationCenter: NotificationCenter

    var keyboardDuration: TimeInterval = 0

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func dismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
            keyboardDuration = duration

            withAnimation(.easeInOut(duration: duration)) {
                self.currentHeight = keyboardSize.height
            }

        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        guard let duration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        withAnimation(.easeInOut(duration: duration)) {
            self.currentHeight = 0
        }
    }
}
