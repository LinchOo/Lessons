//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

protocol BirdProtocol {
    func sign()
    func fly()
}
class Bird: BirdProtocol {
    func sign() {
        print("tew - tew")
    }
    
    func fly() {
        print("fly")
    }
}
class Raven {
    func RavenSign() {
        print("Raven Sing")
    }
    func RavenFly() {
        print("Raven Fly")
    }
}
class RavenAdapter: BirdProtocol {
    private var raven = Raven()
    init(adaptee: Raven) {
        raven = adaptee
    }
    func sign() {
        raven.RavenSign()
    }
    
    func fly() {
        raven.RavenFly()
    }
    
    
}
func makeBird(bird: BirdProtocol) {
    bird.fly()
    bird.sign()
}
let simpleBird = Bird()
let simpleRaven = Raven()
let ravenAdapter = RavenAdapter(adaptee: simpleRaven)

makeBird(bird: simpleBird)
makeBird(bird: ravenAdapter)
