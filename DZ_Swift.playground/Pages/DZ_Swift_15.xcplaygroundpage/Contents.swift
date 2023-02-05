import UIKit
//-------------/DZ_15/-------------//
/*
    Cтворити класс в котрому буде 3 property мати, батько, діти
    Створити sabscript який впорядкує їх по індексу
 */
class Family {
    var mother: String
    var father: String
    var children: String
    init(mother: String, father: String, children: String) {
        self.mother = mother
        self.father = father
        self.children = children
    }
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0: return mother
            case 1: return father
            case 2: return children
                
            default: return ""
            }
        }
        set {
            var value = newValue ?? ""
            switch index {
            case 0: return mother = value
            case 1: return father = value
            case 2: return children = value
            default: break
            }
        }
    }
}
var manOne = Family(mother: "Svetlana", father: "Alexandr", children: "Oleg")
print("Mother name: \(manOne[0]!)")
print("Father name: \(manOne[1]!)")
print("Children name: \(manOne[2]!)")


/* Створити Індекс котрий буде отримувати число, помножувати його на 100 і ділити на 2 */
struct Number {
    subscript(num: Int) -> Int {
        get {
            if(num > 5) {
                return 0
                
            } else {
                return num * 100 / 2
                
            }
        }
    }
}
var numb = Number()
print(numb[5])

/*
    Cтворити класс людина з 3-ма property: ім'я, вік, пол.
    Створити ще 2 класи що спадковуються від класу людина і перевизначає методи і властивості.
 */

class Man {
    var Name: String
    var Age: Int
    var City:String{ return "Kiev" }
    var Sex: Bool
    init(Name: String, Age: Int, Sex: Bool)
    {
        self.Name = Name
        self.Age = Age
        self.Sex = Sex
        
    }
    func printer() {
        print("\(Name) are \(Age) old")
    }
}
class CityzenOne: Man {
    override func printer() {
        if self.Sex == true {
            print("\(Name) are \(Age) old & are Man")
        } else {
            print("\(Name) are \(Age) old & are Woman")
        }
    }
}
class CityzenTwo: Man {
//    override var description: String {
//            return super.description + " in gear \(gear)"
//    }
    override var City: String{
        return "Lviv"
    }
}
var PeopleOne = CityzenOne(Name: "Oleg", Age: 32, Sex: true)
var PeopleTwo = CityzenTwo(Name: "Ira", Age: 28, Sex: false)
PeopleOne.City
PeopleTwo.City
