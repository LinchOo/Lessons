import UIKit
/*
        Свойства - это значения, связаные с классом или его экземпляром
 1) Если свойства связанно с экземпляром класса, то они называются свойствами экземпляра класса.
 2) Если с самим классом? то свойствами типа.

        Свойства делятся на 2 типа:
 1. Сохраняемые
 2. Вычисляемые
 
*/

struct Observer {
    var name: String {
        willSet{
            print("New property = " + newValue)
        }
        didSet {
            print("didSet" + " = " + oldValue)
            if name != "" { name = name.capitalized }
        }
    }
}

var obs = Observer(name: "Jack")
obs.name // Get
obs.name = "iVan" // Set
print(obs.name)

struct Man{
    var firstName: String
    var lastName: String
    var fullName: String{
        get{
            return firstName + " " + lastName
        }
        set {
            //print("Set is Work" + " " + newValue)
        }
    }
}
var man_1 = Man(firstName: "Ted", lastName: "Smith")
man_1.firstName = "John"
print(man_1.fullName)
