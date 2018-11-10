//
//  testing.swift
//  testing
//
//  Created by Matthew on 2018-11-09.
//  Copyright © 2018 Matthew Paletta. All rights reserved.
//

import XCTest

class hw1test: XCTestCase {
    
    let feb28_2012 = MyDate(2012, 2, 28)
    let feb12_2011 = MyDate(2011, 2, 12)
    let dec1_2013 = MyDate(2013,  12,  1)
    let march31_2011 = MyDate(2011,  3,  31)
    let april28_2011 = MyDate( 2011,  4,  28)
    let june1_2013 = MyDate(2013,  6,  1)
    
    // MARK: Question 1
    func test_is_older_1() {
        XCTAssert(is_older(MyDate(1, 2, 3), (2, 3, 4)))
    }
    
    func test_is_older_2() {
        XCTAssert(is_older(feb28_2012,dec1_2013))
    }
    
    func test_is_older_3() {
        XCTAssertFalse(is_older(dec1_2013, feb28_2012))
    }
    
    func test_is_older_4() {
        XCTAssertFalse(is_older(dec1_2013, dec1_2013))
    }
    
    // MARK: Question 2
    func test_num_in_month1() {
        XCTAssertEqual(number_in_month([feb28_2012,dec1_2013], month: 2), 1)
    }
    
    func test_num_in_month2() {
        XCTAssertEqual(number_in_month([feb28_2012,dec1_2013], month: 3), 0)
    }
    
    func test_num_in_month3() {
        XCTAssertEqual(number_in_month([feb28_2012,dec1_2013,march31_2011,april28_2011], month:3), 1)
    }
    
    func test_num_in_month4() {
        XCTAssertEqual(number_in_month([feb28_2012,dec1_2013,feb12_2011,march31_2011,april28_2011], month: 2), 2)
    }
    
    // MARK: Question 3
    func test_num_in_months1() {
        XCTAssertEqual(number_in_months([feb28_2012,dec1_2013,march31_2011,april28_2011], month: [2,3,4]), 3)
    }
    
    
    // MARK: Question 4
    func test_dates_in_month1() {
        XCTAssertEqual(dates_in_month([feb28_2012,dec1_2013],month: 2).count, 1)
    }
    
    func test_dates_in_month2() {
        XCTAssertEqual(dates_in_month([feb28_2012,dec1_2013], month: 12).count, 1)
    }
    
    func test_dates_in_month3() {
        XCTAssertEqual(dates_in_month([feb28_2012,dec1_2013],month: 3).count, 0)
    }
    
    // MARK: Question 5
    func test_get_nth1() {
        XCTAssertNoThrow(try get_nth(["hi", "there", "how", "are", "you"], index: 1))
    }
    
    func test_get_nth2() {
        XCTAssertThrowsError(try get_nth(["hi", "there", "how", "are", "you"], index: 7))
    }
    
    func test_get_nth3() {
        XCTAssertNoThrow(try get_nth(["hi", "there", "how", "are", "you"], index: 0))
    }
    
    func test_get_nth4() {
        XCTAssertThrowsError(try get_nth([], index: 0))
    }
    
    // MARK: Question 6
    func test_date_to_string1() {
        XCTAssertEqual(date_to_string(june1_2013), "June 1, 2013")
    }
    
    func test_date_to_string2() {
        XCTAssertEqual(date_to_string(april28_2011), "April 28, 2011")
    }
    
    // MARK: Question 7
    func test_num_before_reaching_sum1() {
        XCTAssertEqual(number_before_reaching_sum(10, lst: [1,2,3,4,5]), 4)
    }
    
    func test_num_before_reaching_sum2() {
        XCTAssertEqual(number_before_reaching_sum(10, lst: [11,1,2,3,4,5]), 1)
    }
    
    func test_num_before_reaching_sum3() {
        XCTAssertEqual(number_before_reaching_sum(12, lst: [11,1,2,3,4,5]), 2)
    }
    
    func test_num_before_reaching_sum4() {
        XCTAssertEqual(number_before_reaching_sum(1, lst: [1,2,3,4,5]), 1)
    }
    
    func test_num_before_reaching_sum5() {
        XCTAssertEqual(number_before_reaching_sum(6, lst: [1,2,3,4,5]), 3)
    }
    
    // MARK: Question 8
    func test_what_month1() {
        XCTAssertEqual(what_month(70), 3)
    }
    
    func test_what_month2() {
        XCTAssertEqual(what_month(31), 1)
    }
    
    func test_what_month3() {
        XCTAssertEqual(what_month(32), 2)
    }
    
    func test_what_month4() {
        XCTAssertEqual(what_month(360), 12)
    }
    
    func test_what_month5() {
        XCTAssertEqual(what_month(70), 3)
    }
    
    func test_what_month6() {
        XCTAssertEqual(what_month(30), 1)
    }
    
