import UIKit
//-------------/DZ_20/-------------//
/*
    Розширити Sring, щоб отримував сабскріпт типу s[0..<3] і міг также встановлювати значення використовуючи його
    Розширити Int і додати 3 методи: возведення до квадрату, в куб і степінь
    Додати property котре повертає кількість символів в числі
    Додати метод котрий говорить що число "положительное или отрицательное"
 */

extension String {
    subscript(range: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: range.startIndex)
        if range.endIndex > self.count {
            let end = self.index(start, offsetBy: self.count)
            return String(self[start..<end])
        }else {
            let end = self.index(start, offsetBy: range.endIndex)
            return String(self[start..<end])
        }
    }
}
var newString = "Розширити Sring, щоб отримував сабскріпт"
print(newString[0..<50])

extension Int {
//    var con: String {
//        get{
//            return String(self.count)
//        }
//    }
    func chek() {
        if self < 0 {
           return print("-")
        }
        return print("+")
    }
    func sqrt( i: Int) -> Int {
        var step = self
        for _ in 1...i {
            step = step * self
            //step = step * (self * el)
        }
        return step
    }
    func quad() -> Int {
        return self*self
    }
    func cub() -> Int {
        return self*self*self
    }
    
}

var x = 2

print(x.quad())
print(x.cub())
print(x.sqrt(i: 5))
print(x.chek())
print(x.signum())
print(String(x).count)
