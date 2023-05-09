//
//  ChatView.swift
//  SwiftChatv2
//
//  Created by Yu, Tong on 5/9/23.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @State private var messages: [String] = []
    var chatbotId: Int
    let userId = 1 // Use a sample userId for now; update it to the actual userId later


    var body: some View {
        VStack {
            
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }

            HStack {
                TextField("Type your message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .navigationBarTitle("Chat", displayMode: .inline)
    }

    func loadMessages() {
        let url = URL(string: "http://localhost:3000/get_messages?user_id=\(userId)&chatbot_id=\(chatbotId)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let messageList = try JSONSerialization.jsonObject(with: data, options: []) as? [String]
                    DispatchQueue.main.async {
                        self.messages = messageList ?? []
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func sendMessage() {
        if !messageText.isEmpty {
            let content = messageText
            messageText = ""
            // Your API call to send the message goes here
            // Replace the URL and parameters as needed
            let url = URL(string: "http://localhost:3000/send_message")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters = ["user_id": userId, "content": content, "chatbot_id": chatbotId] as [String: Any]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch {
                print("Error creating JSON: \(error)")
            }
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    DispatchQueue.main.async {
                        messages.append(content) // Append the message after sending
                    }
                }
            }
            task.resume()
        }
        loadMessages()
    }
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatbotId: 2)
    }
}
