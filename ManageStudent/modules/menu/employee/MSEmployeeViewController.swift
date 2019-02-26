//
//  MSEmployeeViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import MMCardView

class MSEmployeeViewController: UIViewController {
    var sectionData = [MSStaff]()
    
    @IBOutlet weak var cardCollection: MMCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configDataStaff()
        cardCollection.register(UINib(nibName: "CardACell", bundle: nil), forCellWithReuseIdentifier: "CardA")
        
        if let layout = cardCollection.collectionViewLayout as? CustomCardLayout {
            layout.titleHeight = 80.0
            layout.bottomShowCount = 2
            layout.cardHeight = 200
            layout.showStyle = .normal
        }
    }
    
    func configDataStaff() {
        MSContactManager.shareInstance.fetchStaff { (listStaff) in
            self.sectionData = listStaff
            self.cardCollection.reloadData()
        }
    
    }
    @IBAction func activeComBack(_ sender: Any) {
        MSSwitchViewManager.shareInstance.switchTabbarView()
    }
    
}

extension MSEmployeeViewController: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.card(collectionView: collectionView, cellForItemAt: indexPath)
    }
    
    fileprivate func card(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardA", for: indexPath) as! CardACell
        cell.configCell(data: sectionData[indexPath.row])
        return cell
    }
}

extension MSEmployeeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
