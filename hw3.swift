//
//  hw3.swift
//  swift-func
//
//  Created by Matthew on 2018-11-09.
//  Copyright © 2018 Matthew Paletta. All rights reserved.
//

import Foundation


func only_captials(_ lst: [String]) -> [String] {
    let uppers = NSCharacterSet.uppercaseLetters
    let lowers = NSCharacterSet.lowercaseLetters
    
    return lst.filter({ (my_str: String) -> Bool in
        return my_str.unicodeScalars.reduce(into: true, { (acc, ch) in
            if let head = my_str.unicodeScalars.first, ch == head {
                acc = uppers.contains(ch) && acc
            } else {
                acc = lowers.contains(ch) && acc
            }
        })
    })
}

func longest_string1(_ lst: [String]) -> String {
    return lst.reduce("", { (acc: String, curr: String) -> String in
        return acc.count >= curr.count ? acc : curr
    })
}

func longest_string2(_ lst: [String]) -> String {
    return lst.reduce("", { (acc: String, curr: String) -> String in
        return acc.count > curr.count ? acc : curr
    })
}

func longest_string3(_ lst: [String]) -> String {
    return ""
}

func longest_string4(_ lst: [String]) -> String {
    return ""
}

func longest_captitalized_words(_ lst: [String]) -> String {
    return (only_captials >>> longest_string1)(lst)
}

func rev_string(_ str: String) -> String {
    return String(str.reversed())
}

func first_answer<T>(_ lst: [T], f: ([T]) -> T?) -> T {
    func aux(arr: [T], acc: T?) -> T {
        switch (f(arr), acc) {
        case let (.some(x), _):
            return x
        case let (.none, (.some(head), tail)):
            return aux(arr: tail, acc: head)
        case let (.none, (.none, tail)):
            return aux(arr: tail, acc: acc)
        }
    }
    return aux(arr: lst, acc: .none)
}

func all_answers<T>(_ lst: [T]) -> [T]? {
    return []
}

indirect enum pattern {
    case Wildcard
    case Variable(String)
    case UnitP
    case ConstP(Int)
    case TupleP([pattern])
    case ConstructorP((String, pattern))
}

indirect enum valu {
    case Const(Int)
    case Unit
    case Tuple([valu])
    case Constructor((String, valu))
}

func count_wildcards(_ lst: [pattern]) -> Int {
    return 0
}

func count_some_var(_ v: String, _ pat: pattern) -> Int {
    return 0
}

func check_pat(_ p1: pattern) -> Bool {
    return true
}


func match(_ p1: valu, _ p2: pattern) -> [(String, valu)]? {
    return []
}

func first_match(_ v: valu, _ lst: [pattern]) -> [(String, valu)]? {
    return []
}

