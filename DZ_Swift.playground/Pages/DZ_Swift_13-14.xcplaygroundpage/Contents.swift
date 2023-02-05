import UIKit
//-------------/DZ_13-14/-------------//
/* Cтворити класс IOSStudents додати property: dateOfBirth, skills */
/* Cтворити свої структури з різними типами властивостей: зберігаємі/не зберігаємі, обчислювальні і так далі */
struct One {
        var one = Int()
        let two = Int()
        var obs: String {
            willSet {
                print("obs will bee set soon")
            }
            didSet {
                print("obs set")
            }
        }
        var firstName = "Oleg"
        var lastName = "Kolalenko"
        var fullName: String {
            get {
                return firstName + " " + lastName
            }
        }
}

/* Надрукувати структуру CreateTriangle з двома властивостями, вугол А та вугол Б.
 Створити 2 обислювальні властивості тіж А і Б
 Якщо ми записуємо значення в ці вугли - результатом повинно бути значення 3-го вугла
 за приклад взяти прямокутний трикутник */
struct CreateTriangle {
    var cornerA: Double {
        didSet {
            cornerA = cornerA + cornerB - 180
        }
    }
    var cornerB: Double {
        didSet {
            cornerB = cornerB + cornerA - 180
        }
    }
}
/* Cтворити структуру СV , в котрій будуть такі властивості:
 Фамілія / Ім'я / Посада / Досвід / Контакти (Телефон,@мейл) / Про себе
*/

struct Cv {
    var LastName:String
    var FirstName:String
    var Position:String?
    var Experience:String?
    var PhoneNumber:String?
    var MailAdress:String?
    var About:String = ""
    func Show(){
        print("Last name: \(LastName) \n FirstName: \(FirstName) \n Work Potition: \(Position ?? "") \n Work Experience: \(Experience ?? "") \n More info: \(About) \n Contact Phone: \(PhoneNumber ?? "") \n Contact @mail: \(MailAdress ?? "")")
    }
}

var firstMan = Cv(LastName: "Vova", FirstName: "Smit")
firstMan.Show()
var secontMan = Cv(LastName: "Oleg", FirstName: "Kovalenko", Position: "Developer", Experience: "1 year", PhoneNumber: "+380935795511", MailAdress: "1faramir1@gmail.com", About: "Self Motivated")
secontMan.Show()

/* Створити журнал який отримує ім'я, фамілію та оцінку.
 Задати ліміт символів для перших двух по 15 символів, для оцінкі до 5 включно
 При виході за ліміти видати сповіщення */

struct Jornal {
    var firstName = String(){
        didSet {
            if firstName.count >= 15 {
                print("Your Name are to long, max character limit are 15 symbols")
                firstName = ""
            }
        }
    }
    var lastName = String(){
        didSet {
            if lastName.count >= 15 {
                print("Your Last Name are to long, max character limit are 15 symbols")
                lastName = ""
            }
        }
    }
    var score = Int(){
        didSet {
            if score > 5 {
                print("Your score above limits please set score from 0 - 5")
                self.score = 0
            }else if score < 0 {
                print("Set score properly please set score from 0 - 5")
                score = 0
            }
        }
    }
    func show() {
        print("Student firstName: \(firstName) \n Student lastName: \(lastName) \n Student Score: \(score)")
    }
}
var studentOne = Jornal(firstName: "Oleg", lastName: "Kovalenko", score: 5)
studentOne.show()

var studentTwo = Jornal(firstName: "Vova", lastName: "KovalenkoKovalenkoKovalenkoKovalenko", score: 6)
studentTwo.show()

/* Cтворити клас в котрому будуть 4 функціі:
 1. Порожня з виводом print
 2. Приймає параметри та виводіть іх в консоль
 3. Приймає і повертає параметри
 4. Приймає локер і друкує результат в консоль
 */
class Printer{
    var firstName = "John"
    var lastName = "Smith"
    let fullName: (String, String) -> String = { (firstName: String, lastName: String) -> String in
        return firstName+" "+lastName
    }
    
    /*let greeting: (String, String) -> String = { (time: String, name: String) -> String in
        return "Отличное \(time), \(name)!"
    }*/
    
    
    func fax(){
        print("Printer works")
    }
    func printer(str1: String, score: Int){
        print("\(str1) your score  \(score)")
    }
    func scaner(str1: String, str2: String) -> String {
        var scan = str2+" "+str1
        return scan
    }
    //let printloker(str1: String, str2: String,{(str1: String,str2: String) -> String in return str1 + str2 })
    //func printloker(str1: String, str2: String)
}
    var pri = Printer()
    //-1-//
    pri.fax()
    //-2-//
    pri.printer(str1: "Oleg", score: 55)
    //-3-//
    print(pri.scaner(str1: "Oleg", str2: "Kovalenko" ))
    //-4-//
    var PrinterOne = pri.fullName("Oleg","Kovalenko")
    print(PrinterOne)
