//
//  TableHeaderView.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/21/20.
//

import UIKit

class TableHeaderView: UIView {
    
    private let dateTextLabel: CustomIntrinsicSizeLabel  = {
        let label = CustomIntrinsicSizeLabel()
        label.font = .systemFont(ofSize: 14.0)
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- View Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabelOnView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLabelOnView()
    }
    
    //MARK:- Add label on view
    fileprivate func addLabelOnView() {
        //1.
        self.addSubview(dateTextLabel)
        //2. Center Constraint
        NSLayoutConstraint.activate([
            self.dateTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.dateTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    //MARK:- update text on label header
    func setTableHeader(with date: Date) {
        self.dateTextLabel.text =  date.getHumanReadableString()
    }
}
