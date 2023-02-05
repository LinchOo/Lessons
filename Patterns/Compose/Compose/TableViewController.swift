//
//  ViewController.swift
//  Compose
//
//  Created by Олег Коваленко on 20.01.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    //MARK: LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Variables
    private var currentFolder: Compose = Folder(name: "Main")
    private var tableViewController: TableViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        return vc!
    }
    
    //MARK: Actions
    @IBAction func addFileBarButton(_ sender: Any) {
        currentFolder.addComponent(c: File(name: "NewFile"))
        tableView.reloadData()
        
    }
    
    @IBAction func addFolderBarButton(_ sender: Any) {
        currentFolder.addComponent(c: Folder(name: "NewFolder"))
        tableView.reloadData()
    }
    
    //MARK: Table Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFolder.contentCount()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        
        guard let contents = currentFolder.showContent() as? [Compose] else {fatalError("Error")}
        
        let item = contents[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item is Folder ? "Folder" : "File"
        cell.imageView?.image = item is Folder ? UIImage(named: "folder") : UIImage(named: "text.viewfinder")
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contents = currentFolder.showContent() as? [Compose] else {fatalError("Error")}
        
        let item = contents[indexPath.row]
        
        tableViewController.currentFolder = item
        item is Folder ? showFolder() : print(item.showContent())
        
    }
    func showFolder() {
        navigationController?.pushViewController(tableViewController, animated: true)
    }
    
}
