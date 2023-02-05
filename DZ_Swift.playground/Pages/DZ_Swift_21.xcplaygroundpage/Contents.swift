import UIKit
//-------------/DZ_21/-------------//
/*
    Cтворити любий Generic для struct, class, func, enum (по одному на кожний)
    Створити функцію котра отримує generic об'єкт і додає в array\dict
    Створити клас котрий сортує масив значень 3ма способами
    Створити класс на свій смак(любі методи та проперті) універсального типу
    Використовуючи extension, розширити клас, додати сабскрипт
 */
struct Family<T> {
    var Brothers = [T]()
    var Sisters = [T]()
    mutating func add(el: T, what: Int) {
        
        switch what {
        case 1: Brothers.append(el)
        case 2: Sisters.append(el)
        default: break
            
        }
    }
}
class Printer<T> {
    var bd = [T]()
    func scan(el: T) {
        bd.append(el)
    }
}
/*class Sorter<T> {
    func sort1(aray: [T]) -> [T] {
        let sort1 = aray.sorted(by: {$0 < $1})
        return sort1
    }
    func sort2(aray: [T]) -> [T] {
        return aray.sort()
    }
    func sort3(aray: [T]) -> [T] {
        return aray.sorted{(s1,s2) in s1.count < s2.count}
    }
}*/

class Media<T> {
    var SongsArray = [T]()
    var FilmsArray = [T]()
    func addSongs(el: T) {
        SongsArray.append(el)
    }
}
extension Media{
    func addFilms(el: T) {
        FilmsArray.append(el)
    }
    subscript(index: Int) -> Int{
        get{
            switch index {
            case 0: return SongsArray.count
            case 1: return FilmsArray.count
            default: return 0
            }
        }
    }
}
