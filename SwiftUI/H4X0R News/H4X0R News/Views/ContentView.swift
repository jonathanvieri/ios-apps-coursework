//
//  ContentView.swift
//  H4X0R News
//
//  Created by Jonathan Vieri on 19/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.indigo, for: .navigationBar)
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
