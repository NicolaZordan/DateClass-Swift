//
//  SimpeSwift.swift
//
//  Created by Nicola Zordan on 7/21/14.
//  Copyright (c) 2014 CrosaraZordan. All rights reserved.
//
// a usable Date class for swift
// removing the need for unnecessary other objects to get and set date parts

import Foundation
//import UIKit


// Date by Nicola Zordan

class Date: Printable {
    var nsdate:NSDate
    
    init() {
        nsdate = NSDate()
    }
    
    init (nsdate:NSDate) {
        self.nsdate=nsdate
    }
    
    init (date:Date) {
        nsdate=date.nsdate
    }
    
    
    func asNSDate() -> NSDate {
        return self.nsdate
    }
    
    class var cal:NSCalendar {
        get {
            //return NSCalendar()
            //return NSCalendar(identifier:NSGregorianCalendar)
            return NSCalendar.currentCalendar()
    }
    }
    
    class var dateUnitComp: NSCalendarUnit {
        get {
            return NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitHour|NSCalendarUnit.CalendarUnitMinute|NSCalendarUnit.CalendarUnitSecond|NSCalendarUnit.CalendarUnitNanosecond|NSCalendarUnit.CalendarUnitTimeZone|NSCalendarUnit.CalendarUnitWeekday|NSCalendarUnit.CalendarUnitWeekOfYear|NSCalendarUnit.CalendarUnitQuarter
    }
    }
    
    class func now() -> Date {
        return Date()
    }
    
    class func date0() -> Date {
        return Date(year: 0, month: 0, day: 0, hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
    init (string: String) {
        nsdate = Date(yyyy_mm_dd: string).nsdate
    }
    init (yyyy_mm_dd: String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        nsdate = Date(nsdate: dateStringFormatter.dateFromString(yyyy_mm_dd)).nsdate
    }
    
    init (year:Int, month:Int, day:Int) {
        nsdate = Date(year: year, month: month, day: day, hour: 0, minute: 0, second: 0, nanosecond: 0).nsdate
    }
    
    init (hour: Int, minute: Int, second: Int) {
        nsdate = Date(year: 0, month: 0, day: 0, hour: hour, minute: minute, second: second, nanosecond: 0).nsdate
    }
    init (hour: Int, minute: Int, second: Int, nanosecond: Int) {
        nsdate = Date(year: 0, month: 0, day: 0, hour: hour, minute: minute, second: second, nanosecond: 0).nsdate
    }
    
    init (year:Int, month:Int, day:Int, hour: Int, minute: Int, second: Int) {
        nsdate = Date(year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: 0).nsdate
    }
    init (year:Int, month:Int, day:Int, hour: Int, minute: Int, second: Int, nanosecond: Int) {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        c.hour=hour
        c.minute=minute
        c.second=second
        c.nanosecond=nanosecond
        
        var cal = NSCalendar(identifier:NSGregorianCalendar)
        var date = cal.dateFromComponents(c)
        nsdate = date
    }
    
    
    func year0() -> Int {
        var i: Int = 0
        //var cal = NSCalendar()
        //var dateComp = cal.components(NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay, fromDate: self)
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.year
        return i
    }
    
    
    var year: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: nsdate)
        i=dateComp.year
        return i
    }
    set {
        nsdate=Date(year: newValue, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var month: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.month
        return i
    }
    set {
        nsdate=Date(year: self.year, month: newValue, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var day: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.day
        return i
    }
    set {
        nsdate=Date(year: self.year, month: self.month, day: newValue, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var hour: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.hour
        return i
    }
    set {
        nsdate=Date(year: self.year, month: self.month, day: self.day, hour: newValue, minute: self.minute, second: self.second, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var minute: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.minute
        return i
    }
    set {
        nsdate=Date(year: self.year, month: self.month, day: self.day, hour: self.hour, minute: newValue, second: self.second, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var second: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.second
        return i
    }
    set {
        nsdate=Date(year: self.year, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: newValue, nanosecond: self.nanosecond).nsdate
    }
    }
    
    var nanosecond: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.nanosecond
        return i
    }
    set {
        nsdate=Date(year: self.year, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: newValue).nsdate
    }
    }
    
    var weekday: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.weekday
        return i
    }
    }
    
