//
//  JustCustomErrorSetFailureType.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine


struct JustCustomErrorSetFailureTypeViewModel: View {
    @StateObject private var viewModel = JustCustomErrorSetFailureTypeModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.age)")
                .font(.title)
                .foregroundColor(.green)
                .padding()
            TextField("Enter age", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
            Button("Save"){
                viewModel.save()
            }
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text("Error"), message: Text(error.rawValue))
            
        }
    }
}

enum InvalidAgeError: String, Error, Identifiable {
    var id: String { rawValue }
    case lessZero = "less then 0"
    case moreHundred = "more then 100"
}

class JustCustomErrorSetFailureTypeModel: ObservableObject {
    @Published var text = ""
    @Published var age = 0
    @Published var error: InvalidAgeError?
    
    func save() {
        _ = validationPublisher(age: Int(text) ?? -1)
            .sink{ [unowned self] complition in
                switch complition {
                case .failure(let error):
                    self.error = error
                case .finished:
                    break
                }
            } receiveValue: { [unowned self] value in
                self.age = value
            }
    }
    func validationPublisher(age: Int) -> AnyPublisher<Int, InvalidAgeError> {
        if age < 0 {
            return Fail(error: InvalidAgeError.lessZero)
                .eraseToAnyPublisher()
        } else if age > 100 {
            return Fail(error: InvalidAgeError.moreHundred)
                .eraseToAnyPublisher()
        }
        
        return Just(age)
            .setFailureType(to: InvalidAgeError.self)
            .eraseToAnyPublisher()
    }
}
struct JustCustomErrorSetFailureType_Previews: PreviewProvider {
    static var previews: some View {
        JustCustomErrorSetFailureTypeViewModel()
    }
}
