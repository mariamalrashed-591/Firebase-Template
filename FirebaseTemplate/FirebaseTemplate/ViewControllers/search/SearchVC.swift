//
//  SearchVC.swift
//  FirebaseTemplate
//
//  Created by Mariam on 10/22/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var profile: [User] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uid = Networking.getUserId()
        Networking.getListOf(COLLECTION_NAME: "users") { (profiles: [User]) in
            self.profile = profiles
            print(dump(self.profile))
        }
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! SearchTVC
        cell.friendName.text = self.profile[indexPath.row].fullName()
        cell.friendUsername.text = self.profile[indexPath.row].username
        cell.friendImage.image = UIImage(contentsOfFile: self.profile[indexPath.row].imagePath)
        
        return cell
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
