//
//  MSMenuViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSMenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func initUI() {
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        self.menuTableView.register(UINib.init(nibName: "MSMenuTableViewCell",bundle: Bundle.main), forCellReuseIdentifier: "MSMenuTableViewCell")
    }
    
    //MARK TABLE VIEW :
    

}

extension MSMenuViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MSMenuTableViewCell", for: indexPath) as! MSMenuTableViewCell
        
        return cell
    }
    
    
}
