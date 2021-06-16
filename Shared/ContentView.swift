//
//  ContentView.swift
//  Shared
//
//  Created by Paul Spencer on 6/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
           SendView()
                .tabItem {
                    Image(systemName: "arrow.up")
                    Text("Send")
                }
            ReceiveView()
                .tabItem {
                    Image(systemName: "arrow.down")
                    Text("Receive")
                }
             ProxyView()
                .tabItem {
                    Image(systemName: "arrow.up.arrow.down")
                    Text("Proxy")
                }
            DNSView()
               .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("DNS")
                }
            DOSView()
                .tabItem {
                    Image(systemName: "stop.circle")
                    Text("DOS")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
