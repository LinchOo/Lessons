import UIKit

class PersClass{
    var array = [String]()
    var name = ""
    var age = 20
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}
class Chel: PersClass{
    func method(name: String){
        print("Hello, \(name)")
    }
}
var ChellClass = Chel(name: "Igor", age:30) // экземпляр класса
print(ChellClass.name)
var ChellClass2 = Chel(name: "Vova", age:20)
print(ChellClass2.name)
print(ChellClass.name)
ChellClass.name // свойства класса
//ChellClass.method(name: "Jack") // метод экземпляра класса

ChellClass.name = "Vova"
ChellClass.age = 23

//---------------Struct---------------//
struct ManStruct{
    var name: String
    var age: Int
}
var man1 = ManStruct(name: "Oleg", age:  32)
var man2 = ManStruct(name: "Vlad", age: 22)
print(man1)
print(man2)

