//
//  UserViewModel.swift
//  JsonDataExample
//
//  Created by Atul Bhaisare on 2/9/23.
//

import Foundation

class UserViewModel {
    var usersArray: [UserModel] = []
    
    func fetchUsersData(completion :@escaping () -> Void) {
        
        NetworkManager.sharedInstance.fetchData(urlString: Constants.urls.users.rawValue) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.usersArray = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
