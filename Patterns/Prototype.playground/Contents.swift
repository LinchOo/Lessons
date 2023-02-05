import UIKit

//    print(person1 === person2 )  сравнение ссылок


//------------/Example 1/------------//
/*
class Person {
    var name = ""
    func copy() -> Person {
        let person = Person()
        person.name = name
        return person
    }
}
var person1 = Person()
person1.name = "Jim"
var person2 = person1.copy()
person2.name = "Ronald"
print(person1.name,person2.name)
*/
//------------/Example 2/------------//
/*
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    func copy() -> Person {
        return Person(name: self.name)
    }
}
var person1 = Person(name: "Jim")
var person2 = person1.copy()
person2.name = "Ronald"
print(person1.name,person2.name)
*/
//------------/Example 3/------------//
public protocol Copying {
    init(_ prototype: Self)
}
extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}
class Person: Copying {
    var name: String
    init(name: String) {
        self.name = name
    }
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name)
    }
}
var person1 = Person(name: "Jim")
var person2 = person1.copy()
person2.name = "Ronald"
print(person1.name,person2.name)
