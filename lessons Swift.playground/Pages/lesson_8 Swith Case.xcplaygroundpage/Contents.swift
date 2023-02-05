import UIKit

/*var day = 5
switch day{
case 1...4:
    print("work day")
case 5:
    print("Its Friday!")
case 6...7:
    print("Holiday day")
default:
    break
}*/

let nameWork = "Swift dev"
let age = 0
let gender = "m"

switch(nameWork, age){
case (_, 1...17):
    print("To young")
case ("Swift dev", 18...50) where gender == "w":
    print("sorry, this work only for man")
case ("Swift dev", 18...50) where gender == "m":
    print("Congratulation! You are welcome!")
case let(name, age):
    print("\(name) in \(age) year?") // value Banding
default:
    print("Wrong info...")
}