    var weekOfYear: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.weekOfYear
        return i
    }
    }
    
    var quarter: Int {
    get {
        var i: Int = 0
        var dateComp = Date.cal.components(Date.dateUnitComp, fromDate: self.nsdate)
        i=dateComp.quarter
        return i
    }
    }
    
    
    
    func add (#years:Int, months:Int, days: Int, hours:Int, minutes:Int, seconds:Int, nanoseconds: Int) -> Date {
        var year=self.year+years
        var month=self.month+months
        var day=self.day+days
        var hour=self.hour+hours
        var minute=self.minute+minutes
        var second=self.second+seconds
        var nano=self.nanosecond+nanoseconds
        var r=Date(year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nano)
        nsdate=r.nsdate
        return self
    }
    
    func add (d: Date) -> Date {
        return add(years:d.year, months:d.month, days:d.day, hours:d.hour, minutes:d.minute, seconds:d.second, nanoseconds:d.nanosecond)
    }
    func substract (d: Date) -> Date {
        return add(years: -d.year, months: -d.month, days: -d.day, hours: -d.hour, minutes: -d.minute, seconds: -d.second, nanoseconds: -d.nanosecond)
    }
    func add (#years: Int) -> Date {
        return add(years:years, months:0, days:0, hours:0, minutes:0, seconds:0, nanoseconds:0)
    }
    func add (#months: Int) -> Date {
        return add(years:0, months:months, days:0, hours:0, minutes:0, seconds:0, nanoseconds:0)
    }
    func add (#days: Int) -> Date {
        return add(years:0, months:0, days:days, hours:0, minutes:0, seconds:0, nanoseconds:0)
    }
    func add (#hours: Int) -> Date {
        return add(years:0, months:0, days:0, hours:hours, minutes:0, seconds:0, nanoseconds:0)
    }
    func add (#minutes: Int) -> Date {
        return add(years:0, months:0, days:0, hours:0, minutes:minutes, seconds:0, nanoseconds:0)
    }
    func add (#seconds: Int) -> Date {
        return add(years:0, months:0, days:0, hours:0, minutes:0, seconds:seconds, nanoseconds:0)
    }
    func add (#nanoseconds: Int) -> Date {
        return add(years:0, months:0, days:0, hours:0, minutes:0, seconds:0, nanoseconds:nanoseconds)
    }
    func add (#seconds: Int, nanoseconds: Int) -> Date {
        return add(years:0, months:0, days:0, hours:0, minutes:0, seconds:seconds, nanoseconds:nanoseconds)
    }
    
    func asDateOnly() -> Date {
        var r=Date(year: self.year, month: self.month, day: self.day, hour: 0, minute: 0, second: 0, nanosecond: 0)
        return r
    }
    func asTimeOnly() -> Date {
        var r=Date(year: 0, month: 0, day: 0, hour: self.hour, minute: self.minute, second: self.second, nanosecond: 0)
        return r
    }
    func asTimeOnlyNanosecond() -> Date {
        var r=Date(year: 0, month: 0, day: 0, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanosecond)
        return r
    }
    
    
    func asDays() -> Int {
        var i: Int = 0
        //NSUInteger unitFlags = NSDayCalendarUnit;
        //NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        //NSDateComponents *components = [calendar components:unitFlags fromDate:dt1 toDate:dt2 options:0];
        //return [components day]+1;
        var op = Date.cal.components(NSCalendarUnit.DayCalendarUnit, fromDate: Date.date0().nsdate, toDate: self.nsdate, options: nil)
        i=op.day
        return i
    }
   
    func asDouble() -> Double {
        // returns milliseconds, and fraction part of ms
        var ti = nsdate.timeIntervalSinceReferenceDate
        var d: Double = ti
        //var d: Double = ti * 100000
        //var f: Float = Float(ti)
        //var op = Date.cal.components(NSCalendarUnit.SecondCalendarUnit, fromDate: Date.date0().nsdate, toDate: self.nsdate, options: nil)
        //f=op.second
        return d
    }
    
    func isBefore(d: Date) -> Bool {
        var dc: NSComparisonResult = ((self.nsdate).compare(d.nsdate))
        //switch dc {
        //    case NSComparisonResult.OrderedSame:
        //        // =
        //        break
        //    case NSComparisonResult.OrderedAscending:
        //        // < : self < d
        //        break
        //    case NSComparisonResult.OrderedDescending:
        //        // > : self > d
        //        break
        //}
        var b:Bool = (dc==NSComparisonResult.OrderedAscending)
        return b
    }
    func isAfter(d: Date) -> Bool {
        var dc: NSComparisonResult = ((self.nsdate).compare(d.nsdate))
        var b:Bool = (dc==NSComparisonResult.OrderedDescending)
        return b
    }
    func isEqual (d:Date) -> Bool {
        var dc: NSComparisonResult = ((self.nsdate).compare(d.nsdate))
        var b:Bool = (dc==NSComparisonResult.OrderedSame)
        return b
    }
    
    func equals (date:Date) -> Bool {
        return self.isEqual(date)
    }
    
    // sorting
    func lessThan(date: Date) -> Bool {
        return self.isBefore(date)
    }
    class func forSorting (d1:Date, d2: Date) -> Bool {
        return d1.lessThan(d2)
    }
    class func forSortingBackwards (d1:Date, d2: Date) -> Bool {
        return !(d1.lessThan(d2))
    }
    
    var description: String {
    	return "\(self.nsdate)"
    }
    

    func isLeapYear() -> Bool {
        var r:Bool=false
        r = self.year % 4 == 0 && !(self.year % 100 == 0) || (self.year % 400 == 0)
        return r
    }
    
    func dayName(dayNames:[String]) -> String {
        var n:String = ""
        if (dayNames.count>=7) {
            n=dayNames[self.weekday-1]
        }
        return n
    }

    func monthName(dayNames:[String]) -> String {
        var n:String = ""
        if (dayNames.count>=12) {
            n=dayNames[self.month-1]
        }
        return n
    }


    func dayName() -> String {
        let dayNames:[String]=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        return dayName(dayNames)
    }
    
    func monthName() -> String {
        let monthNames:[String]=["January","February","March","April","May","June","July","August","September","October","November","December"]
        return monthName(monthNames)
    }


    class func n00 (n:Int) -> String {
        var s=""
        if n<10 {
            s="0"
        }
        s+="\(n)"
        return s
    }
    
    func stringMDY(separator:String) -> String {
        //var s="\(self.month)"+separator+"\(self.day)"+separator+"\(self.year)"
        var s=Date.n00(self.month)+separator+Date.n00(self.day)+separator+"\(self.year)"
        return s
    }

    func stringMDY() -> String {
        // 28/7/2014
        let separator="/"
        return stringMDY(separator)
    }

    func stringWMDY() -> String {
        // Monday July 28 2014
        var s=self.dayName()+" "+self.monthName()+" \(self.day) \(self.year)"
        return s
    }
    
}




