import UIKit
//-------------/DZ_18/-------------//
/*
    Cтворити класс People, property: родичі, сусіди
    Створити 25 обжектів класу
    Порахувати скільки у людини двоюрідних братів/сестер дядьків, тіток i так далі
    Створити клас тварини, property: корова, коза, собака, кішка
    Створити клас рослини, property: трава, кущі, квіти
 
    Об'єднати всіх в один масив, відсортувати за алфавітом і по классу Люді -> Тварини -> Рослини
 */

class People {
    var family: [Array<String>] {
        var fam:[Array<String>] = []
        fam.append(brothers)
        fam.append(sisters)
        fam.append(uncles)
        fam.append(aunts)
        return fam
    }
    var brothers:[String]
    var sisters:[String]
    var uncles:[String]
    var aunts:[String]
    init( brothers: [String],sisters: [String],uncles: [String],aunts: [String]) {
        self.brothers = brothers
        self.sisters = sisters
        self.uncles = uncles
        self.aunts = aunts
    }
    
}

var Man1 = People(brothers: ["Kolya","Nikita","Alexey"], sisters: ["Vika","Alexandra"], uncles: ["Sergey","Valera"], aunts: ["Tanya","Vika","Anya"])
print(Man1.family)
var contauntant = Man1.family.count - 1
for i in 0...contauntant {
    switch i {
    case 0:
        print("Brothers are: \(Man1.family[i].count)")
    case 1:
        print("Sisters are: \(Man1.family[i].count)")
    case 2:
        print("Uncles are: \(Man1.family[i].count)")
    case 3:
        print("Aunts are: \(Man1.family[i].count)")
    default : break
    }
}

class Animals {
    var name: String
    var type: String
    var age: String
    init(name: String, type: String, age: String) {
        self.name = name
        self.type = type
        self.age = age
    }
}
class Plants {
    var name: String
    var type: String
    var age: String
    init( name: String, type: String, age: String) {
        self.name = name
        self.type = type
        self.age = age
    }
}
var an1 = Animals(name: "Lulu", type: "Cat", age: "1")
var an2 = Animals(name: "Tima", type: "Cat", age: "5")
var an3 = Animals(name: "Chika", type: "Dog", age: "9")
var AnimAll = [an1,an2,an3]
print(AnimAll)
AnimAll.sorted{s1,s2 in s1.name < s2.name }
print(AnimAll)


var pl1 = Plants(name: "Rose", type: "Flower", age: "1")
var pl2 = Plants(name: "Apple Tree", type: "Tree", age: "12")
var pl3 = Plants(name: "Rose", type: "Kust", age: "3")
var pl4 = Plants(name: "Mint", type: "Grass", age: "0.3")
var PlanAll = [pl1,pl2,pl3,pl4]

//var ArrayAll:[Any] = [Man1.brothers,Man1.sisters,Man1.uncles,Man1.aunts,an1,an2,an3,pl1,pl2,pl3,pl4]
//print(ArrayAll.count)
//ArrayAll.sorted {s1,s2,s3 in s1 as? People < s2 as? Animals < s3 as? Plants }
//var friend = arary.sorted { s1, s2 in s1.count < s2.count }
//Об'єднати всіх в один масив, відсортувати за алфавітом і по классу Люді -> Тварини -> Рослини

var countant2: Int {
    var con1: Int {
        if(Man1.brothers.count < Man1.sisters.count)
        {
            return Man1.sisters.count
        } else {
            return Man1.brothers.count
        }
    }
    var con2: Int {
        if(Man1.uncles.count < Man1.aunts.count)
        {
            return Man1.aunts.count
        } else {
            return Man1.uncles.count
        }
    }
    if(con1 < con2)
    {
        return con2
    } else {
        return con1
    }

}
var ArrayAll = [Any]()
for el in 0...countant2 {
    if(el <= Man1.brothers.count - 1 )
    {
        ArrayAll.append(Man1.brothers[el])
    }
    if(el <= Man1.sisters.count - 1 )
    {
        ArrayAll.append(Man1.sisters[el])
    }
    if(el <= Man1.uncles.count - 1 )
    {
        ArrayAll.append(Man1.uncles[el])
    }
    if(el <= Man1.aunts.count - 1)
    {
        ArrayAll.append(Man1.aunts[el])
    }
}
print(ArrayAll)
