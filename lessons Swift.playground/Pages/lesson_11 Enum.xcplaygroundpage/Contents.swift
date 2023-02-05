import UIKit
/*
enum TravelClass{
    case First, Bussines, Econom
}
let travel = TravelClass.First
print(travel)
 */
//-------------Example_2-------------//
/*
enum Medal {
    case gold
    case silver
    case bronze
}

let medal = Medal.gold
switch medal{
case .gold:
    print("u medal are gold")
case .silver:
    print("u medal are silver")
case .bronze:
    print("u medal are bronze")
}
*/
//-------------Example_3-------------//
/*
enum DayWeek{
    case monday
    case tuesday
    case wednesday
    case thursday
    enum friday{
        case day
        case night
    }
    case saturday
    case sunday
}
var freeday = DayWeek.friday.day
print(freeday)
*/
//-------------Example_4-------------//
enum Operation {
    case double(Double)
    case integer(Int)
    case float(Float)
    case string(String)
}
var dictionary: Dictionary<String, Operation> = [
    "Double": Operation.double(22.4),
    "Integer": Operation.integer(10),
    "Float": Operation.float(44.232),
    "String": Operation.string("Строка")
]
let pr = dictionary["String"]
print(pr!)
