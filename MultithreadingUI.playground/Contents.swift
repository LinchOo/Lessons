import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "VC 1"
        
        self.view.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }
    @objc func pressAction(){
        let vc  = MyViewController2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func initButton(){
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height:50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
    }
    
    
}

class MyViewController2: UIViewController {
    var myImage = UIImageView()
    let imageUrl: URL = URL(string: "https://stylus.ua/thumbs/378x378/c3/0e/2389411.jpeg")!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "VC 2"
        self.view.backgroundColor = UIColor.white
        //loadImage()
        loadImageUrlSession()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initImage()
    }
    func initImage() {
        myImage.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        myImage.center = view.center
        view.addSubview(myImage)
    }
    func loadImage() {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: self.imageUrl) {
                DispatchQueue.main.async {
                    self.myImage.image = UIImage(data: data)
                }
            }
        }
    }
    func loadImageUrlSession(){
        let imageLoader = URLSession.shared.dataTask(with: self.imageUrl) { (data,response,error) in
            print(Thread.current)
            if let imageData = data {
                DispatchQueue.main.async {
                    print(Thread.current)
                    self.myImage.image = UIImage(data: imageData)
                }
            }
        }
        imageLoader.resume()
    }
    func loadImageWorkItem(){
        var data: Data?
        var queue = DispatchQueue.global(qos: .utility)
        var workItem = DispatchWorkItem(qos: .userInteractive) {
            data = try? Data(contentsOf: self.imageUrl)
            print(Thread.current)
        }
        queue.async(execute: workItem)
        
        workItem.notify(queue: DispatchQueue.main){
            if let imageData = data {
                self.myImage.image = UIImage(data: imageData)
            }
        }
    }
}
let vc = MyViewController()
//vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
let navbar = UINavigationController(rootViewController: vc)
navbar.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
PlaygroundPage.current.liveView = navbar






