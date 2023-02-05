import UIKit
var str = "Index или SubScript"

/*
 class ИмяКласса {
 subscript(index: тип_индекса) -> возвращаемый тип {
 
    get { возвратить значение }
    set { задать значение по индексу }
 */
var dic = ["key":"value"]
dic["key"]

var array = ["mama", "papa"]
array[1]

struct Table {
    var multi: Int
    subscript(index: Int) -> Int {
        get{ return multi * index }
        
    }
}

var tableResult = Table(multi:10)
tableResult[3]

struct Man{
    var man1 = "man1: Hello"
    var man2 = "man2: Im good"
    var man3 = "man3: Hi"
    
    subscript(index: Int) -> String? {
        get {
            
            switch index {
            case 0: return man1
            case 1: return man2
            case 2: return man3
                
            default: return ""
            }
        }
        set {
            let value = newValue ?? ""
            switch index {
            case 0: return man1 = value
            case 1: return man2 = value
            case 2: return man3 = value
                    
            default: break
            }
        }
    }
}

var say = Man()
say[0] = "Hi Bob"
say[0]

