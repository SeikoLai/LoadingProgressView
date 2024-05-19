//
//  SpinnerView.swift
//  LoadingProgressView
//
//  Created by Sam on 2024/5/17.
//

import SwiftUI

struct SpinnerView: View {
    @State private var isActivating: Bool = false
    
    var spinnerGradient: [Color] = [.white, .black]
    
    @State private var diameter: CGFloat = 30
    @State private var circleWidth: CGFloat = 4
    
    var body: some View {
        Circle()
            .stroke(LinearGradient(colors: spinnerGradient,
                                   startPoint: .top,
                                   endPoint: .bottom), lineWidth: circleWidth)
            .frame(width: diameter, height: diameter)
            .rotationEffect(Angle(degrees: isActivating ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.25), value: isActivating)
            .onAppear {
                isActivating.toggle()
            }
    }
}

#if DEBUG
struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
#endif
