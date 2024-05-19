//
//  LoadingView.swift
//  LoadingProgressView
//
//  Created by Sam on 2024/5/18.
//

import SwiftUI

struct LoadingView: View {
    
    var message: String?
    var background: Color = Color(.tertiarySystemBackground)
    
    var body: some View {
        ZStack {
            Color(.label)
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                SpinnerView()
                    .padding(message == nil ? .vertical : .top)
                
                if let message {
                    Text(message)
                        .font(.system(.subheadline))
                        .foregroundStyle(Color(.label))
                        .padding(.bottom)
                        .lineLimit(1)
                }
            }
            .padding(.horizontal)
            .padding()
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
        .zIndex(.greatestFiniteMagnitude)
        .ignoresSafeArea()
    }
}

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(message: "Loading")
    }
}
#endif
