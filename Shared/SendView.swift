//
//  SendView.swift
//  Net Tools
//
//  Created by Paul Spencer on 6/16/21.
//

import Foundation
import SwiftUI
import Network

struct SendView: View {
    @State var response_text = "Nothing yet..."
    @State var url_text = "https://test.com"
    
    func fetch_content() {
        response_text = "Loading..."
        let url = URL(string: url_text)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = create_session()
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                response_text = "Something went wrong: \(error.localizedDescription)"
            } else if let data = data {
                response_text = String(data: data, encoding: .utf8)!
            } else {
                response_text = "Something unexpected happened"
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter url", text: $url_text)
                .padding()
            
                Button {
                    fetch_content()
                } label: {
                    Text("Send")
                }
                .buttonStyle(DefaultButtonStyle())
                .padding()
            }
            ScrollView {
                Text(response_text).padding()
            }
        }
    }

}
