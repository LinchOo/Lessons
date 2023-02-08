//
//  URLSessionDataTaskPublisherDecode.swift
//  CombineLessonsPublishers
//
//  Created by Олег Коваленко on 08.02.2023.
//

//https://jsonplaceholder.typicode.com/posts
//https://via.placeholder.com/600/d32776
import SwiftUI
import Combine

struct URLSessionDataTaskPublisherDecodeView: View {
    @StateObject private var viewModel = URLSessionDataTaskPublisherDecodeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            List(viewModel.dataToView, id: \.title) { post in
                Text(post.title)
                    .font(.title)
                    .bold()
                Text(post.body)
                    .font(.caption2)
            }
        }
        .onAppear{
            viewModel.ParsePosts()
        }
//        VStack(spacing: 20) {
//            viewModel.avatarImage
//        }
//        .onAppear{
//            viewModel.FetchImage()
//        }
    }
}

struct Post: Decodable {
    let title: String
    let body: String
}
struct ErrorForAlert: Error, Identifiable {
    let id = UUID()
    let title = "Error"
    var message = "try again later"
}

class URLSessionDataTaskPublisherDecodeViewModel: ObservableObject {
    @Published var avatarImage: Image?
    @Published var alerError: ErrorForAlert?
    @Published var dataToView: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func FetchImage() {
        guard let url = URL(string: "https://via.placeholder.com/600/d32776") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .tryMap { data in
                guard let uiImage = UIImage(data: data) else {
                    throw ErrorForAlert(message: "No iamge")
                }
                return Image(uiImage: uiImage)
            }
            .receive(on: RunLoop.main)
            .replaceError(with: Image("blank"))
            .sink { [unowned self] image in
                avatarImage = image
            }
            .store(in: &cancellables)
    }
    func ParsePosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { [unowned self] posts in
                dataToView = posts
            }
            .store(in: &cancellables)
    }
}
struct URLSessionDataTaskPublisherDecode_Previews: PreviewProvider {
    static var previews: some View {
        URLSessionDataTaskPublisherDecodeView()
    }
}
