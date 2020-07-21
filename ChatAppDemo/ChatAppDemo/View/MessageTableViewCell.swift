//
//  MessageTableViewCell.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/20/20.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    fileprivate let paddingCell: CGFloat = 10.0
    //message lable
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .monospacedSystemFont(ofSize: 12.0, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //incoming message leading contraint. Can be force wrapped as they are being initialise in 'init'
    var incomngMessageLeadingConstraint: NSLayoutConstraint!
    //outgoing message trailing consytraint
    var outgoingMessageTrailingConstraint: NSLayoutConstraint!
    var messageWidthConstraint: NSLayoutConstraint!
    //view behind on message label
    private let messageBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10.0
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //var to handle chat message
    var chatMessage: Message! {
        didSet {
            self.setUpTextMessageAndAlignment()
        }
    }
    
    //MARK:- view life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //cell background color to clear color and set selection to .none
        backgroundColor = .clear
        selectionStyle = .none
        //1. Add Label
        addSubview(messageBackgroundView)
        //2.
        addSubview(self.messageLabel)
        //3. Apply constraint
        NSLayoutConstraint.activate([
            //1. Message Label constraint
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: paddingCell*2),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingCell*2),
            //2. Message BackgroundView constraint
            messageBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -paddingCell),
            messageBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: paddingCell),
            messageBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -paddingCell),
            messageBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: paddingCell)
            ]
        )
        //4.
        self.incomngMessageLeadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingCell*2)
        self.outgoingMessageTrailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingCell*2)
        self.messageWidthConstraint = messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250.0)
     }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK:- Message label setup
    fileprivate func setUpTextMessageAndAlignment() {
        //1. message string in label
        self.messageLabel.text  = self.chatMessage.messageString
        //2. bubble color
        self.messageBackgroundView.backgroundColor = self.chatMessage.isIncomingMessage ? .white : .green
        //3. bubble allignment
        self.resetConstraintsAsPerMessage()
    }
    
    //MARK:- Reset constraint on Message label and bubble
    fileprivate func resetConstraintsAsPerMessage() {
        self.messageWidthConstraint.isActive = false
        self.incomngMessageLeadingConstraint.isActive = self.chatMessage.isIncomingMessage
        self.outgoingMessageTrailingConstraint.isActive = !self.chatMessage.isIncomingMessage
        self.messageWidthConstraint.isActive = true
    }
}
