//
//  Presenter.swift
//  MVPDesignPattern
//
//  Created by IwasakIYuta on 2021/07/23.
////ここでAPIのリクエストなどをしてVIewの表示などをアップデートしたりする
//https://jsonplaceholder.typicode.com/users フリーAPI
import Foundation
import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(user: [User])
    func presentAlert(title: String, message: String)
}
typealias PresenterDelegate = UserPresenterDelegate & UIViewController
class UserPresenter {
    //これらでPresenterとUIViewControllerを相互作用することができる
    weak var delegate: PresenterDelegate?
    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users ") else { return }
        let task =  URLSession.shared.dataTask(with: url) { [ weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.delegate?.presentUsers(user: users)//これでユーザーを取得することが成功
            } catch {
                print(error)
            }
        }
        task.resume()
    }
   
    
    func setViewDelegate(delegate: PresenterDelegate){
        self.delegate = delegate
    }
    
}

