//
//  ContentView.swift
//  LoadingProgressView
//
//  Created by Sam on 2024/5/17.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading: Bool = false
    @State private var message: String = "Loading"
    
    var body: some View {
        VStack {
            Button(action: {
                isLoading.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.isLoading.toggle()
                })
            }, label: {
                Text("Supreme")
                    .padding()
                    .bold()
                    .foregroundStyle(Color(.systemGroupedBackground))
                    .background(.red)
            })
        }
        .loading($isLoading, message: message)

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
