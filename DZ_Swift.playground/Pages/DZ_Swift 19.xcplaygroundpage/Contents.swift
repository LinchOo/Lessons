import UIKit
//-------------/DZ_19/-------------//
/*
    Cтворити бібліотеку книг та фільмів
    Створити метод додавання нових книг та фільмів, з автоматичною сортировкою по алфавіту
    Створити функцію "Sort by mood" для фільмів і книжок
 */
struct Media {
    var name: String
    var author: String
    var type: String
}
class Library {
    var films = [Media]()
    var books = [Media]()
    func addBooks(name: String, author: String, type: String) {
        books.append(Media (name: name, author: author, type: type ))
        let sort = books.sorted{ (s1,s2) in s1.name < s2.name }
        books = sort
    }
    func addFilms(name: String, author: String, type: String) {
        films.append(Media (name: name, author: author, type: type ))
        let sort = films.sorted{ (s1 , s2) in s1.name > s2.name }
        films = sort
    }
    func sortMood(type: String) {
        let movieArray = films.filter{ $0.type == type }
        let movieArraySort = movieArray.sorted(by:{$0.name < $1.name}  )
        for el in movieArraySort {
            print("Media name: \(el.name)\nAuthor: \(el.author)\nType: \(el.type) ")
        }
    }
    
}
var newMedia = Library()
newMedia.addFilms(name: "Автомобиль", author: "Luk", type: "Fantasy")
newMedia.addFilms(name: "Боливуд", author: "John", type: "Fantasy")
newMedia.addFilms(name: "Властелин Колец", author: "Jimmy", type: "Fantasy")
newMedia.addFilms(name: "Need for speed", author: "Michael", type: "Race")



newMedia.sortMood(type: "Fantasy")
