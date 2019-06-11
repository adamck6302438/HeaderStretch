//
//  StretchTableViewController.swift
//  HeaderStretch
//
//  Created by Frances ZiyiFan on 6/11/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

import UIKit

struct NewsItem{
    var category : String
    var headline : String
}

private let kTableHeaderHeight = 300.0

class StretchTableViewController: UITableViewController {
    
    @IBOutlet weak var headerView : UIView!
    var newsItems : [NewsItem]!
    @IBOutlet weak var dateLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiates news items
        newsItems = [
            NewsItem(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities"),
            NewsItem(category: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
            NewsItem(category: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
            NewsItem(category: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
            NewsItem(category: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting"),
            NewsItem(category: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
            NewsItem(category: "World", headline: "South Africa in $40 billion deal for Russian nuclear reactors"),
            NewsItem(category: "Europe", headline: "'One million babies' created by EU student exchanges")
        ]
        
        //add headerview to table view
        headerView = tableView.tableHeaderView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: CGFloat(kTableHeaderHeight), left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        //table view auto layout
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: tableView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
                                     ])
        
        //auto resize for table view cell
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        
        //set date label
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        let result = formatter.string(from: date as Date)
        dateLabel.text = result
        

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Stretch cell", for: indexPath) as? StretchTableViewCell else{
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        switch newsItems![indexPath.row].category {
        case "World":
            cell.categoryLabel.textColor = UIColor.red
        case "Americas":
            cell.categoryLabel.textColor = UIColor.blue
        case "Europe":
            cell.categoryLabel.textColor = UIColor.green
        case "Middle East":
            cell.categoryLabel.textColor = UIColor.yellow
        case "Africa":
            cell.categoryLabel.textColor = UIColor.orange
        case "Asia Pacific":
            cell.categoryLabel.textColor = UIColor.purple
        default:
            cell.categoryLabel.textColor = UIColor.black
        }
        
        cell.categoryLabel.text = newsItems![indexPath.row].category
        cell.headlineLabel.numberOfLines = 0
        cell.headlineLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.headlineLabel.text = newsItems![indexPath.row].headline
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: CGFloat(-kTableHeaderHeight), width: tableView.bounds.width, height: CGFloat(kTableHeaderHeight))
        if tableView.contentOffset.y < CGFloat(-kTableHeaderHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
}
