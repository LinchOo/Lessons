import UIKit
//-------------/DZ_07/-------------// Optional
/* Створіть 5 констант СТРОКОВОГО типу які містять цифри і порахуйте їх */

let str1 = "5"
let str2 = "34"
let str3 = "75"
let str4 = "44"
let str5 = "43"
var sum = Int(str1)! + Int(str2)! + Int(str3)! + Int(str4)! + Int(str5)!
print(sum)

/* Створіть 3 константи зі значенням nil */
/* Створіть п'ять опціональних типів констант та задайте їм значення */

let con1: String?
let con2: Int?
let con3: Float?
//con1 = "String"
//con2 = 21
//con3 = 3.14

/* Роздрукуйте своє ім'я за допомогою циклу for, також створіть базу з ім'ям і віком своєї родини */
let myName = "Oleg"
let family = ["Oleg":32,"Ira":28,"Svetlana":54,"Nikita":19]

for char in myName {
    print(char)
}
for fam in family.keys {
    print("\(fam) are \(family[fam]!) old" )
}

