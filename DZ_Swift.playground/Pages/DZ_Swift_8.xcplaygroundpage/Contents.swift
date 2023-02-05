import UIKit

//-------------/DZ_08/-------------//
/* Створіть цикл в цікли, в першому інтервал 200 разів в другому 15,коли в другому буде 15 вийдіть з обох циклів*/

for i in 1...200 {
    for y in 1...15 {
        if y > 15 {
            break
        }
        print(y)
    }
    print(i)
    break
}

/* Cтворити if і окремо switch программу котра буде дивитись на вік людини і казати куди йому ідти в школу, садок, універ чи на роботу або всеж таки на пенсію */

let nameWork = "Swift dev"
let age = 5
let gender = "m"
if age > 0 {
    switch(age) {
    case (1...3):
        print("To young")
    case (3...6):
        print("Go to kindergarden")
    case (6...18) :
        print("Go to school")
    case (18...60) :
        print("Congratulation! You might go to University ore start working")
    default:
        print("Lets go to pensilvaniya")
    }
}
if age > 0 {
    if age > 0 && age < 3 {
        print("to young")
    } else if age > 3 && age < 6 {
        print("Go to kindergarden")
    } else if age >= 6 && age < 18 {
        print("Go to school")
    } else if age > 18 && age < 60 {
        print("Congratulation! You might go to University ore start working")
    } else {
        print("Lets go to pensilvaniya")
    }
}

/* Створіть всі цикли for in котрі ви знаете */
/*
 for i in array {
    print(i)
 }
 
 for i in 0...1 {
    print(i)
 }
 
 for i in 0..<5 {
    print(i)
 }
 for i in 0..count - 1 {
    print(i)
 }
 */

/* Створіть switch case і if систему яка буде оцінюваті школярів по 12 бальній системі*/
var family = ["Svetlana","Nikita","Oleg","Ira","Tanya","Yura","Kolya","Nadya","Galya","Valya"]
family.sort()
for i in family {
        print(i)
}
