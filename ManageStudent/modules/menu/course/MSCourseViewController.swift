//
//  MSCourseViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSCourseViewController: UIViewController {
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var courseCollection: UICollectionView!
    let item = ["i13","i15","i17"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MSCourseViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as! MSCourseCollectionViewCell
        if indexPath.row == 2 {
            cell.courseLabel.textColor = UIColor.black
        }
        cell.courseLabel.text = item[indexPath.row]
        
        return cell
    }
    
    
}
