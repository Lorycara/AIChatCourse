//
//  AnyAppAlertt.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 13/01/25.
//
import SwiftUI
// MARK: TO MOVE AVAWAY
extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
        if !newValue {
            value.wrappedValue = nil
        }
    }

    }
}

extension View {
    func showCustomAlert(alert: Binding<AnyAppAlert?>) -> some View {
        self
            .alert(alert.wrappedValue?.title ?? "", isPresented: Binding(ifNotNil: alert)) {
                alert.wrappedValue?.buttons()
            } message: {
                Text(alert.wrappedValue?.subTilte ?? "")
            }
    }
}

struct AnyAppAlert: Sendable {
    var title: String
    var subTilte: String?
    var buttons: @Sendable () -> AnyView
    
    init(
        title: String,
        subTilte: String? = nil,
        buttons: (@Sendable () -> AnyView)? = nil
    ) {
        self.title = title
        self.subTilte = subTilte
        self.buttons = buttons ?? {
            AnyView(
                Button("OK") {}
            )}
    }
}
