import UIKit
//-------------/DZ_23/-------------//
/*
    Cтворити два протоколи:
 1) "Старт написання коду" -> property: time, codeCount
 2) "End coding" - func: stopCoding()
    Створити класс з цими протоколами: developer -> property: countCoders, iosDev, AndroidDev, webDev
 print("Coding start. writing code") & print("Work end. Send to testing")
*/
protocol StarCoding {
    var time: Float { get set }
    var codeCount: Int { get set }
    func Start()
}
protocol EndCoding {
    func End()
}

class Dev: StarCoding, EndCoding {
    var time = Float()
    var codeCount = Int()
    var devCount = Int()
    var devSpec = ["ios","Android","web"]
    func Start() {
        print("Start coding")
    }
    func End() {
        print("Work End. Time spent: \(time) min \nLines write: \(codeCount) \nWork on it: \(devCount) developers")
    }
    required init(time: Float, codeCount: Int, devCount: Int) {
        self.time = time
        self.codeCount = codeCount
        self.devCount = devCount
    }
}

var dev = Dev(time: 260, codeCount: 3602, devCount: 16)
dev.Start()
dev.End()

