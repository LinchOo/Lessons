import UIKit
var strinsArray = ["Hi", "Hello", "Bye"]
var intArray = [1,2,3,4,5,6,7,8,9,0]
var doubleArray = [1.5,2.3,7.4]

//-----------------//Example_1//-----------------//
func printElementFromArray<T>(a: [T]) {
    for elements in a {
        print(elements)
    }
}
//-----------------//Example_2//-----------------//
func doNothing<T>(x: T) -> T {
    return x
}
doNothing(x: "John")
doNothing(x: 1234)
doNothing(x: false)

//-----------------//Example_3//-----------------//
var emptyArray = [String]()

struct GenericArray<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
}

var myFriendsList = ["Bogdan", "Yuri", "Evgen"]
var arrays = GenericArray(items: myFriendsList)
arrays.push(item: "Sergey")
