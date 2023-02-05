import UIKit
//let dict1 : [Int:String] = [0 : "name", 1 : "papa"]
//let dict2 : Dictionary<String, Double> = ["papa" : 30.0]

let dict1 = [0: "name", 1: "papa"] // apple rec
let dict2 = ["name": "Tanya", "papa": "Sergey"]

dict2["name"]
dict1[0]
var dict = ["car": "Audi", "tel": "+38093"]
dict.count
dict.isEmpty

var namesOfIntegers = [Int:String]() //Init empty dict
namesOfIntegers.count
namesOfIntegers.isEmpty

dict["name"] = "Nina" //add new item to dict
dict.keys
dict.values

dict.updateValue("Vladimir", forKey: "papa") //add new value to key in dict
//dict["car"] = nil // set null to key in dict
//dict.removeValue(forKey: "car") // remove value by key in dict
//dict = [:] // set dict to empty

for key in dict.keys{
    print("key = \(key), value = \(dict[key]!)")
}
for (key, value) in dict{
    print("key = \(key), value = \(value)")
}

