import UIKit
var str = "Optional Links"

class Adress {
    let street = "Obolon"
    let number = 13
}

class Home {
    let adress = Adress()
    let room: Int? = 3
    var parking: Parking? = Parking()
    func printRoomas() {
        print("Number of rooms \(room)")
    }
}
x
struct Parking {
    var carPlace = 5
}

class Parents {
    var cars: [String]? = ["Audi"]
    var home: Home? = Home()
}

let parents = Parents()

//parents.cars![0]
//print(parents.home!)
//parents.home!.parking!.carPlace

parents.home?.parking?.carPlace

if(parents.home?.parking?.carPlace = 7) != nil {
    print("Property set")
} else {
    print("Property not set")
}

//parents.cars![0]
parents.cars?[0]
// parents.cars?[1] если не задано значение будет абшибка

if (parents.home?.printRoomas()) != nil {
    print("+")
} else {
    print("-")
}