/* test 

var dt=Date()
dt
dt.year
dt.month
dt.day
dt.hour
dt.minute
dt.second
dt.nanosecond
dt.year=1967
dt.year
var dt2=Date.YMD(year: 1967, month: 2, day: 3)
dt2.year
dt2.month
dt2.day
dt2.nanosecond

dt.asDouble()
Date.now().day

var d4=Date()
d4.year
d4.month
d4.add(days:5)
d4.add(months: 3)
d4.add(months: 6)

var d5=Date(date: d4).add(days: 20)
var d6=Date(date: d4).add(days: -25)

d5.isBefore(d6)
d5.isAfter(d6)


d5.asDays()
var d0=Date.date0()
d6.asDays()
d5.asDays()

d0.asDays()

var dd=Date(date:d4).substract(d6)
var ddn=Date(date:d4).substract(d5)
var ddn2=Date(date:d5).substract(d4)
dd.asDays()
ddn.asDays()
ddn2.asDays()
ddn2.asDouble() // ms
ddn2.asDouble()/20
ddn2.asDouble()/20/24/60/60/60 // ms


var ads=[dt,d4,d5,d6,d0,ddn,ddn2]
ads.count
var adsSorted = sorted(ads, Date.forSorting)
adsSorted.count


var dl=Date()
dl.isLeapYear()
var dl2=Date(date: dl)
dl2.year=2004
dl2.isLeapYear()
dl.day
dl.weekday
dl.dayName()
dl.month
dl.monthName()
dl.stringMDY()
dl.stringWMDY()



 /test */



