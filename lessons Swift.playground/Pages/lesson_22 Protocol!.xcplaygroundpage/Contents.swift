import UIKit
var str = "Протоколы"
//---------------/Protocol/---------------//

protocol OneProtocol {
    var name : String { get set }
    var age : Int { get set }
    //mutating func hello(text: String)
}

struct Parents: OneProtocol {
    var name: String
    var age: Int
}
struct Kids: OneProtocol {
    var name: String
    var age: Int
}
struct Cat: OneProtocol {
    var name: String
    var age: Int
}

var parentOne = Parents(name: "Oleksandr", age: 44)
var parentTwo = Parents(name: "Svetlana", age: 44)
var kidOne = Kids(name: "Oleg", age: 22)
var kidTwo = Kids(name: "Nik", age: 8)
var cat = Cat(name: "Masha", age: 13)

var family: [OneProtocol] = [parentOne, parentTwo, kidOne, kidTwo, cat]

func printFamilyFromArray(array:[OneProtocol]) {
    for value in array {
        print("\(value.name) - age = \(value.age)")
    }
}

printFamilyFromArray(array: family)
