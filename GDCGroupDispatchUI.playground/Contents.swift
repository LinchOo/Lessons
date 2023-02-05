
import UIKit
import PlaygroundSupport


class MyViewController: UIViewController {
    var button = UIButton()
    let disp = DispatchQueue(label: "MyQueue")
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
        
        let vc = MyViewController2()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.ini()
        vc.asyncGroup()
        vc.asyncUrlSession()
    }
    func initButton(){
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height:50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
    }
    
    
}


let imagesDB = ["https://images.fragstore.com/images/detailed/219/15494725_zdzv-to.jpg","https://images.fragstore.com/images/detailed/219/15494735_jit0-te.jpg","https://images.fragstore.com/images/detailed/219/15494747_55hq-8t.jpg","https://images.fragstore.com/images/detailed/219/15494774_4r7a-16.jpg"]
var images = [UIImage]()


class MyViewController2: UIViewController {
    public var ivs = [UIImageView]()
    func ini(){
        self.view.backgroundColor = UIColor.red
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
        
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 400, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 400, width: 100, height: 100)))
        for i in 0...7 {
            ivs[i].contentMode = .scaleAspectFit
            self.view.addSubview(ivs[i])
            
        }
    }
    func asyncLoadImage(imageURL: URL, runQueue: DispatchQueue, completionQueue: DispatchQueue, complition: @escaping(UIImage?,Error?)->()) {
        runQueue.asyncAfter(deadline: .now() + 1){
            do{
                let data = try Data(contentsOf: imageURL)
                completionQueue.async { complition( UIImage(data: data),nil) }
            } catch let error {
                completionQueue.async { complition(nil, error) }
            }
        }
    }
    func asyncGroup() {
        let aGroup = DispatchGroup()
        for i in 0...3 {
            aGroup.enter()
            asyncLoadImage(imageURL: URL(string: imagesDB[i])!, runQueue: .global(), completionQueue: .main) { result, error in
                guard let image1 = result else { return }
                images.append(image1)
                aGroup.leave()
            }
        }
        aGroup.notify(queue: .main) {
            for i in 0...3 {
                self.ivs[i].image = images[i]
            }
            sleep(1)
        }
    }
    func asyncUrlSession() {
        for i in 4...7 {
            let url = URL(string: imagesDB[ i - 4 ])
            let reguest = URLRequest(url: url!)
            let task = URLSession.shared.dataTask(with: reguest){(data,response,error) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    self.ivs[i].image = UIImage(data: data!)
                }
            }
            
            task.resume()
        }
        
    }

    
}



//-------------////-------------////-------------//
let vc = MyViewController()
//vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
let navbar = UINavigationController(rootViewController: vc)
navbar.view.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
PlaygroundPage.current.liveView = navbar






