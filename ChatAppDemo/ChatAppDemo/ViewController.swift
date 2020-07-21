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
        self.title = "Messages"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundColor = UIColor(white: 0.90, alpha: 1.0)
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight =  UITableView.automaticDimension

        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.createDiffableDataSource()
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
        //1.
        self.snapShot = diffableSnapshots()
        //2.
        let allSection = Section.allMessagesSection
        self.snapShot?.appendSections(allSection)
        //3.
        allSection.forEach { section in
            self.snapShot?.appendItems(section.message, toSection: section)
        }
        //4.
        self.dataSource.apply(self.snapShot!)
        
    }
}

//MARK:- TableView Delegate
extension ViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
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
