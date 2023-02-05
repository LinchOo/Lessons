import UIKit
//-------------/DZ_12/-------------//
/* Cтворити класс батьківський класс і двох насліднікив */

class Parent {
    var family = String()
    init(family: String){
        self.family = family
    }
}
class children: Parent {
    var name = String()
    var age = Int()
    var fullName:String{ return name+" "+family }
}
/* Надрукувати програму котра буде створювати клас House, в ньому декілька якостей Width & Height
та декілька методів Create(виводить множення якостей), Destroy(відібражае знищеня) */

class House{
    var width = Int()
    var height = Int()
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    func create() -> Int{
        return self.width * self.height
    }
    func destroy() {
        self.width = 0
        self.height = 0
        print("Data Destroed")
    }
}

var bud = House(width: 15, height: 22)
print(bud.create())
bud.destroy()
print(bud.height)

/* Cтворити класс з методами сортування массиву студентів */
class Sort {
    var students = [String]()
    init(students:[String]) {
        self.students = students
    }
    func sortStringOne() {
        self.students = students.sorted { s1, s2 in s1.count < s2.count }
    }
    func sortStringTwo(groupTwo:[String]) -> [String] {
        return groupTwo.sorted { s1, s2 in s1.count > s2.count }
    }
}
var groupOne = Sort(students: ["Oleg","Ira","Nikolay","Yura","Bogdan"])
var groupTwo = ["Jora","Viktor","Max","Alexandr"]

print(groupOne.students)
groupOne.sortStringOne()
print(groupOne.students)

print(groupTwo)
groupTwo = groupOne.sortStringTwo(groupTwo: groupTwo)
print(groupTwo)

/* Створити структуру і пояснити в коментарях чим відрізняються */
/*
 Используйте структуры для простых типов данных. Воспринимайте их как простые базы данных, которые вы можете использовать в своем коде, например NewsItem, Task или User. Поскольку они четко определены и часто не нуждаются в сложных отношениях между объектами.
 В многопоточной среде, например, с подключением к базе данных в другом потоке, структуры более безопасны. и могут быть безопасно скопированы из одного потока в другой. Классы не имеют присущей им безопасности, если только они не намеренно сделаны поточно-ориентированными.
 Когда свойства структуры в основном являются значимыми типами, например String, имеет смысл обернуть их в структуру вместо класса.
 
 Когда копирование экземпляров не имеет смысла, например, Window или UIViewController. Копировать окно приложения не имеет смысла, поскольку одновременно активно только один окно, и зачастую не имеет смысла также копировать View Controller — вы просто создаете новый.
 Когда время жизни экземпляра связано с внешними эффектами, например, для DatabaseConnection или TemporaryFile. Не имеет смысла создавать две копии ссылки на файл, если они оба ссылаются на одни и те же данные.
 Когда экземпляры просто являются проводниками для нешних состояний, например, CGContext. Иногда вам нужен вспомогательный класс или класс-оболочка, чтобы добиться цели. В этих случаях класс является всего лишь каналом, который передает информацию, и не имеет смысла создавать его копию.

*/
struct ManStruct{
    var name: String
    var age: Int
}

