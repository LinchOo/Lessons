import UIKit
let constArray = ["a", "b", "c","d"]
constArray.count

var array = [String]()

//if array.count == 0{print("is empty")}
if array.isEmpty
{
    print ("array is empty")
}

array += constArray
array += ["w"]
array.append("name")
print(array)
array[1]
array[1...4]
array[1..<4]

//array.insert("-",ar: 3)

array.remove(at: 3)
array.removeLast()
array.removeFirst()
array.removeAll()
