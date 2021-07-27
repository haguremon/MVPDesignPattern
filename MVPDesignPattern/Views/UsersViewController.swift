//
//  ViewController.swift
//  MVPDesignPattern
//
//  Created by IwasakIYuta on 2021/07/23.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let identifier = "cell"

    
    var users = [User]()
    let userPresenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        userPresenter.setViewDelegate(delegate: self)
        userPresenter.getUsers()//presentUsersの関数を作ることでusersの中に入れることができる
    }
    
    
}
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
extension UsersViewController: UserPresenterDelegate {
    //UserPresenterクラスのgetUsersメソッドの中で使われる
    func presentUsers(user: [User]) {
        self.users = user
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        
    }
    
    
}
