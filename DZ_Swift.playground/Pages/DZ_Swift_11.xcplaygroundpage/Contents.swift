import UIKit
//-------------/DZ_11/-------------//
/* Cтворити 1 - 2 enum різних типів */

enum Cars {
    enum Audi {
        case A6
        case A8
        case S8
        case Q7
    }
    enum Mercedes {
        case S500
        case S600
        case GL500
    }
    enum BMW {
        case X5
        case X6
    }
    case Porsche
    case Lambargini
}
enum Fuel {
    case a92
    case a95
    case a98
}
var myCar = Cars.Audi.Q7
var myFuel = Fuel.a95
var scoreTable = [Any]()

func cheker(c:Any,f:Fuel) {
    switch f{
    case .a92:
        scoreTable.append(Cars.Audi.A6)
        print("Only A6 might work with it")
    case .a95:
        print("Only A8 might work with it")
        scoreTable.append("a95 \(Cars.Audi.S8)")
        scoreTable.append("a95 \(Cars.Audi.A8)")
        scoreTable.append("a95 \(Cars.Audi.Q7)")
    case .a98:
        print("Only A8,S8,Q7 might work with it")
        scoreTable.append("")
    default:
        break
    }
}
cheker(c: myCar, f: myFuel)
print(scoreTable)
