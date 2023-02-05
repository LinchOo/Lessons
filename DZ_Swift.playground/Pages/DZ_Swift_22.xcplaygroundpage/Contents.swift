import UIKit
//-------------/DZ_22/-------------//
/*
    Cтворити протокол Hotel з init котрий отримує roomCount, після створити class HotelAlfa, додати властивість roomCount і підписати на цей протокол
        
 6) Создать protocol GameDice у него {get} свойство numberDice далее нужно расширить
 Int так что б когда мы напишем такую конструкцию "let diceCoub = 4 \n diceCoub.numberDice" в консоле мы увидели такую строку - "Выпало 4 на кубике"
 7) Создать протокол с одним методом и 2 мя свойствами одно из них сделать явно optional, создать класс, подписать на протокол и реализовать только 1 обязательное свойство

 
 */
protocol Hotel {
    init(roomCount: Int)
}
class HotelAlfa: Hotel {
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
    var roomCount: Int
}
var newHotel = HotelAlfa(roomCount: 2)
newHotel

protocol GameDice {
    var numberDice: Int {get}
}
extension Int {
    var numberDice: Any{
        return print("На кубику випало \(self)")
    }
}

let diceCoub = 5
diceCoub.numberDice
//diceCoub.numberDice

protocol House{
    var rooms: Int{get set}
    var floors: Int?{get set}
}
class Home: House{
    var rooms: Int
    var floors: Int?
    init(rooms: Int,floors: Int?)
    {
        self.rooms = rooms
        self.floors = floors
        // Инит
    }
}
//var home = Home(rooms: 2)
struct Home2: House{
    var rooms: Int
    var floors: Int?
}
var home2 = Home2(rooms: 5,floors: 12)
var home3 = Home2(rooms: 3)
