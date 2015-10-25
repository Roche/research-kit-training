//
//  ResultsTableViewController.swift
//  Health Check
//
//  Created by Michal Wojtysiak on 25/10/15.
//  Copyright © 2015 Michal Wojtysiak. All rights reserved.
//

import UIKit

struct Result{
    var title:String
    var detail:String
    var success:Bool
}

class ResultsTableViewController: UITableViewController {

    private var results:[Result]?
    
    required convenience init(results:[Result]?) {
        self.init(style:.Plain)
        self.results = results
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        tableView.separatorStyle = .None
        tableView.rowHeight = 70.0
        tableView.registerClass(ResultTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Results"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("dismiss"))

    }

    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ResultTableViewCell(style: .Subtitle, reuseIdentifier: "reuseIdentifier")

        cell.textLabel?.text = results?[indexPath.row].title
        cell.detailTextLabel?.text = results?[indexPath.row].detail
        if let success = results?[indexPath.row].success{
            cell.resultImage?.image = UIImage(named: success ? "valid_icon" :
            "invalid_icon")
        }else{
            cell.resultImage?.image = nil
        }

        return cell
    }
}
