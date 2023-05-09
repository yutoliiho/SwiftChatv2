//
//  RegisterView.swift
//  SwiftChatv2
//
//  Created by Yu, Tong on 5/9/23.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    @Binding var isRegistered: Bool
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Handle registration process
                isRegistered = true
            }) {
                Text("Register")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegistered: .constant(false))
    }
}
