//
//  hw3test.swift
//  testing
//
//  Created by Matthew on 2018-11-09.
//  Copyright © 2018 Matthew Paletta. All rights reserved.
//

import XCTest

class hw3test: XCTestCase {
    
    let words = ["This","the","A","Hello","World","not"]
    
    // MARK: Question 1
    func test_only_captials1() {
        XCTAssertEqual(only_captials(words), ["This","A","Hello","World"])
    }
    
    func test_only_captials2() {
        XCTAssertEqual(only_captials(["A","B","C"]), ["A","B","C"])
    }
    
    func test_only_captials3() {
        XCTAssertEqual(only_captials([]), [])
    }
    
    func test_only_captials4() {
        XCTAssertEqual(only_captials(["Mexico","Ottawa"]), ["Mexico", "Ottawa"])
    }
    
    func test_only_captials5() {
        XCTAssertEqual(only_captials(["vancouver","Ottawa","Victoria"]), ["Ottawa", "Victoria"])
    }
    
    let lwords = ["This","the","A","Hello","World","not","long string","loooong string"]
    let swords = ["the","not","cat","dog"] // check first/last etc
    
    // MARK: Question 2
    func test_longest_string11() {
        XCTAssertEqual(longest_string1(lwords), "loooong string")
    }
    
    func test_longest_string12() {
        XCTAssertEqual(longest_string1(swords), "the")
    }
    
    func test_longest_string13() {
        XCTAssertEqual(longest_string1(["A","bc","C"]), "bc")
    }
    
    func test_longest_string14() {
        XCTAssertEqual(longest_string1(["A","bc","C", "de", "x"]), "bc")
    }
    
    func test_longest_string15() {
        XCTAssertEqual(longest_string1(["Mexico","Ottawa"]), "Mexico")
    }
    
    func test_longest_string16() {
        XCTAssertEqual(longest_string1(["vancouver","Ottawa","Victoria"]), "vancouver")
    }
    
    func test_longest_string17() {
        XCTAssertEqual(longest_string1([]), "")
    }
    
    // MARK: Question 3
    func test_longest_string21() {
        XCTAssertEqual(longest_string2(lwords), "loooong string")
    }
    
    func test_longest_string22() {
        XCTAssertEqual(longest_string2(swords), "the")
    }
    
    func test_longest_string23() {
        XCTAssertEqual(longest_string2(["A","bc","C"]), "bc")
    }
    
    func test_longest_string24() {
        XCTAssertEqual(longest_string2(["A","bc","C", "de", "x"]), "bc")
    }
    
    func test_longest_string25() {
        XCTAssertEqual(longest_string2(["Mexico","Ottawa"]), "Mexico")
    }
    
    func test_longest_string26() {
        XCTAssertEqual(longest_string2(["vancouver","Ottawa","Victoria"]), "vancouver")
    }
    
    func test_longest_string27() {
        XCTAssertEqual(longest_string2([]), "")
    }
    
    // MARK: Question 4
    func test_longest_string31() {
        XCTAssertEqual(longest_string3(lwords), "loooong string")
    }
    
    func test_longest_string32() {
        XCTAssertEqual(longest_string3(swords), "the")
    }
    
    func test_longest_string33() {
        XCTAssertEqual(longest_string3(["A","bc","C"]), "bc")
    }
    
    func test_longest_string34() {
        XCTAssertEqual(longest_string3(["A","bc","C", "de", "x"]), "bc")
    }
    
    func test_longest_string35() {
        XCTAssertEqual(longest_string3(["Mexico","Ottawa"]), "Mexico")
    }
    
    func test_longest_string36() {
        XCTAssertEqual(longest_string3(["vancouver","Ottawa","Victoria"]), "vancouver")
    }
    
    func test_longest_string37() {
        XCTAssertEqual(longest_string3([]), "")
    }
    
    // MARK: Question 5
    func test_longest_string41() {
        XCTAssertEqual(longest_string4(lwords), "loooong string")
    }
    
    func test_longest_string42() {
        XCTAssertEqual(longest_string4(swords), "the")
    }
    
    func test_longest_string43() {
        XCTAssertEqual(longest_string4(["A","bc","C"]), "bc")
    }
    
    func test_longest_string44() {
        XCTAssertEqual(longest_string4(["A","bc","C", "de", "x"]), "bc")
    }
    
    func test_longest_string45() {
        XCTAssertEqual(longest_string4(["Mexico","Ottawa"]), "Mexico")
    }
    
    func test_longest_string46() {
        XCTAssertEqual(longest_string4(["vancouver","Ottawa","Victoria"]), "vancouver")
    }
    
    func test_longest_string47() {
        XCTAssertEqual(longest_string4([]), "")
    }
    
    // MARK: Question 6
    func test_longest_capitalized1() {
        XCTAssertEqual(longest_captitalized_words(words), "Hello")
    }
    
    func test_longest_capitalized2() {
        XCTAssertEqual(longest_captitalized_words([]), "")
    }
    
    func test_longest_capitalized3() {
        XCTAssertEqual(longest_captitalized_words(["vancouver","Ottawa","Victoria","Guatemala"]), "Guatemala")
    }
    
    func test_longest_capitalized4() {
        XCTAssertEqual(longest_captitalized_words(["then","The","To","testing"]), "The")
    }
    
    func test_longest_capitalized5() {
        XCTAssertEqual(longest_captitalized_words(["then","The","To","Cat","testing"]), "The")
    }
    
    func test_longest_capitalized6() {
        XCTAssertEqual(longest_captitalized_words(["then","the","to","testing"]), "")
    }
    
    
    // MARK: Question 7
    func test_rev_string1() {
        XCTAssertEqual(rev_string("Hello World!"), "!dlroW olleH")
    }
    
    func test_rev_string2() {
        XCTAssertEqual(rev_string("canada"), "adanac")
    }
    
    func test_rev_string3() {
        XCTAssertEqual(rev_string("anna"), "anna")
    }
    
    func test_rev_string4() {
        XCTAssertEqual(rev_string(""), "")
    }
    
    // MARK: Question 8
    func test_first_answer1() {
        XCTAssertEqual(first_answer([1, 1, 4, 3]), 4)
    }
    
    func test_first_answer2() {
        XCTAssertEqual(first_answer([1,2,3,4,5]), 4)
    }
    
    func test_first_answer3() {
        XCTAssertEqual(first_answer([1,2,3,4,5]), 1)
    }
    
    func test_first_answer4() {
        XCTAssertEqual(first_answer([1,2,3,4,5]), 1)
    }
    
    func test_first_answer5() {
        XCTAssertEqual(first_answer([1,1,5,3]), 10)
    }
    
    func test_first_answer6() {
        XCTAssertEqual(first_answer(["this", "is", "the", "end", "of", "the", "world"]), "the")
    }
    
    // MARK: Question 9
    func test_all_answers1() {
        
    }
}
