import UIKit
// Tuples
//let oneTuple (Int, String, Double, Bool) = (1, "Polina", 25.5, false)

let oneTuple = (1, "Polina", 25.5, false)
let (numberOne, name, decimaValue, boolValue) = oneTuple

numberOne
name
decimaValue
boolValue

//let (  ,  , c,  ) = oneTuple
//c

oneTuple.0
oneTuple.1
oneTuple.2

let tuple = (one:1, name:"Polina", bolValue: true)
tuple.0
tuple.1
tuple.name
tuple.bolValue

//let name1 = "Sergey"; let name2 = "Polina"; let name3 = "Jack"

//let (name1, name2, name3) = ("Sergey", "Polina", "Jakc")
let nameTuple = (name1: "Sergey", name2: "Polina", name3: "Jack")
nameTuple.name1
nameTuple.name2

print(nameTuple)

let nameNames = "Jack"
let age = 25
print("User = \(nameNames) age = \(age)")
print((nameNames,age))
