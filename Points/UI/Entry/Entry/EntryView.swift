//
//  EntryView.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

struct EntryView: View {
    @StateObject private var viewModel: EntryViewModel
    @FocusState private var focusField: EntryViewFocusField?

    init(viewModel: EntryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        content
            .onAppear {
                focusField = .pointsField
            }
            .onChange(of: viewModel.hudItem, perform: { newValue in
                manageProgressHUD(newValue)
            })
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
        let bindingText = Binding {
            viewModel.textFieldValue
        } set: { newValue, transaction in
            viewModel.textFieldValue = newValue.allowedOnlyPositiveNumbers()
        }

        TextField("Please entry number of points",
                  text: bindingText)
        .textFieldStyle(.roundedBorder)
        .multilineTextAlignment(.center)
        .keyboardType(.asciiCapableNumberPad)
        .focused($focusField, equals: EntryViewFocusField.pointsField)
    }

    @ViewBuilder
    private var startButton: some View {
        Button("Start") {
            focusField = nil
            viewModel.requestPoints()
        }
        .disabled(!viewModel.isValidNumber)
    }

    // MARK: - UI functions

    private func manageProgressHUD(_ hudItem: ProgressHUDItem) {
        if let result = hudItem.result {
            switch result {
            case .success:
                ProgressHUD.showSucceed()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        } else if hudItem.showProgressHUD {
            ProgressHUD.show(interaction: false)
        }
    }

}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = AppCoordinator()
        NavigationStack {
            EntryView(viewModel: .init(coordinator))
        }
    }
}
