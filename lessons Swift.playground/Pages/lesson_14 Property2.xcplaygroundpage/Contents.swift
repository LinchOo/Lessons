import UIKit
var str = "Cвойства Типа"
let MaxLenght = 15

struct MyStruct{
    static var count = 0
    var name = String(){
        didSet {
            if name.count > MaxLenght {
                name = oldValue
            }
        }
    }
    init(name: String){
        self.name = name
        MyStruct.count += 1
    }
}

var struct1 = MyStruct(name: "Ivan")
var struct2 = MyStruct(name: "Max")
var struct3 = MyStruct(name: "Nik")
var struct4 = MyStruct(name: "John")

class AgeBoy{
    static var maxAge = 0
    var name = String() {
        didSet{
            if name.count > MaxLenght {
                name = oldValue
            }
        }
    }
    var age = 8 {
        didSet{
            if age > AgeBoy.maxAge{
                age = oldValue
                print("to old")
            }else {print("to young")}
        }
    }
}

var ageClass = AgeBoy()
ageClass.name = "Vova"
ageClass.age = 8
