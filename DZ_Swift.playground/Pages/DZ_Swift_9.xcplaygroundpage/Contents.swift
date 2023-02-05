import UIKit

//-------------/DZ_09/-------------//
/* Створіть 3 функціі, 1 нічого не отрімує і нічого не повертає
 2 отримує але не повертає
 3 отримує і повертає */

func one() {
    print("Func One")
}
func two(i:Int) {
    print("Func two")
}
func thri(i:Int) -> Int {
    print("Func thri")
    return i
}
one()
two(i: 25)
//var g = thri(i: 33)
print(thri(i: 33))

/* Створіть журнал для вчителя котрий буде отримувати ім'я студента, професію та оцінку,
 буде записувати ці данні в массив. Додайте 10 студентів і роздрукуйте через цикл for */
func Jornal(Name:String,Prof:String,Score:Int) -> String//[String]
{
    //var array = [Name+" "+Prof+" your score "+String(Score)]
    var str = "\(Name) \(Prof) take score \(Score)"
    return str
}
var jor = [Int:String]()
jor[1] = Jornal(Name: "Oleg", Prof: "Dev", Score: 7)
jor[2] = Jornal(Name: "Vova", Prof: "Tehnic", Score: 8)
jor[3] = Jornal(Name: "Ira", Prof: "Master", Score: 11)
jor[4] = Jornal(Name: "Kolya", Prof: "Driver", Score: 4)
jor[5] = Jornal(Name: "Dima", Prof: "Diver", Score: 2)
jor[6] = Jornal(Name: "Alexander", Prof: "Father", Score: 12)
jor[7] = Jornal(Name: "Svetlana", Prof: "Mother", Score: 12)
jor[8] = Jornal(Name: "Olya", Prof: "Dev", Score: 10)
jor[9] = Jornal(Name: "Mahsa", Prof: "Cuter", Score: 9)
jor[10] = Jornal(Name: "Yura", Prof: "Electric", Score: 11)
//jor[ = Jornal(Name: "Vova", Prof: "Dev", Score: 8)
for el in jor.keys {
    print("\(el)) \(jor[el]!)")
}
/* Cтворіть программу котра за допомогою функціі буде вираховувати площу круга */
var r:Double?
func SquareCircle(r:Double)->Double{
    let p:Double = 3.14
    var sq:Double = p*(r*r)
    return sq
}
print(SquareCircle(r: 13))


/* Створіть Dictionary з назвою students , де ключ name и score, а значення (1 tuple 5 імен) а (2 tuple 5 оцінок) */
var namesTuple = (name1:"Oleg",name2:"Ira",name3:"Bogdan",name4:"Yura",name5:"Vova")
var scoreTuple = (score1: "10",score2: "9", score3: "11", score4: "6", score5: "2")
var students = [String:Any]()
students["names"] = [namesTuple]
students["score"] = [scoreTuple]
for ele in students.values {
    print(ele)
}
//students.keys = [name,score]

