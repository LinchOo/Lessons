import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }
    @objc func pressAction(){
        print("Press")
    }
    func initButton(){
        button.frame = CGRect(x: 0, y: 0, width: 200, height:50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
    }
}

let vc = MyViewController()
let navbar = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = navbar