    func test_what_month7() {
        XCTAssertEqual(what_month(1), 1)
    }
    
    func test_what_month8() {
        XCTAssertEqual(what_month(32), 2)
    }
    
    func test_what_month9() {
        XCTAssertEqual(what_month(365), 12)
    }
    
    func test_what_month10() {
        XCTAssertEqual(what_month(364), 12)
    }
    
    
    func test_month_range1() {
        XCTAssertEqual(month_range(from: 31, to: 34), [1, 2, 2, 2])
    }
    
    func test_month_range2() {
        XCTAssertEqual(month_range(from: 360, to: 365), Array.init(repeating: 12, count: 6))
    }
    
    func test_month_range3() {
        XCTAssertEqual(month_range(from: 31, to: 31 + 28 + 1), [1] + Array.init(repeating: 2, count: 28) + [3])
    }
    
    func test_month_range4() {
        XCTAssertEqual(month_range(from: 35, to: 34).count, 0)
    }
    
    func test_month_range5() {
        XCTAssertEqual(month_range(from: 35, to: 35), [2])
    }
    
    func test_month_range6() {
        XCTAssertEqual(month_range(from: 31 + 29, to: 31 + 29), [3])
    }
    
    func test_reasonable_date1() {
        XCTAssert(reasonable_date(dt: MyDate(2014, 12, 31)))
    }
    
    func test_reasonable_date2() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2015,  2,  29)))
    }
    
    func test_reasonable_date3() {
        XCTAssert(reasonable_date(dt: MyDate(2012,  2,  29)))
    }
    
    func test_reasonable_date4() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2014,  0,  31)))
    }
    
    func test_reasonable_date5() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2014,  13,  31)))
    }
    
    func test_reasonable_date6() {
        XCTAssert(reasonable_date(dt: MyDate(2013,  3,  31)))
    }
    
    func test_reasonable_date7() {
        XCTAssertFalse(reasonable_date(dt: MyDate(0,  1,  10)))
    }
    
    func test_reasonable_date8() {
        XCTAssertFalse(reasonable_date(dt: MyDate(-10,  1,  10)))
    }
    
    func test_reasonable_date9() {
        XCTAssert(reasonable_date(dt: MyDate(2014, 10, 14)))
    }
    
    func test_reasonable_date10() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  1,  32)))
    }
    
    func test_reasonable_date11() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  2,  31)))
    }
    
    func test_reasonable_date12() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  2,  31)))
    }
    
    func test_reasonable_date13() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  3,  31)))
    }
    
    func test_reasonable_date14() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  4,  31)))
    }
    
    func test_reasonable_date15() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  5,  31)))
    }
    
    func test_reasonable_date16() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  6,  31)))
    }
    
    func test_reasonable_date17() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  7,  31)))
    }
    
    func test_reasonable_date18() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  8,  31)))
    }
    
    func test_reasonable_date19() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  9,  31)))
    }
    
    func test_reasonable_date20() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  10,  31)))
    }
    
    func test_reasonable_date21() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  11,  31)))
    }
    
    func test_reasonable_date22() {
        XCTAssert(reasonable_date(dt: MyDate(2000,  12,  31)))
    }
    
    func test_reasonable_date23() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  1,  32)))
    }
    
    func test_reasonable_date24() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  2,  32)))
    }
    
    func test_reasonable_date25() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  3,  32)))
    }
    
    func test_reasonable_date26() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  4,  32)))
    }
    
    func test_reasonable_date27() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  5,  32)))
    }
    
    func test_reasonable_date28() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  6,  32)))
    }
    
    func test_reasonable_date29() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  7,  32)))
    }
    
    func test_reasonable_date30() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  8,  32)))
    }
    
    func test_reasonable_date31() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  9,  32)))
    }
    
    func test_reasonable_date32() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  10,  32)))
    }
    
    func test_reasonable_date33() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  11,  32)))
    }
    
    func test_reasonable_date34() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000,  12,  32)))
    }
    
    func test_reasonable_date35() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000, 1, 0)))
    }
    
    func test_reasonable_date36() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000, -1, 1)))
    }
    
    func test_reasonable_date37() {
        XCTAssertFalse(reasonable_date(dt: MyDate(-2000, 1, 1)))
    }
    
    func test_reasonable_date38() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2000, 1, ~1)))
    }
    
    func test_reasonable_date39() {
        XCTAssertFalse(reasonable_date(dt: MyDate(1900, 2, 29)))
    }
    
    func test_reasonable_date40() {
        XCTAssert(reasonable_date(dt: MyDate(2000, 2, 29)))
    }
    
    func test_reasonable_date41() {
        XCTAssertFalse(reasonable_date(dt: MyDate(2001, 2, 29)))
    }
    
    func test_reasonable_date42() {
        XCTAssert(reasonable_date(dt: MyDate(2008, 2, 29)))
    }
}
