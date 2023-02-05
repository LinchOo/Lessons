import UIKit

//--------------"Наследование и ООП"--------------

class People {
    var name = "John"
    var lastName = "Smith"
    var fullName: String {
        return name + "" + lastName
    }
    func prinesMethod() -> String {
        return "Your name - "
    }
}
class Man: People {
    override func prinesMethod() -> String {
        return super.prinesMethod() + "Jack"
    }
}

let people = People()
people.name
people.prinesMethod()
let man = Man()
man.name
man.prinesMethod()

//---------------//Инкапсуляция//---------------//
class Boys {
    var firstName = "Bob"
    var lastName = "Mich"
    func printHi() {
        print("Hi")
    }
}
class Girsl: Boys {
}
let girls = Girsl()
girls.printHi()
//---------------//Полиморфизм//---------------//
class Cityzen {
    func methodHi(){
        print("Hello Night City! ")
    }
}
class Man1: Cityzen {
    override func methodHi(){
        print("Man1 say Hi")
    }
}
class Man2: Cityzen {
    override func methodHi(){
        print("Man2 say Hi")
    }
}

let cityzen = Cityzen()
let man1 = Man1()
let man2 = Man2()

var city = [cityzen, man1, man2]
for man in city {
    man.methodHi()
}
