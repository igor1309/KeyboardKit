//
//  KeyboardToolbar.swift
//  KeyboardTesting
//
//  Created by Igor Malyarov on 18.12.2020.
//

import SwiftUI

@available(iOS 14.0, *)
extension View {
    /// Modify the view by combinig the software keyboard with toolbar
    /// - Parameter toolbar: View for toolbar
    /// - Returns: modified view
    public func keyboardToolbar<Toolbar: View>(@ViewBuilder toolbar: @escaping () -> Toolbar) -> some View {
        self.modifier(KeyboardToolbar(toolbar: toolbar))
    }

    /// Modify the view by combinig the software keyboard with `default` toolbar with one trailing button to  dismiss the keyboard
    /// - Returns: modified view
    public func keyboardToolbar() -> some View {
        self.keyboardToolbar {
                HStack {
                    Spacer()

                    Button(action: self.hideKeyboard) {
                        Image(systemName: "keyboard.chevron.compact.down")
                            .frame(width: 44, height: 44, alignment: .center)
                    }
                    .foregroundColor(.primary)
                }
            }
    }

    public func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}

@available(iOS 14.0, *)
fileprivate struct KeyboardToolbar<Toolbar: View>: ViewModifier {

    let toolbar: () -> Toolbar

    init(@ViewBuilder toolbar: @escaping () -> Toolbar) {
        self.toolbar = toolbar
    }

    @StateObject private var keyboard = KeyboardResponder()

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .padding(.bottom, keyboard.currentHeight == 0 ? 0 : toolbarHeight)

            ZStack(alignment: .top) {
                Capsule()
                    .fill(isDragging ? Color(UIColor.tertiaryLabel) : .clear)
                    .frame(width: 100, height: capsuleHeight)
                    .offset(y: 5)

                toolbar()
            }
            .frame(maxWidth: .infinity, maxHeight: toolbarHeight)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .gesture(dragging())
            .opacity(keyboard.currentHeight == 0 ? 0 : 1)
            .animation(.easeInOut(duration: keyboard.keyboardDuration))
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
    }

    private let toolbarHeight: CGFloat = 40.0

    // MARK: - Gesture

    @GestureState private var isDragging = false
    @State private var capsuleHeight: CGFloat = 3

    private func dragging() -> some Gesture {
        DragGesture()
            .updating($isDragging) { currentState, gestureState, transaction in
                gestureState = true

                if currentState.translation.height > 44 {
                    withAnimation {
                        keyboard.dismiss()
                    }
                }
            }
    }

}
