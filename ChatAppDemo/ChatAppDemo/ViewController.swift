//
//  ViewController.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/20/20.
//

import UIKit

fileprivate typealias diffableDataSource = UITableViewDiffableDataSource<Section, Message>
fileprivate typealias diffableSnapshots = NSDiffableDataSourceSnapshot<Section, Message>

class ViewController: UITableViewController {
    fileprivate let cellIdentifier = "messageCell"
    fileprivate var dataSource: diffableDataSource!
    fileprivate var snapShot: diffableSnapshots?
    //MARK:- View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Set Navigation Title
        self.title = "Messages"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //2. Table Customization
        self.tableViewCustomization()
        //3. Register 'MessageTableViewCell'
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        //4. Create DataSource
        self.createDiffableDataSource()
        //4. Create snapshot and apple to datasource
        self.createSnapShotAndApply()
    }

    //MARK:- Diffable DataSouce
    fileprivate func createDiffableDataSource() {
        // Do any additional setup after loading the view.
        self.dataSource =  diffableDataSource(tableView: tableView, cellProvider: { (tblView, indexPath, message) -> MessageTableViewCell? in
            let cell = tblView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! MessageTableViewCell
            cell.chatMessage = message
            return cell
        })
    }
    
    //MARK:- Snapshot
    fileprivate func createSnapShotAndApply() {
        //1. init snapshot
        self.snapShot = diffableSnapshots()
        //2. append sections
        let allSection = Section.allMessagesSection
        self.snapShot?.appendSections(allSection)
        //3. append rows in section
        allSection.forEach { section in
            self.snapShot?.appendItems(section.message, toSection: section)
        }
        //4. apply to datasoruce
        self.dataSource.apply(self.snapShot!)
    }
    
    //MARK:- Table View Customization
    fileprivate func tableViewCustomization() {
        self.tableView.backgroundColor = UIColor(white: 0.90, alpha: 1.0)
        self.tableView.separatorStyle = .none
    }
}

//MARK:- TableView Delegate
extension ViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let section = self.snapShot?.sectionIdentifiers[section] {
            let view = TableHeaderView()
            view.setTableHeader(with: section.date)
            return view
        }
        return nil
    }
}
