//
//  LoadingModifier.swift
//  LoadingProgressView
//
//  Created by Sam on 2024/5/18.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    
    @Binding var isActivating: Bool
    
    var message: String?
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isActivating {
                LoadingView(message: message)
            }
        }
    }
}

extension ViewModifier where Self == LoadingModifier {
    static func loadingModifier(_ isActivating: Binding<Bool>, message: String? = nil) -> LoadingModifier {
        LoadingModifier(isActivating: isActivating, message: message)
    }
}

extension View {
    func loading(_ isActivating: Binding<Bool>, message: String? = nil) -> some View {
        modifier(.loadingModifier(isActivating, message: message))
    }
}
