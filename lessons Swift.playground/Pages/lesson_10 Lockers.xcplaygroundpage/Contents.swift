import UIKit
/*
 Замыкания являються анонимными функциями, которые можно передавать в качестве аргументов другим функциям
 {
    (параметры) -> возвращаемый_тип in
        операторы
 }
 */

let names = ["Максим","Сергей","Николай","Артшлём","альберт","Том"]
let s = names.sorted()
//(String, String) -> Bool
let t1 = names.sorted { (s1: String , s2: String) -> Bool in
    return s1 < s2
}
//print(t1)
let t2 = names.sorted{ (s1, s2) in return s1 < s2 }
//print(t2)
let t3 = names.sorted{ (s1, s2) in s1 < s2 }
print(t3)
let t4 = names.sorted{ (s1, s2) in s1 > s2 }
//print(t4)
let t5 = names.sorted{ (s1, s2) in s1.count < s2.count }
//print(t5)

// Автоматические именна аргументов //
let p1 = names.sorted(by:  { $0 < $1 })
print(p1)
let p2 = names.sorted(by: {$0.count < $1.count})
//print(p2)

// Захват Значений
func makeTranslator(str: String) -> (String) -> (String){ return { (name: String) -> String in return (str + " " + name) }
}
var engWel = makeTranslator(str: "Hi")
engWel("Jack")
var ruWel = makeTranslator(str: "Привет")
ruWel("Вова")
