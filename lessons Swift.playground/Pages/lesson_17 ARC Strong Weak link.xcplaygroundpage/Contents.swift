import UIKit

// automatic reference counting (автоматический подсчет ссылок) = ARC

class Person{
    var name = String()
    init(name:String){
        self.name = name
        //print("\(name) инициализирован и создан в памяти")
    }
    deinit {
        //print("\(name) Удалён из памяти")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Jack")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

//----------------------/Цыкл сильных ссылок или перекрёстные ссылки//----------------------//

class Hotel{
    let name: String
    init(name: String){
        self.name = name
    }
    deinit {
        print("\(name) выезжает")
    }
    var apartament: Apartament?
}
class Apartament {
    let room: String
    init(room: String){
        self.room = room
    }
    
    deinit {
        print("Апартаменты \(room) освобождены")
    }
    weak var hotel: Hotel?
    
}

var objHotel: Hotel?
var objApartament: Apartament?
objHotel = Hotel(name: "John Smith")
objApartament = Apartament(room: "220")

objHotel!.apartament = objApartament
objApartament!.hotel = objHotel
objHotel = nil
objApartament = nil

//----------------------/безхозная ссылка/----------------------//
class Country{
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String){
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City{
    let name: String
    unowned let country: Country
    init(name:String, country: Country){
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Украина", capitalName: "Киев")
print("Столица страны \(country.name) является \(country.capitalCity.name)")
