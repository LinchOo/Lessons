import UIKit

//-------------/DZ_10/-------------//
/* Cтворити сортировку масиву з допомогою замикання в обидва боки, вивести до консолі результат */
let names = ["Максим","Сергей","Николай","Артём","альберт","Том"]
var loker = names.sorted { s1, s2 in s1 > s2}
print(loker)
loker = names.sorted { s1, s2 in s1 < s2}
print(loker)

/* Створити метод котрий запитує ім'я друзів, закинути їх в массив, отсортувати по кількості літер */
var arary = [String]()
func FriendsBook(name:String)
{
    arary.append(name)
}
FriendsBook(name: "Oleg")
FriendsBook(name: "Bogdan")
FriendsBook(name: "Ira")
FriendsBook(name: "Yura")
FriendsBook(name: "Sergey")
var friend = arary.sorted { s1, s2 in s1.count < s2.count }
print(friend)

/* Надрукувати функцію котра буде отпримувати ключі, виводить ключ і значення словаря (Dictionary) */
var Dict = [Int:Any]()

Dict[1]=["22","23","24"]
Dict[2]=[1,2,3]

func keyFunc(key:Int) {
    print( Dict[key]!)
}
keyFunc(key: 1)

/* Надрукувати функцію, котра отримує порожні масиви(один строковий, другий - числовий) і перевіряє їх,
 якщо порожній - то добавляє значення і виводить його в консоль */
var arr = [Int]()
var arr2 = [String]()


func emptyArray( arg: [Int], arg2: [String] ) {
    if arg.isEmpty && arg2.isEmpty {
        arr.append(404)
        arr2.append("Empty")
        print(arr)
        print(arr2)
    }
}
emptyArray(arg:arr,arg2:arr2)


