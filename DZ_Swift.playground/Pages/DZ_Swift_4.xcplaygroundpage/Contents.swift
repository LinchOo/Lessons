import UIKit
//-------------/DZ_04/-------------// Arrays
var moneyKeeper = [10,50,100,50,100,100,100]
var summary:Int = 0
for money in moneyKeeper {
    summary += money
}
print(summary)
//----------/DZ_04 part 2/----------//
var i = 0
var January = [String]()
let mounth = ( January: 31, Februari: 28, Mart: 31, April: 30,
               May: 31, Jun: 30, July: 31, Aughust: 31,
               September: 30, October: 31, November: 30, December: 31 )
let weak = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" ]
var daysCount: Int = 365
var daysInYear  = [String]()
var iterator = 0
repeat{
    daysCount = daysCount - 1
    if(iterator == 7) {
        iterator = 0
    }
    daysInYear.append(weak[iterator])
    iterator += 1
} while( daysCount != 0 )

//January.append(daysInYear[0...mounth.January])
//January = daysInYear.replacing(January, with: daysInYear,subrange: 0...3, maxReplacements: 1)


func DaysInMounth(dayscount:Int,daysInYear: [String]) -> [String] {
    var DaysMounth = [String]()
    print(daysInYear[0...3])
    //DaysMounth = daysInYear[0...3]
    return DaysMounth
}
//print(January)
