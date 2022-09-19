//
//  EntryView.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

struct EntryView: View {
    @StateObject private var viewModel: EntryViewModel

    init(viewModel: EntryViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        content
            .navigationTitle("Points")
    }

    @ViewBuilder
    private var content: some View {
        VStack(spacing: 20) {
            descriptionText
            textField
            startButton
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .padding()
    }

    @ViewBuilder
    private var descriptionText: some View {
        VStack {
            Text("Request a specific number of points")
                .font(.title)
            Text("You can request from 1 to 1000 points")
                .font(.subheadline)
        }
        .multilineTextAlignment(.center)
    }

    @ViewBuilder
    private var textField: some View {
        TextField("sdsasadsadas",
                  value: $viewModel.textFieldValue,
                  formatter: viewModel.textFieldFormatter)
        .keyboardType(.asciiCapableNumberPad)
    }

    @ViewBuilder
    private var startButton: some View {
        Button("Start") {
            
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EntryView()
        }
    }
}
