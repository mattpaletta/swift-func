import Foundation

typealias MyDate = (Int, Int, Int)
enum MyError: Error {
    case InvalidParameter(String)
    case IllegalMove
    case NotFound
}

// Helper Functions
private func toInt(_ b: Bool) -> Int {return b ? 1 : 0}
private func sum(_ a: Int, _ b: Int) -> Int {return a + b}

private func sum_list(_ xs: [Int]) -> Int {
    guard let head = xs.first else { return 0 } //base case, empty list.
    return head + sum_list(Array(xs.dropFirst()))
}
// End Helper Functions

func is_older(_ d1: MyDate, _ d2: MyDate) -> Bool {
    if d1.0 < d2.0 || d1.0 == d2.0 && d1.1 < d2.2 {
        return true
    } else {
        return d1.0 == d2.0 && d1.1 == d2.1 && d1.2 < d2.2
    }
}

func number_in_month(_ mns: [MyDate], month: Int) -> Int {
    return sum_list(mns.map({(dt: MyDate) -> Int in
        return toInt(dt.1 == month)
    }))
}

func number_in_months(_ mns: [MyDate], month: [Int]) -> Int {
    return sum_list(month.map({(mnt: Int) -> Int in
        return number_in_month(mns, month: mnt)
    }))
}

func dates_in_month(_ mns: [MyDate], month: Int) -> [MyDate] {
    return mns.filter({ (dt: MyDate) in
        return dt.1 == month
    })
}

func dates_in_months(_ mns: [MyDate], month: [Int]) -> [MyDate] {
    return month.map({(mnt: Int) -> [MyDate] in
        return dates_in_month(mns, month: mnt)
    }).reduce([], +)
}

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

func date_to_string(_ dt: MyDate) -> String {
    let months = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var val = ""
    do {
        val = try get_nth(months, index: dt.1 - 1)
    } catch _ {
        
    }
    
    return "\(val) \(dt.2), \(dt.0)"
}

func number_before_reaching_sum(_ num: Int, lst: [Int]) -> Int {
    guard let head = lst.first else { return 0 } //base case, empty list.
    
    if head >= num {
        return 1
    } else {
        return 1 + number_before_reaching_sum(num - head, lst: Array(lst.dropFirst()))
    }
}

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


func month_range(from: Int, to: Int) -> [Int] {
    func count(from: Int, to: Int) -> [Int] {
        if from == to {
            return [what_month(from)]
        } else {
            return [what_month(from)] + count(from: from + 1, to: to)
        }
    }
    
    if from <= to {
        return count(from: from, to: to)
    } else {
        return []
    }
}

private func oldest(_ dts: [MyDate]) -> MyDate? {
    guard let head = dts.first else { return nil }
    
    func max_nonempty(xs: [MyDate]) -> MyDate {
        if xs.count == 1 {
            return xs.first!
        } else {
            let tl_ans = max_nonempty(xs: Array(xs.dropFirst()))
            if is_older(head, tl_ans) {
                return head
            } else {
                return tl_ans
            }
        }
    }
    return max_nonempty(xs: dts)
}

func reasonable_date(dt: MyDate) -> Bool {
    let year = dt.0
    let month = dt.1
    let day = dt.2
    func leap_year(yr: Int) -> Bool {
        return yr % 400 == 0 || (yr % 4 == 0 && yr % 100 != 0)
    }
    
    if month >= 13 || month <= 0 || year <= 0 || day > 31 || day <= 0 {
        return false
    } else if month == 2 && leap_year(yr: year) {
        return day <= 29
    } else if month % 2 == 1 {
        return month > 7 ? day <= 30 : day <= 31
    } else if month == 2 {
        return day <= 28
    } else {
        return month > 7 ? day <= 31 : day <= 30
    }
}




