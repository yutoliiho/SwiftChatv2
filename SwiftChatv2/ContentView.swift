//
//  ContentView.swift
//  SwiftChatv2
//
//  Created by Yu, Tong on 5/9/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var selection: Int? = nil
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                // Action for Adam button
            }) {
                Text("Adam")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Button(action: {
                // Action for Eve button
            }) {
                Text("Eve")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Button(action: {
                // Action for Profile button
            }) {
                Text("Profile")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
