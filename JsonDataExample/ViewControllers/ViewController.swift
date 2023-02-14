//
//  ViewController.swift
//  JsonDataExample
//
//  Created by Atul Bhaisare on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -  Outlets
    @IBOutlet weak var userstableView: UITableView!
    var viewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = UserViewModel()
        configureTableView()
        
        viewModel?.fetchUsersData { 
            DispatchQueue.main.async {
                self.userstableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        userstableView.delegate = self
        userstableView.dataSource = self
    }
}

//MARK: -  UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.usersArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserTableViewCell else
        { return UITableViewCell() }
        let user = viewModel?.usersArray[indexPath.row]
        cell.user = user
        return cell
    }
}

//MARK: -  UserTableViewCell
class UserTableViewCell: UITableViewCell {
    
    //MARK: -  Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var user: UserModel! {
        didSet {
            updateData()
        }
    }
    
    func updateData() {
        nameLabel.text = "Name: \(user.firstName ?? "")"
        cityLabel.text = "City: \(user?.address?.userCity ?? "")"
    }
}
