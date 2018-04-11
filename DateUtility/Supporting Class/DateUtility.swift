//
//  DateUtility.swift
//  DateUtility
//
//  Created by Dipang on 10/04/18.
//  Copyright © 2018 DipangiOS. All rights reserved.
//

import Foundation

public struct DateUtil {
  public static var formate = "dd MMM, yyyy"
  public static var timeZone = ""
  public static var locale = ""
  public static let calendar = Calendar.current
  public static let dateFormate = DateUtil.dateFormatter()
    
    //MARK: - DateFormater
  public static func dateFormatter() -> DateFormatter {
        let formatter : DateFormatter  = DateFormatter()
        formatter.dateFormat = DateUtil.formate
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        if !DateUtil.timeZone.isEmpty {
            formatter.timeZone = TimeZone(identifier: DateUtil.timeZone)
        }
        if !DateUtil.locale.isEmpty {
            formatter.locale = Locale(identifier: DateUtil.locale)
        }
        return formatter
    }
    
    //MARK: - Milliscond
    public static func milliscond(_ date : Date = Date()) -> Int64 {
        return Int64(date.timeIntervalSince1970 * 1000)
    }
    
    public static func milliscondFromString(_ string : String) -> Int64 {
        let date = dateFormate.date(from: string)!
        return Int64(date.timeIntervalSince1970 * 1000)
    }
    
    public static func dateFromMiliscond (_ millisecond : Int) -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval(millisecond)/1000)
        return date
    }
    
    public static func stringFromMiliscond(_ millisecond : Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(millisecond)/1000)
        return self.dateFormate.string(from: date)
    }
    
    //MARK: - Date & String
    public static func stringFromDate(_ date : Date) -> String {
        return dateFormate.string(from: date)
    }
    
    public static func dateFromString(_ string : String) -> Date {
        let date = dateFormate.date(from: string)!
        let somedateString = dateFormate.string(from: date)
        return dateFormate.date(from: somedateString)!
    }
    
    
    //MARK: - Date comparator
    public static func dateComparator(_ start : String, _ end : String) -> (isDateSame: Bool , isDateGreater : Bool , isDateLess : Bool ) {
        var isDateSame : Bool = false
        var isDateGreater : Bool = false
        var isDateLess : Bool = false
        
        guard let startDate = dateFormate.date(from: start) else {
            return (isDateSame, isDateGreater, isDateLess)
        }
        guard let endDate = dateFormate.date(from: end) else {
            return (isDateSame, isDateGreater, isDateLess)
        }
        
        if startDate.compare(endDate) == .orderedSame {
            isDateSame = true
        }
        if startDate.compare(endDate) == .orderedDescending {
            isDateGreater = true
        }
        if startDate.compare(endDate) == .orderedAscending {
            isDateLess = true
        }
        return (isDateSame, isDateGreater, isDateLess)
    }
    
    //MARK: - Date Yesterday, Today, Tomorrow,
    public static func isDay(_ string : String) -> (Yesterday: Bool , Today : Bool , Tomorrow : Bool, Weekend : Bool ) {
        
        var Yesterday : Bool = false
        var Today : Bool = false
        var Tomorrow : Bool = false
        var Weekend : Bool = false
        
        guard let date = dateFormate.date(from: string) else {
            return (Yesterday: Yesterday , Today : Today , Tomorrow : Tomorrow, Weekend : Weekend )
        }
        
        Yesterday = self.calendar.isDateInYesterday(date)
        Today = self.calendar.isDateInToday(date)
        Tomorrow = self.calendar.isDateInTomorrow(date)
        Weekend = self.calendar.isDateInWeekend(date)
        return (Yesterday: Yesterday , Today : Today , Tomorrow : Tomorrow, Weekend : Weekend)
    }
    
    //MARK: - Date component
    
   public static func  dateComponent(_ date : Date = Date()) -> (year: Int?, month : Int?, day : Int?, hour : Int?
        , minuts : Int, second : Int){
         
        let components = self.calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let year = components.year != nil  ?  components.year : 0
        let month = components.month != nil  ?  components.month : 0
        let day = components.day != nil  ?  components.day : 0
        let hour = components.hour != nil  ?  components.hour : 0
        let minuts = components.minute != nil  ?  components.minute : 0
        let second = components.second != nil  ?  components.second : 0
        return (year!,month!,day!,hour!,minuts!,second!)
    }
    
    public static func compareDate(startDate : String, endDate : String) -> Bool {
        if !startDate.isEmpty && !endDate.isEmpty {
            
            let srart = self.dateFromString(startDate)
            let end = self.dateFromString(endDate)
            if (srart.compare(end)) == .orderedDescending {
                return true
            }
            if (srart.compare(end)) == .orderedSame {
                return true
            }
        }
        return false
    }
    
    public static func isCurrentDate1(dateValue : String) -> Bool {
        if !dateValue.isEmpty {
            let someDate = dateFormate.date(from: dateValue)!
            let calendar = Calendar.current
            let flags : NSCalendar.Unit = [.day, .month, .year]
            let components = (calendar as NSCalendar).components(flags, from: Date())
            let today = calendar.date(from: components)
            if (someDate as NSDate).timeIntervalSince(today!).sign == .minus {
                //someDate is berofe than today
                return true
            } else {
                return false
                //someDate is equal or after than today
            }
        }
        return false
    }
}

let value = "Dateutility pod"

