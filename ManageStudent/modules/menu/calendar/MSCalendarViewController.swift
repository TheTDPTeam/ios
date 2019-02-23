//
//  MSCalendarViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import FSCalendar

class MSCalendarViewController: UIViewController {
    
    let item = ["Batch 130","Batch 131","Batch 132","Batch 133","Batch 134",
                "Batch 135","Batch 136","Batch 137","Batch 138","Batch 139","Batch 140"]
    
    let fillDefaultColors = ["2019/02/12": UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0),
                             "2019/02/16": UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0),
                             "2019/02/19": UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0),
                             "2019/02/21": UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0),
                             "2019/02/26": UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0)]
    
    let borderDefaultColors = ["2019/02/14":  UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0),
                               "2019/02/23":  UIColor(red: 232/255.0, green: 146/255.0, blue: 39/255.0, alpha: 1.0)]
    
    var datesWithEvent = ["2019/02/12","2019/02/16","2019/02/19",
                          "2019/02/21","2019/02/26","2019/02/14","2019/02/23"]
    
    @IBOutlet weak var calendar: FSCalendar!
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    fileprivate var datesWithCat = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configCalendar()
    }
    
    func configCalendar() {
        self.calendar.dataSource = self
        self.calendar.delegate = self
        self.calendar.select(Date())
        self.calendar.allowsMultipleSelection = true
        
        self.calendar.appearance.weekdayTextColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 242/255.0, alpha: 1.0)
        self.calendar.appearance.headerTitleColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1.0)
//        self.calendar.appearance.eventDefaultColor = UIColor(red: 252/255.0, green: 182/255.0, blue: 25/255.0, alpha: 1.0)
        
//        self.calendar.appearance.selectionColor = UIColor(red: 194/255.0, green: 198/255.0, blue: 204/255.0, alpha: 0.8)
//        self.calendar.appearance.titleSelectionColor = UIColor(red: 252/255.0, green: 251/255.0, blue: 252/255.0, alpha: 1.0)
        self.calendar.appearance.todayColor = UIColor.white //UIColor(red: 169/255, green: 168/255, blue: 167/255, alpha: 1.0)
        self.calendar.appearance.titleTodayColor = UIColor(red: 98/255.0, green: 101/255.0, blue: 103/255.0, alpha: 1.0)
        self.calendar.appearance.titleDefaultColor =  UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0)
        
//        var weekdays = calendar.calendarWeekdayView.weekdayLabels
//        (weekdays[5] ).textColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 242/255.0, alpha: 1.0)
//        (weekdays[6] ).textColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 242/255.0, alpha: 1.0)
    }
   
}

extension MSCalendarViewController : FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let dateEvent = self.formatter.string(from: date)
//        if datesWithEvent.contains(dateEvent) {
//            return 1
//        }
//        return 0
//    }
    
    // MARK:- FSCalendarDelegate
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateSelected = self.formatter.string(from: date)
        print("calendar did select date \(dateSelected)")
        self.calendar.appearance.selectionColor =  UIColor(red: 252/255.0, green: 131/255.0, blue: 35/255.0, alpha: 1.0)
//        self.calendar.appearance.titleSelectionColor = UIColor(red: 252/255.0, green: 251/255.0, blue: 252/255.0, alpha: 1.0)
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let key = self.formatter.string(from: date)
        if let color = self.fillDefaultColors[key] {
            return color
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        let key = self.formatter.string(from: date)
        if let color = self.borderDefaultColors[key] {
            return color
        }
        return appearance.borderDefaultColor
    }
}

extension MSCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "batchCell", for: indexPath) as! MSCollectionViewCell
        let myBatch = item[indexPath.row]
        if myBatch == "Batch 130" {
            cell.batchLabel.text = "My Batch"
            cell.batchLabel.textColor = UIColor.black
        } else {
            cell.batchLabel.text = item[indexPath.row]
        }
        return cell
    }
    
    
}
