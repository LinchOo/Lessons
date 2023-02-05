import UIKit
var str = "Расширения"
//--------------//extensions_String//--------------//
extension String {
    func sayHallo() {
        print("Hello")
    }
}

var hello = "Hi"
hello.sayHallo()

var a = String()
a.sayHallo()

"Hi".sayHallo()

//--------------//extensions_Int//--------------//
extension Int {
    var squared: Int {
        return (self * self)
    }
}
var newInt = 30
newInt.squared

extension Int {
    func funcSquared() -> Int {
        return (self * self)
    }
}
 var sqrInt = 3
sqrInt.funcSquared()

140.squared
140.funcSquared()

//--------------//extensions_Classes//--------------//
class Man {
    var info = (name: "Oleg",age: 24)
}
let cityzen = Man()
cityzen.info

extension Man {
    func allInfo() -> String {
        return "My name is \(info.name) and i am \(info.age) old"
    }
}
print (cityzen.allInfo())
