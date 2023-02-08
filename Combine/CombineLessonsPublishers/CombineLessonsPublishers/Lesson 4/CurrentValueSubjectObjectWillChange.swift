//
//  CurrentValueSubjectObjectWillChange.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine
/*
        @Published              CurrentValueSubject
        1.First Pipeline        1.Set
        2.Set                   2.Pipeline
        3.UI autoUpdate         3.UI update if -> objectWillChange.send()
 
 
 */
struct CurrentValueSubjectObjectWillChangeView: View {
    @StateObject private var viewModel = CurrentValueSubjectObjectWillChangeViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.selectionSame.value ? "2 times selected" : "") \(viewModel.selection.value)")
                .foregroundColor(viewModel.selectionSame.value ? .red : .green)
                .padding()
            Button("Select SwiftUI") {
                viewModel.selection.value = "Swift"
            }
            .padding()
            
            Button("Select UIKit") {
                viewModel.selection.send("UIKit")
            }
            .padding()
        }
    }
}

class CurrentValueSubjectObjectWillChangeViewModel: ObservableObject {
    var selection = CurrentValueSubject<String, Never>("Empty")
    var selectionSame = CurrentValueSubject<Bool, Never>(false)
    
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        selection
            .map { [unowned self] newValue -> Bool in
                if newValue == selection.value {
                    return true
                } else {
                    return false
                }
            }
            .sink{ [unowned self] value in
                selectionSame.value = value
                objectWillChange.send()
            }
            .store(in: &cancellable)
    }
}

struct CurrentValueSubjectObjectWillChange_Previews: PreviewProvider {
    static var previews: some View {
        CurrentValueSubjectObjectWillChangeView()
    }
}
