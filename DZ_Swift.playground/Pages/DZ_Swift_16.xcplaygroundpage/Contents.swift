import UIKit
//-------------/DZ_16/-------------//
/*
    Cтворити класс People, 4 property: ім'я, зріст, вага, пол, а також метод Say
    Створити sab class Повар, Менеджер, Розробник і перевизначити  метод Say для кожного
    Створити по одному об'єкту кожного класу і додати в масив
    За допомогою For in, пройти по всім елементам масива і вивести в консоль всі їх характеристики
        і у кожного вивести метод Say
*/
class People {
    var Name:String
    var Height:Int
    var Weight:Double
    var Sex:String
    init(Name:String,Height:Int,Weight:Double,Sex:String) {
        self.Name = Name
        self.Height = Height
        self.Weight = Weight
        self.Sex = Sex
    }
    func Say() {
        print("Hi People")
    }
}
class Kitchener: People {
    override func Say() {
        print("Hi, i'm Kitchener")
    }
}
class Manager: People {
    override func Say() {
        print("Hi, i'm Manager")
    }
}
class Developer: People {
    override func Say() {
        print("Hi, i'm Developer")
    }
}
var kitchener = Kitchener(Name: "Evgen", Height: 182, Weight: 65.7, Sex: "mele")
var manager = Manager(Name: "Ira", Height: 150, Weight: 45.2, Sex: "famele")
var developer = Developer(Name: "Oleg", Height: 172, Weight: 66.6, Sex: "mele")
var peopleArray = [kitchener,manager,developer]
//-------------------/Done/-------------------//
/* for man in peopleArray {
    print("My name is \(man.Name) i'm are \(man.Height) height and \(man.Weight) weight, my gander is \(man.Sex) ")
    man.Say()
} */
//-------------------/End of Done/-------------------//

/*
    Створити ще одного спадкоємця і додати до нього пару нових властивостей, додати і вивести в томуж циклі For in
    Метод Say реалізувати таким чином, щоб спочатку виводити метод батіківського класу а потім свого
    Вивести все це в обратному порядку
*/
class Driver: People {
    var DriveCategory:String
    var Auto:String
    init(Name: String, Height: Int, Weight: Double, Sex: String, DriveCategory: String, Auto: String) {
        self.DriveCategory = DriveCategory
        self.Auto = Auto
        super.init(Name: Name, Height: Height, Weight: Weight, Sex: Sex)
    }
    override func Say() {
        print("Hi, i'm Driver")
    }
}
var driver = Driver(Name: "Kolya", Height: 183, Weight: 70, Sex: "mele", DriveCategory: "B", Auto: "Skoda")
peopleArray.append(driver)

//-------------------/Done/-------------------//
/* for man in peopleArray {
    print("My name is \(man.Name) i'm are \(man.Height) height and \(man.Weight) weight, my gander is \(man.Sex) ")
    if let obs = man as? Driver{
        print("My driver category is \(obs.DriveCategory) and i have car \(obs.Auto)")
    }
    man.Say()
}*/
//-------------------/End of Done/-------------------//

/*
    Створити клас Marsianin з властивостями і методом say не схожими до класу People
    Створити декілька sabclass і перевизначити метод Say
    Об'єднати всіх People i Marsianin в один масив
    В циклі виводити тип об'єкту People i Marsianin перед тим як виводити його властивості і методи
*/
class Marsianin {
    var Nik: String
    var Age: Int
    var Clan: String
    var Info: Bool
    init(Nik: String, Age: Int, Clan: String, Info: Bool)
    {
        self.Nik = Nik
        self.Age = Age
        self.Clan = Clan
        self.Info = Info
    }
    func Say() {
        print("I am Marsianin")
        //print("I am Marsianin, my name \(Nik), i a'm \(Age) old. My clan are \(Clan) and its info are \(Info)")
    }
}
class Warrior: Marsianin {
    override func Say() {
        print("I Marsianin Warrior")
        //print("I Marsianin Warrior from clan \(Clan), my name \(Nik), i'm \(Age) old, scum? \(Info)")
    }
}
class Builder: Marsianin {
    override func Say() {
        print("I am Builder from Mars")
        //print("I am Builder from Mars, my clan \(Clan) work in 100 yers on it, i'm \(Age) old, my clan call my \(Nik)")
    }
}
class Teraformer: Marsianin {
    override func Say() {
        print("I am Mars Terraformer")
        //print("I am Mars Terraformer, they call my \(Nik), i'm \(Age), my clan \(Clan)")
    }
    
}
var MWarrior = Warrior(Nik: "Stork", Age: 345, Clan: "Ignit", Info: true)
var MBuilder = Builder(Nik: "Kark", Age: 253, Clan: "China", Info: false)
var MTerra = Teraformer(Nik: "OkDok", Age: 563, Clan: "Clime", Info: true)
var MarsiansArray = [MWarrior,MBuilder,MTerra]

var life: Array<Any> = peopleArray + MarsiansArray

//-------------------/Done/-------------------//
/*for el in life {
    if let obs = el as? People {
        print("People:")
        print("My name is \(obs.Name) i'm are \(obs.Height) height and \(obs.Weight) weight, my gander is \(obs.Sex) ")
        if let dopinfo = el as? Driver{
            print("My driver category is \(dopinfo.DriveCategory) and i have car \(dopinfo.Auto)")
        }
    } else if let obs = el as? Marsianin {
        print("Marsianin:")
        print("My name is \(obs.Nik) i'm are \(obs.Age) old, im from clan \(obs.Clan), this info is \(obs.Info) ")
    }
    
}*/
//-------------------/End of Done/-------------------//

/*
    Помістити всіх People в один масив і всіх Marsianin в інший (їх кількість має відрізнятись)
    В одному циклі For in виводить People а потім Marsianin, діставая дані поочередно із двох різних масивів
        коли в одному зікінчатся об'єкти продовжити іншими
*/


var countatn = MarsiansArray.count + peopleArray.count
//-------------------/Done/-------------------//

for el in 0...countatn {
    if MarsiansArray.count-1 >= el {
        print("Marsianin:")
        print("My name is \(MarsiansArray[el].Nik) i'm are \(MarsiansArray[el].Age) old, im from clan \(MarsiansArray[el].Clan), this info is \(MarsiansArray[el].Info) ")
        //print("My name is \(obs.Nik) i'm are \(obs.Age) old, im from clan \(obs.Clan), this info is \(obs.Info) ")
    }
    if peopleArray.count-1 >= el {
        print("Human:")
        print("My name is \(peopleArray[el].Name) i'm are \(peopleArray[el].Height) height and \(peopleArray[el].Weight) weight, my gander is \(peopleArray[el].Sex) ")
        if let dopinfo = peopleArray[el] as? Driver{
            print("My driver category is \(dopinfo.DriveCategory) and i have car \(dopinfo.Auto)")
        }
    }
}
//-------------------/End of Done/-------------------//

