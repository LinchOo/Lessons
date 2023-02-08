//
//  CancellingMultiplePipelinesStoreSet.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine

struct CancellingMultiplePipelinesStoreSetModelView: View {
    @StateObject private var viewModel = CancellingMultiplePipelinesStoreSetModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("First Name", text: $viewModel.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.firstNameValidation)
            }
            .padding()
            HStack {
                TextField("Last Name", text: $viewModel.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.lastNameValidation)
            }
            .padding()
            
            Button("Cancel"){
                viewModel.cancelAllValidation()
            }
        }
    }
}

class CancellingMultiplePipelinesStoreSetModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var firstNameValidation: String = ""
    
    @Published var lastName: String = ""
    @Published var lastNameValidation: String = ""
    
    private var validationCancellables: Set<AnyCancellable> = []
    init() {
        $firstName
            .map { $0.isEmpty ? "❌" : "✅" }
            .sink { [unowned self] value in
                self.firstNameValidation = value
            }
            .store(in: &validationCancellables)
        $lastName
            .map { $0.isEmpty ? "❌" : "✅" }
            .sink { [unowned self] value in
                self.lastNameValidation = value
            }
            .store(in: &validationCancellables)
    }
    func cancelAllValidation() {
        firstNameValidation = ""
        lastNameValidation = ""
        validationCancellables.removeAll()
    }
    
}

struct CancellingMultiplePipelinesStoreSet_Previews: PreviewProvider {
    static var previews: some View {
        CancellingMultiplePipelinesStoreSetModelView()
    }
}
