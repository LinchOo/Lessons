//
//  EmptySequenceAnyPublishereraseToAnyPublisherFlatMap.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine
/*
 Empty publisher, Publishers.Sequence, AnyPublisher, eraseToAnyPublisher, flatMap.mp4
*/
struct EmptySequenceAnyPublishereraseToAnyPublisherFlatMapViewModel: View {
    @StateObject private var viewModel = EmptySequenceAnyPublishereraseToAnyPublisherFlatMapModel()
    
    var body: some View {
        VStack(spacing: 20) {
            List(viewModel.dataToView, id: \.self) { item in
                Text(item)
            }
            .font(.title)
        }
        .onAppear{
            viewModel.fetch()
        }
    }
}
class EmptySequenceAnyPublishereraseToAnyPublisherFlatMapModel: ObservableObject {
    @Published var dataToView: [String] = []
    
    let data = ["Value 1", "Value 2", "Value 3", nil, "Value 5", nil, "Value 7"]
    
    func fetch() {
        _ = data.publisher
            .flatMap{ item -> AnyPublisher<String, Never> in
                if let item = item {
                    return Just(item)
                        .eraseToAnyPublisher()
                } else {
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
            }
            .sink{ [unowned self] item in
                dataToView.append(item)
            }
    }
}


struct EmptySequenceAnyPublishereraseToAnyPublisherFlatMap_Previews: PreviewProvider {
    static var previews: some View {
        EmptySequenceAnyPublishereraseToAnyPublisherFlatMapViewModel()
    }
}
