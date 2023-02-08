//
//  AnyCancellableSinkDelay.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine

struct AnyCancellableSinkDelayView: View {
    @StateObject var viewModel = AnyCancellableSinkDelayViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.data)
                .font(.title)
                .foregroundColor(.green)
            Text(viewModel.status)
                .foregroundColor(.blue)
            Spacer()
            Button{
                viewModel.cancel()
            } label: {
                Text("Cancel")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(.red)
            .cornerRadius(8)
            .opacity(viewModel.status == "Bank request..." ? 1.0 : 0.0)
            
            Button{
                viewModel.refresh()
            } label: {
                Text("Request data")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(.blue)
            .cornerRadius(8)
            .padding()
        }
    }
}

class AnyCancellableSinkDelayViewModel: ObservableObject {
    @Published var data = ""
    @Published var status = ""
    
    private var cancallable: AnyCancellable?
    
    init(){
        cancallable = $data
            .map{ [unowned self] value -> String in
                status = "Bank request..."
                return value
            }
            .delay(for: 5, scheduler: DispatchQueue.main)
            .sink{ [unowned self] value in
                self.data = "Bank account 23123.00$"
                self.status = "Data recived"
            }
    }
    func refresh() {
        data = "Refresh data"
    }
    func cancel() {
        status = "Operation canceled"
        cancallable?.cancel()
        cancallable = nil
    }
}

struct AnyCancellableSinkDelay_Previews: PreviewProvider {
    static var previews: some View {
        AnyCancellableSinkDelayView()
    }
}
