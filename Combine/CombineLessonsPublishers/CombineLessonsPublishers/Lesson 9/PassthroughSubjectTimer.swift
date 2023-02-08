//
//  PassthroughSubjectTimer.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine

struct PassthroughSubjectTimerView: View {
    @StateObject private var viewModel = PassthroughSubjectTimerViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                Button("Start") {
                    viewModel.verifyState.send("00:00")
                    viewModel.start()
                }
            case .data(let time):
                Text(time)
                    .font(.title)
                    .foregroundColor(.green)
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
    }
}

enum ViewState<Model> {
    case loading
    case data(_ data: Model)
    case error(_ error: Error)
}

class PassthroughSubjectTimerViewModel: ObservableObject {
    @Published var state: ViewState<String> = .loading
    
    let verifyState = PassthroughSubject<String, Never>()
    var cancellable: AnyCancellable?
    var timerCancellable: AnyCancellable?
    
    init() {
        bind()
    }
    func bind() {
        cancellable = verifyState
            .sink(receiveValue: { [unowned self] value in
                if !value.isEmpty {
                    state = .data(value)
                } else {
                    state = .error(NSError(domain: "Error Time", code: 101))
                }
            })
    }
    func start() {
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "mm:ss"
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: {[unowned self] datum in
                verifyState.send(timeFormat.string(from: datum))
            })
    }
}

struct PassthroughSubjectTimer_Previews: PreviewProvider {
    static var previews: some View {
        PassthroughSubjectTimerView()
    }
}
