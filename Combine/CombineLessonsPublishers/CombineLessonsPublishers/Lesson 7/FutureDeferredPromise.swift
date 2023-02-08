//
//  FutureDeferredPromise.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine

struct FutureDeferredPromiseViewModel: View {
    @StateObject private var viewModel = FutureDeferredPromiseModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.firstResult)
            Button("Start") {
                viewModel.fetch()
            }
        }
        .font(.title)
        .onAppear{
            viewModel.fetch()
        }
    }
}

class FutureDeferredPromiseModel: ObservableObject {
    @Published var firstResult = ""
    
    var cancellable: AnyCancellable?
    func CreateFetch(url: URL) -> AnyPublisher<String?, Error> {
        Future { promise in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                promise(.success(response?.url?.absoluteString ?? ""))
            }
            task.resume()
        }
        .eraseToAnyPublisher()
    }
    func fetch() {
        guard let url = URL(string: "https://google.com") else { return }
        
        cancellable = CreateFetch(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [unowned self] value in
                firstResult = value ?? ""
            }
    }
}
struct FutureDeferredPromise_Previews: PreviewProvider {
    static var previews: some View {
        FutureDeferredPromiseViewModel()
    }
}
