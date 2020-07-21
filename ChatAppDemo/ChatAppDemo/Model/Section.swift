//
//  Section.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/21/20.
//

import Foundation
class Section: Hashable {
    var id = UUID()
    let date: Date
    let message: [Message]
    //MARK:- Init
    init(date: Date, message: [Message]) {
        self.date = date
        self.message = message
    }
    
    //MARK:- Hasher implemenation
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //MARK:- Equatable Protocol
    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Section {
    static var allMessagesSection: [Section] {
        //1. get all messages. Please use array of data coming from server. 
        let allMessages = [Message(messageString: "Hi", isIncomingMessage: true, date: Date.twoDaysBefore), Message(messageString: "Hello There", isIncomingMessage: false, date: Date.twoDaysBefore),Message(messageString: "How are you doing today?", isIncomingMessage: true, date: Date.twoDaysBefore), Message(messageString: "I'm doing good. Thanx....\nHow are you", isIncomingMessage: false, date: Date.twoDaysBefore),Message(messageString: "Hey, Did you try  to apply diffable datasource in UItableView", isIncomingMessage: true, date: Date.dayBeforeYesterday),Message(messageString: "Yeah, in progress, let's see how does it work. Im sure, I can implement new feature", isIncomingMessage: false, date: Date.dayBeforeYesterday),Message(messageString: "Awesommmmeeeeeeee😄, lets connect tomorrow and see how does it look like.", isIncomingMessage: true, date: Date.dayBeforeYesterday),Message(messageString: "Sure 👍, see you tomorrow. Definitely we will have something new. See you.\nBye bye", isIncomingMessage: false, date: Date.dayBeforeYesterday),Message(messageString: "Helloooooo whats up", isIncomingMessage: true, date: Date.yesterday),Message(messageString: "hello..whats up....how r u doing", isIncomingMessage: false, date: Date.yesterday),Message(messageString: "Hey.., how are you", isIncomingMessage: true, date: Date.today),Message(messageString: "Hi. Im good😊. How are you?", isIncomingMessage: false, date: Date.today),Message(messageString: "I m good. Thanks.\ndid you get something in UITableview Diffable Data Source", isIncomingMessage: true, date: Date.today),Message(messageString: "Yesssss...I am done withDiffable Data Source. Really very safe and inteerestig. Look this UI. How smooth. Isn't", isIncomingMessage: false, date: Date.today),Message(messageString: "Awesome...Really very nice. Great work. Like it❤️. Well done 👍👍", isIncomingMessage: true, date: Date.today),Message(messageString: "Thanks for your kind words 😊", isIncomingMessage: false, date: Date.today)]
                
        //2. Start grouping based on date
        let allGroupedItems = Dictionary(grouping: allMessages) { element -> Date in
            return element.date
        }
        
        //3. Create an array of Section to store items
        var arrayOfSection = [Section]()
        //sort by date
        let allKeys = allGroupedItems.keys.sorted()
        //itterates overs keys and fill into array
        allKeys.forEach { (date) in
            arrayOfSection.append(Section(date: date, message: allGroupedItems[date] ?? []))
        }
       // print(arrayOfSection)
        //4. Create sections and return
        return arrayOfSection
    }
    
}
