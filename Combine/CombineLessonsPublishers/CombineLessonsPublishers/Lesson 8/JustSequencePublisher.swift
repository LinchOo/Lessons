//
//  JustSequencePublisher.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine

struct JustSequencePublisherViewModel: View {
    @StateObject private var viewModel = JustSequencePublisherModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.title)
                .bold()
            Form{
                Section(header: Text("Candidates").padding()) {
                    List(viewModel.dataToView, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .font(.title)
        .onAppear{
            viewModel.fetch()
        }
    }
}

class JustSequencePublisherModel: ObservableObject {
    @Published var title = ""
    @Published var dataToView: [String] = []
    
    var names = ["Julian", "Jack", "Aslyng"]
    func fetch() {
        _ = names.publisher
            .sink(receiveCompletion: {completion in
                print(completion)
            }, receiveValue: { [unowned self] value in
                dataToView.append(value)
                print(value)
            })
        if names.count > 0 {
            Just(names[1])
                .map{ item in
                    item.uppercased()
                }
                .assign(to: &$title)
        }
    }
}

struct JustSequencePublisher_Previews: PreviewProvider {
    static var previews: some View {
        JustSequencePublisherViewModel()
    }
}
