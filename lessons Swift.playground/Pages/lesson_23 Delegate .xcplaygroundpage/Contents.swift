import UIKit
var str = "Делегирование"

//----------------/Delegate/----------------//
//MARK: - Protocol
protocol RouterDelegate {
    var nameID: [String] {get set}
    func saveName(name: String, text: String)
}

protocol UsersProtocol {
    var name: String {get set}
    var age: Int {get set}
    var delegate: RouterDelegate? {get set}
    init(name: String, age: Int, delegate: RouterDelegate?)
}
//MARK: - Class
class Router: RouterDelegate {
    var nameID: [String] = []
    func saveName(name: String, text: String) {
        nameID.append(name)
        nameID.append(text)
    }
}
class User: UsersProtocol {
    var name: String
    var age: Int
    var delegate: RouterDelegate?
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

let routerDelegate = Router()
let user = User(name: "Oleg", age: 32, delegate: routerDelegate)

user.sendMail(name: "Bogdan", text: "Hi, go katku")
user.sendMail(name: "Sherbak", text: "Zdarova, pognali")
routerDelegate.nameID
