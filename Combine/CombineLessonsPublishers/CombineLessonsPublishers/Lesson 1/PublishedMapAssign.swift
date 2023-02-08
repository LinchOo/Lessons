//
//  PublishedMapAssign.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

import SwiftUI
import Combine



struct PublishedMapAssign: View {
    
    @StateObject var viewModel = PublishedMapAssignViewModel()
    
    var body: some View {
        HStack {
            TextField("Your Name", text: $viewModel.name)
            Text(viewModel.validation)
        }
        .padding()
    }
}

class PublishedMapAssignViewModel: ObservableObject {
    @Published var name = ""
    @Published var validation = ""
    
    init(){
        $name
            .map { $0.isEmpty ? "❌" : "✅" }
            .assign(to: &$validation)
    }
}

struct PublishedMapAssign_Previews: PreviewProvider {
    static var previews: some View {
        PublishedMapAssign()
    }
}
