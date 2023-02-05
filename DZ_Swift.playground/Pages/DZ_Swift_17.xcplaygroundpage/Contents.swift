import UIKit
//-------------/DZ_17/-------------//
/*
    Cтворити структури - Легковий автомобіл та вантажівка
    Властивості: марка, рік випуску, об'єм багажнику, чи вімкнений двигун, чи відкриті вікна, заповненя багажнику
    Створити функціонал: двигуна(on\off), вікон(видкрити\закрити), погрузити\вигрузити багаж в
        кузов\багажник заданого об'єму
 */
struct lightCars {
    var cMark: String
    var cYear: Int
    var cGarbage: Int
    var cEngine: Bool
    var cWindows: Bool
    var emptyGarbage: Int
  
    init(cMark: String, cYear: Int, cGarbage: Int, cEngine: Bool, cWindows: Bool, emptyGarbage: Int){
        self.cMark = cMark
        self.cYear = cYear
        self.cGarbage = cGarbage
        self.cEngine = cEngine
        self.cWindows = cWindows
        if(emptyGarbage > cGarbage)
        {
            self.emptyGarbage = 100
            print("To many items for yor garbage, max size \(cGarbage)")
        }else { self.emptyGarbage = emptyGarbage }
    }
    func printer () {
        print("Mark: \(cMark) \nYear: \(cYear) \nGarbage Scale: \(cGarbage) \nEngine Status: \(cEngine) \nWindows Status: \(cWindows) \nGarbage in car: \(emptyGarbage) ")
    }
    
    mutating func Engine() {
        if( cEngine == true ) { cEngine == false }
        else { cEngine == true }
    }
    mutating func Windows() {
        if( cWindows == true ) { cWindows == false }
        else { cWindows == true }
    }
    mutating func Garbage(grab: Bool, scale: Int){
        if( grab == true) {
            if( cGarbage - emptyGarbage > scale ) {
                emptyGarbage += scale
            }else {
                print("Not enought space")
            }
        }else {
            if( cGarbage - emptyGarbage < scale ) {
                print("Not enought items to grab")
            }else {
                emptyGarbage -= scale
            }
        }
    }
    enum Model {
        case a1
        case a2
        case a3
    }
    mutating func EnumChanger (enu: Model) {
        switch enu {
        case .a1: cYear = 2005
            cGarbage = 1000
        case .a2: cYear = 2002
            cGarbage = 900
        case .a3: cYear = 2007
            cGarbage = 800
        default: break
            
        }
    }
}
struct heavyCars {
    var cMark: String
    var cYear: Int
    var cGarbage: Int
    var cEngine: Bool
    var cWindows: Bool
    var emptyGarbage: Int {
        didSet{
            if(emptyGarbage > cGarbage) {
                print("To more items, your Garbage have \(cGarbage) litrs space")
                emptyGarbage = 0
            }
        }
    }
    
    
    mutating func Engine() {
        if( cEngine == true ) { cEngine == false }
        else { cEngine == true }
    }
    mutating func Windows() {
        if( cWindows == true ) { cWindows == false }
        else { cWindows == true }
    }
    mutating func Garbage(grab: Bool, scale: Int){
        if( grab == true) {
            if( cGarbage - emptyGarbage > scale ) {
                emptyGarbage += scale
            }else {
                print("Not enought space")
            }
        }else {
            if( cGarbage - emptyGarbage < scale ) {
                print("Not enought items to grab")
            }else {
                emptyGarbage -= scale
            }
        }
    }
    enum Model {
        case a1
        case a2
        case a3
    }
    mutating func EnumChanger (enu: Model) {
        switch enu {
        case .a1: cYear = 2005
            cGarbage = 1000
        case .a2: cYear = 2002
            cGarbage = 900
        case .a3: cYear = 2007
            cGarbage = 800
        default: break
            
        }
    }
}
/*
 Додати в структуру метод з одним аргументом типу Enum, котрий буде міняти властивості структури в залежности від дій
 Ініціалізувати декілька єкземплярів структур, виконати різні маніпуляціі
 Додати об'єкти структур до словаря як ключі, а їх назви як строки var dict = [structCar: "structCar"]
 */
var lCarOne = lightCars(cMark: "Audi", cYear: 2004, cGarbage: 800, cEngine: false, cWindows: false, emptyGarbage:801)
var lCarTwo = lightCars(cMark: "Audi", cYear: 2004, cGarbage: 800, cEngine: false, cWindows: false, emptyGarbage:801)
var hCarOne = heavyCars(cMark: "Mercedes", cYear: 2010, cGarbage: 10000, cEngine: true, cWindows: true, emptyGarbage: 9000)
lCarOne.printer()
var carmod = lightCars.Model.a1
lCarOne.EnumChanger(enu: lightCars.Model.a1)
lCarOne.printer()

//var dictCars = [lCarOne: "lCarOne", lCarTwo: "lCarTwo"]

/*
 Надрукувати код з білого скріна, зрозуміти в чому трабла та пофіксити її
 В нас є класс Людина і його паспорт.
 Людина може народитися і не мати паспорту, але паспорт видається конкретній людині і не може видаватись без вказівки господаря
 Для того щоб вирішити це питаня, ссилку на паспорт у людини зробити звичайною опціональною(var?),
     а ссилку на господаря константою(let). Також додати паспорту конструктор, щоб одразу визначити його господаря.
 Таким чином людина може існувати без паспорта, зможе його змінити або викинути, але паспорт може бути створений з
     конкретним господарем і ніколи не зможе його змінити
 Повторити код на черному знімку, пофіксити баг за правилами.
 */

//class Car {
//    var driver : Man?
//    init(driver: String) {
//        print("Driver wa add")
//        self.driver = driver
//    }
//    deinit {
//        print("Car was deleted from memory")
//    }
//}
//class Man {
//    var myCar: Car?
//    deinit {
//        print("Man was deleted from memory")
//    }
//}
//
////Optional links for nil
//var car: Car? = Car()
//var man: Man? = Man()
//// link car to man
//car?.driver = man
////link man to car
//man?.myCar = car
////Set nil to all
////car = nil
////man = nil

