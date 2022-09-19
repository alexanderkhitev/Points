//
//  AppView.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
