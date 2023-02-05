import UIKit
//-------------/DZ_05/-------------// Dictionary
let mounths = ["January":"Січень","February":"Лютий","Mart":"Березень","April":"Квітень",
               "May":"Травень","June":"Червень","July":"Ліпень","August":"Серпень",
               "September":"Вересень","October":"Жовтень","November":"Лістопад","December":"Грудень"]
let MountDays = ["January": 31, "Februari": 28, "Mart": 31, "April": 30,
                     "May": 31, "June": 30, "July": 31, "Aughust": 31,
                     "September": 30, "October": 31, "November": 30, "December": 31 ]
if MountDays.isEmpty {
    print(MountDays.count)
} else {print(MountDays)}
