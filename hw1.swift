import Foundation

typealias MyDate = (Int, Int, Int)
enum MyError: Error {
    case InvalidParameter(String)
}

func is_older(_ d1: MyDate, _ d2: MyDate) -> Bool {
        if d1.0 < d2.0 || d1.0 == d2.0 && d1.1 < d2.2 {
                return true
        } else {
                return d1.0 == d2.0 && d1.1 == d2.1 && d1.2 < d2.2
        }
}

let feb28_2012 = MyDate(2012, 2, 28)
let feb12_2011 = MyDate(2011, 2, 12)
let dec1_2013 = MyDate(2013,  12,  1)
let march31_2011 = MyDate(2011,  3,  31)
let april28_2011 = MyDate( 2011,  4,  28)
let june1_2013 = MyDate(2013,  6,  1)

print("Testing Question 1")
assert(is_older(feb28_2012, dec1_2013))
assert(is_older(MyDate( 1,  2,  3), MyDate( 2,  3,  4)))
assert(!is_older(dec1_2013, feb28_2012))
assert(!is_older(dec1_2013, dec1_2013))


print("Testing Question 2")

// Helper Functions
func toInt(_ b: Bool) -> Int {return b ? 1 : 0}
func sum(_ a: Int, _ b: Int) -> Int {return a + b}

func sum_list(_ xs: [Int]) -> Int {
  guard let head = xs.first else { return 0 } //base case, empty list.

  return head + sum_list(Array(xs.dropFirst()))
}
// End Helper Functions

func number_in_month(_ mns: [MyDate], month: Int) -> Int {
  return sum_list(mns.map({(dt: MyDate) -> Int in
    return toInt(dt.1 == month)
  }))
}

assert(number_in_month([feb28_2012,dec1_2013], month: 2) == 1)
assert(number_in_month([feb28_2012,dec1_2013], month: 3) == 0)
assert(number_in_month([feb28_2012,dec1_2013,march31_2011,april28_2011], month:3) == 1)
assert(number_in_month([feb28_2012,dec1_2013,feb12_2011,march31_2011,april28_2011], month: 2) == 2)


func number_in_months(_ mns: [MyDate], month: [Int]) -> Int {
  return sum_list(month.map({(mnt: Int) -> Int in 
    return number_in_month(mns, month: mnt)
  }))
}

print("Testing Question 3")
assert(number_in_months([feb28_2012,dec1_2013,march31_2011,april28_2011], month:[2,3,4]) == 3)

func dates_in_month(_ mns: [MyDate], month: Int) -> [MyDate] {
  return mns.filter({ (dt: MyDate) in 
      return dt.1 == month
  })
}

print("Testing Question 4")
// Can't easily compare which one, so just look at the number of elements returned.
assert(dates_in_month([feb28_2012,dec1_2013],month: 2).count == 1)
assert(dates_in_month([feb28_2012,dec1_2013], month: 12).count == 1)
assert(dates_in_month([feb28_2012,dec1_2013],month: 3).count == 0)

func dates_in_months(_ mns: [MyDate], month: [Int]) -> [MyDate] {
  return month.map({(mnt: Int) -> [MyDate] in
    return dates_in_month(mns, month: mnt)
  }).reduce([], +)
}

print("Testing Question 5")
assert(dates_in_months([feb28_2012,dec1_2013,march31_2011,april28_2011], month: [2,3,4]).count == 3)

func get_nth(_ stngs: [String], index: Int) throws -> String {
  //base case, empty list.
  if stngs.count == 0 || index < 0 {
     throw MyError.InvalidParameter("Empty list or negative index")
  }

  let head = stngs.first!
  if index == 0 {
    return head
  } else {
    do {
      return try get_nth(Array(stngs.dropFirst()), index: index - 1)
    } catch MyError.InvalidParameter(let invalid) {
      throw MyError.InvalidParameter(invalid)
    }
  }
}

print("Testing Question 6")
do {
  let val = try get_nth(["hi", "there", "how", "are", "you"], index: 1)
 assert(val == "there")
} catch MyError.InvalidParameter(_) {
  // Do nothing
}

func date_to_string(_ dt: MyDate) -> String {
  let months = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  var val = ""
  do {
    val = try get_nth(months, index: dt.1 - 1)
  } catch _ {
    
  }

  return "\(val) \(dt.2), \(dt.0)" 
}

print("Testing Question 7")
assert(date_to_string(june1_2013) == "June 1, 2013")
assert(date_to_string(april28_2011) == "April 28, 2011")

func number_before_reaching_sum(_ num: Int, lst: [Int]) -> Int {
  guard let head = lst.first else { return 0 } //base case, empty list.

  if head >= num {
    return 1
  } else {
    return 1 + number_before_reaching_sum(num - head, lst: Array(lst.dropFirst()))
  }
}

print("Testing Question 8")
assert(number_before_reaching_sum(10, lst: [1,2,3,4,5]) == 4)
assert(number_before_reaching_sum(10, lst: [11,1,2,3,4,5]) == 1)
assert(number_before_reaching_sum(12, lst: [11,1,2,3,4,5]) == 2)
assert(number_before_reaching_sum(1, lst: [1,2,3,4,5]) == 1)
assert(number_before_reaching_sum(6, lst: [1,2,3,4,5]) == 3)

func what_month(_ month: Int) -> Int {
  func sum_month(_ mnt: Int) -> Int {
    if mnt % 2 == 1 {
      return mnt > 7 ? 30 : 31
    } else if mnt == 2 {
      return 28
    } else {
      return mnt > 7 ? 31 : 30
    }
  }

  // Convert from index starting at 1 to 0
  let sum =  number_before_reaching_sum(month, lst: Array(1 ... 12).map(sum_month)) - 1
  if sum < 12 {
    return sum + 1
  } else {
    return sum
  }
}

print("Testing Question 9")
assert(what_month(70) == 3)
assert(what_month(31) == 1)
assert(what_month(32) == 2)
assert(what_month(360) == 12)
assert(what_month(70) == 3)
assert(what_month(30) == 1)
assert(what_month(1) == 1)
assert(what_month(32) == 2)
assert(what_month(365) == 12)
assert(what_month(364) == 12)
