import UIKit
import Foundation

/* func имяФункции(принемаемые параметры) -≥ Возвращаемые параметры{
    ...Тело Функции...
    print("hi")
 }
 */
//77777777777|Example_1|777777777777//
/*
 var arrayjournal = [String]()
 func addStudent(name: String, proffesion: String){
    arrayJournal.append(name)
    arrayJournal.append(proffesion)
    print(arrayJournal)
 }
 addStudent(name: "Jack", profession: "ios dev")
 addStudent(name: "Jack", profession: "android dev")
 addStudent(name: "Jack", profession: "admin")
 */
//77777777777|Example_2|777777777777//
/*
 func calculate(number1: Int, number2: Int) -> Unt{
    return number1 + number2
 }
 calculate(number1: 22,number2: 312)
 calculate(number1: 22,number2: 312)
 calculate(number1: 22122,number2: 312)
 calculate(number1: 222,number2: 31562)
 calculate(number1: 22,number2: 312312)
 let sum = calculate(number1: 22,number2: 312)
 print(sum)
 */
//77777777777|Example_3|777777777777//
/*
var money = [1,1,5512,123,312,31,12]
var money2 = [12,1233,1,13,231,5,1]
func calculateMoney(inArray: [Int]) -> Int{
    var sum = 0
    for i in inArray{
        sum += i
    }
    return sum
}
print(calculateMoney(inArray: money))
*/
//77777777777|Example_4|777777777777//

func generalFunc(answer: Bool) -> () -> String{
    func sayYes() -> String { return "Yes" }
    func sayNo() -> String { return "No" }
    return answer ? sayYes : sayNo
}
print(generalFunc(answer: true)())
