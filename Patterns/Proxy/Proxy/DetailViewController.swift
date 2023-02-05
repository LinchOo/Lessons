//
//  DetailViewController.swift
//  Proxy
//
//  Created by Олег Коваленко on 19.01.2023.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: OUTLETS

    @IBOutlet weak var imageView: UIImageView!
    //MARK: VARIABLES
    let url = URL(string: "https://e7.pngegg.com/pngimages/150/707/png-clipart-2010-bmw-x6-m-car-sport-utility-vehicle-bmw-3-series-bmw-compact-car-car.png")!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        // Do any additional setup after loading the view.
    }
    
    //MARK: FUNCTIONS
    func loadImage() {
        let imageLoader = ImageLoader()
        let proxy = Proxy(service: imageLoader)
        proxy.loadImage(url: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        
    }
    //MARK: Actions
    @IBAction func resetButton(_ sender: UIButton) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
