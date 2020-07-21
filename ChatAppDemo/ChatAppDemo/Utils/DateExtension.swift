//
//  DateExtension.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/21/20.
//

import Foundation

extension Date {
     private var americanDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    func getHumanReadableString() -> String {
        return americanDateFormatter.string(from: self)
    }
    
    //var to get different day's dates
    static var yesterday: Date { return Date().dayBefore }
    static var dayBeforeYesterday: Date { return Date().dayBeforeYesterdayDate}
    static var twoDaysBefore:  Date { return Date().twoDaysBeeforeDate}
    static var today: Date { return Date() }
    static var tomorrow:  Date { return Date().dayAfter }
    
    //File private vars
    fileprivate var dayBefore: Date {
         return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
     }
    
    fileprivate var dayBeforeYesterdayDate: Date {
         return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
     }
    
    fileprivate var twoDaysBeeforeDate: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: noon)!
    }
    
    fileprivate var dayAfter: Date {
         return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
     }
    
    fileprivate var noon: Date {
         return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
     }
    
    fileprivate var month: Int {
         return Calendar.current.component(.month,  from: self)
     }
    fileprivate var isLastDayOfMonth: Bool {
         return dayAfter.month != month
     }
}
