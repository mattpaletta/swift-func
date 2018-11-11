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
        XCTAssertEqual(all_answers([1, 2, 3]), [1, 2, 3, 1, 2, 3, 1, 2, 3])
    }
    
    func test_all_answers2() {
        XCTAssertEqual(all_answers([1, 2, 3]), [1, 1, 1])
    }
    
    func test_all_answers3() {
        XCTAssertEqual(all_answers([1, 2, 3]), [1, 2, 3])
    }
    
    func test_all_answers4() {
        XCTAssertNil(all_answers([2, 3, 4, 5, 6, 7]))
    }
    
    func test_all_answers5() {
        XCTAssertEqual(all_answers([1, 1, 1, 1, 1]), [1, 1, 1, 1, 1])
    }
    
    func test_all_answers6() {
        XCTAssertNil(all_answers([1,2,1,2,1,2]))
    }
    
    func test_all_answers7() {
        let x: [Int] = []
        XCTAssertEqual(all_answers(x), x)
    }

    // MARK: Question 10
    func test_count_wildcards1() {
        XCTAssertEqual(count_wildcards([.Wildcard]), 1)
    }
    
    func test_count_wildcards2() {
        XCTAssertEqual(count_wildcards([.UnitP]), 0)
    }
    
    func test_count_wildcards3() {
        XCTAssertEqual(count_wildcards([.ConstP(1)]), 0)
    }
    
    func test_count_wildcards4() {
        XCTAssertEqual(count_wildcards([.TupleP([])]), 0)
    }
    
    func test_count_wildcards5() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard])]), 1)
    }
    
    func test_count_wildcards6() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard, .UnitP, .Variable("x")])]), 1)
    }
    
    func test_count_wildcards7() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard, .Wildcard, .Variable("xy")])]), 2)
    }
    
    func test_count_wildcards8() {
        XCTAssertEqual(count_wildcards([.TupleP([.TupleP([.Wildcard, .Wildcard])])]), 2)
    }
    
    func test_count_wildcards9() {
        XCTAssertEqual(count_wildcards([.TupleP([.ConstructorP(("a", .Wildcard)), .TupleP([.Wildcard])])]), 2)
    }
    
    // MARK: Question 11
    func test_count_variables_and_wildcards1() {
        XCTAssertEqual(count_wildcards([.Wildcard]), 1)
    }
    
    func test_count_variables_and_wildcards2() {
        XCTAssertEqual(count_wildcards([.UnitP]), 0)
    }
    
    func test_count_variables_and_wildcards3() {
        XCTAssertEqual(count_wildcards([.ConstP(1)]), 0)
    }
    
    func test_count_variables_and_wildcards4() {
        XCTAssertEqual(count_wildcards([.TupleP([])]), 0)
    }
    
    func test_count_variables_and_wildcards5() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard])]), 1)
    }
    
    func test_count_variables_and_wildcards6() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard, .UnitP, .Variable("abc")])]), 4)
    }
    
    func test_count_variables_and_wildcards7() {
        XCTAssertEqual(count_wildcards([.TupleP([.Wildcard, .Wildcard, .Variable("xy")])]), 4)
    }
    
    func test_count_variables_and_wildcards8() {
        XCTAssertEqual(count_wildcards([.TupleP([.TupleP([.Wildcard, .Wildcard, .Variable("This is the sea")])])]), 17)
    }
    
    func test_count_variables_and_wildcards9() {
        XCTAssertEqual(count_wildcards([.TupleP([.ConstructorP(("a", .Wildcard)), .TupleP([.Wildcard])])]), 2)
    }
    
    // Question 12
    func test_count_some_var1() {
        XCTAssertEqual(count_some_var("test", .TupleP([.TupleP([.Wildcard, .UnitP, .Variable("test"), .Variable("test")])])), 2)
    }
    
    func test_count_some_var2() {
        XCTAssertEqual(count_some_var("test", .TupleP([.TupleP([.Wildcard, .UnitP, .Variable("te")])])), 0)
    }
    
    func test_count_some_var3() {
        XCTAssertEqual(count_some_var("test", .TupleP([.TupleP([.Wildcard, .UnitP, .Variable("test")])])), 1)
    }
    
    func test_check_pat1() {
        XCTAssert(check_pat(.TupleP([.Wildcard,
                                          .Variable("cat"),
                                          .Variable("pp"),
                                          .TupleP([.Variable("tt")]),
                                          .Wildcard,
                                          .ConstP(3),
                                          .ConstructorP(("cony",
                                                         .Variable("pp")))])))
    }
    
    func test_check_pat2() {
        XCTAssert(check_pat(.TupleP([.Variable("cat"),
                                     .ConstructorP(("cat",
                                                    .Wildcard)),
                                     .ConstructorP(("cony",
                                                    .Variable("pp")))])))
    }
    
    func test_check_pat3() {
        XCTAssert(check_pat(.TupleP([.Wildcard,
                                     .Variable("cat"),
                                     .Variable("pat"),
                                     .TupleP([.Variable("tt")]),
                                     .Wildcard,
                                     .ConstP(3), .ConstructorP(("tt", .Variable("pq")))])))
    }
    
    func test_check_pat4() {
        XCTAssert(check_pat(.TupleP([.Wildcard,
                                     .Variable("cat"),
                                     .Variable("pp"),
                                     .TupleP([.Variable("tt")]),
                                     .Wildcard,
                                     .ConstP(3), .ConstructorP(("cony", .Variable("test")))])))
    }
    
    // Question 13
    func test_match1() {
        XCTAssertEqual(match(.Unit, .UnitP)?.count, 0)
    }
    
    func test_match2() {
        XCTAssertNil(match(.Unit, .Variable("cat")))
    }
    
    func test_match3() {
        XCTAssertNil(match(.Unit, .ConstP(3)))
    }
    
    func test_match4() {
        XCTAssertNil(match(.Tuple([]), .TupleP([.Wildcard])))
    }
    
    func test_match5() {
        XCTAssertNil(match(.Tuple([.Unit]), .TupleP([])))
    }
    
    func test_match6() {
        XCTAssertNil(match(.Tuple([.Unit]), .Variable("cat")))
    }
    
    func test_match7() {
        XCTAssertNil(match(.Tuple([.Unit]), .TupleP([.Variable("cat")])))
    }
    
    func test_match8() {
        XCTAssertNil(match(.Tuple([.Unit, .Const(8)]), .TupleP([.Variable("cat"), .ConstP(3)])))
    }
    
    func test_match9() {
        XCTAssertNil(match(.Tuple([.Unit, .Const(8)]), .TupleP([.Variable("cat"), .Variable("dog")])))
    }
    
    func test_match10() {
        XCTAssertNil(match(.Tuple([.Unit, .Tuple([.Unit, .Unit])]),
                           .TupleP([.Variable("cat"), .TupleP([.Variable("dog"), .Variable("rat")])])))
    }
    
    func test_match11() {
        XCTAssertNil(match(.Constructor(("mat", .Unit)), .ConstructorP(("hat", .Variable("cat")))))
    }
    
    func test_match12() {
        XCTAssertNil(match(.Constructor(("dog", .Unit)), .ConstructorP(("dog", .Variable("cat")))))
    }
    
    func test_match13() {
        XCTAssertNil(match(.Tuple([.Const(17), .Unit, .Const(7), .Constructor(("zoe", .Const(7))), .Constructor(("zoe", .Constructor(("zoe", .Const(7)))))]),
                           .TupleP([.Wildcard, .Wildcard])))
    }
    
    func test_match14() {
        XCTAssertNil(match(.Const(7), .Wildcard))
    }
    
    func test_match15() {
        XCTAssertNil(match(.Unit, .Wildcard))
    }
    
    func test_match16() {
        XCTAssertNil(match(.Tuple([.Const(7)]), .Wildcard))
    }
    
    func test_match17() {
        XCTAssertNil(match(.Constructor(("cat", .Const(7))), .Wildcard))
    }
    
    func test_match18() {
        XCTAssertNil(match(.Const(7), .Variable("Zoe")))
    }
    
    func test_match19() {
        XCTAssertNil(match(.Unit, .Variable("chopsticks")))
    }
    
    func test_match20() {
        XCTAssertNil(match(.Unit, .UnitP))
    }
    
    func test_match21() {
        XCTAssertNil(match(.Const(7), .UnitP))
    }
    
    func test_match22() {
        XCTAssertNil(match(.Const(7), .ConstP(7)))
    }
    
    func test_match23() {
        XCTAssertNil(match(.Const(7), .ConstP(8)))
    }
    
    func test_match24() {
        XCTAssertNil(match(.Constructor(("Cat", .Const(7))), .ConstructorP(("Cat", .Wildcard))))
    }
    
    func test_match25() {
        XCTAssertNil(match(.Constructor(("Dog", .Const(7))), .ConstructorP(("Cat", .Wildcard))))
    }
    
    func test_match26() {
        XCTAssertNil(match(.Constructor(("Cat", .Const(7))), .ConstructorP(("Cat", .UnitP))))
    }
    
    func test_match27() {
        XCTAssertNil(match(.Constructor(("Cat", .Const(7))), .ConstructorP(("Cat", .Variable("dog")))))
    }
    
    func test_match28() {
        XCTAssertNil(match(.Tuple([.Const(7)]), .TupleP([.ConstP(7)])))
    }
    
    func test_match29() {
        XCTAssertNil(match(.Tuple([.Const(7)]), .TupleP([.ConstP(7), .ConstP(7)])))
    }
    
    func test_match30() {
        XCTAssertNil(match(.Tuple([.Const(7), .Const(6), .Unit, .Const(8)]),
                           .TupleP([.ConstP(7), .Variable("cat"), .Wildcard, .ConstP(8)])))
    }
    
    func test_match31() {
        XCTAssertNil(match(.Tuple([.Const(7), .Const(6), .Unit, .Const(7)]),
                           .TupleP([.Variable("a"), .Variable("ab"), .Variable("abc"), .Variable("abcd")])))
    }
    
    // MARK: Question 14
    func test_first_match1() {
        XCTAssertNil(first_match(.Unit, [.UnitP]))
    }
    
    func test_first_match2() {
        XCTAssertNil(first_match(.Unit, [.Variable("cat")]))
    }
    
    func test_first_match3() {
        XCTAssertNil(first_match(.Unit, [.ConstP(3)]))
    }
    
    func test_first_match4() {
        XCTAssertNil(first_match(.Tuple([]), [.Wildcard]))
    }
    
    func test_first_match5() {
        XCTAssertNil(first_match(.Tuple([.Unit]), [.TupleP([])]))
    }
    
    func test_first_match6() {
        XCTAssertNil(first_match(.Tuple([.Unit]), [.TupleP([.Variable("cat")])]))
    }
    
    func test_first_match7() {
        XCTAssertNil(first_match(.Tuple([.Unit, .Const(8)]), [.TupleP([.Variable("cat"), .Variable("dog")])]))
    }
    
    func test_first_match8() {
        XCTAssertNil(first_match(.Constructor(("mat", .Unit)), [.ConstructorP(("hat", .Variable("cat")))]))
    }
    
    func test_first_match9() {
        XCTAssertNil(first_match(.Constructor(("dog", .Unit)), [.ConstructorP(("dog", .Variable("cat")))]))
    }
    
    func test_first_match10() {
        XCTAssertNil(first_match(.Const(8), [.Wildcard]))
    }
    
    func test_first_match11() {
        XCTAssertNil(first_match(.Unit, [.Wildcard]))
    }
    
    func test_first_match12() {
        XCTAssertNil(first_match(.Tuple([.Const(7)]), [.Wildcard]))
    }
    
    func test_first_match13() {
        XCTAssertNil(first_match(.Unit, [.Variable("chopsticks")]))
    }
    
    func test_first_match14() {
        XCTAssertNil(first_match(.Unit, [.UnitP]))
    }
    
    func test_first_match15() {
        XCTAssertNil(first_match(.Const(7), [.UnitP]))
    }
    
    func test_first_match16() {
        XCTAssertNil(first_match(.Const(7), [.ConstP(7)]))
    }
    
    func test_first_match17() {
        XCTAssertNil(first_match(.Const(7), [.ConstP(8)]))
    }
    
    func test_first_match18() {
        XCTAssertNil(first_match(.Constructor(("Cat", .Const(7))), [.ConstructorP(("Cat", .Variable("dog")))]))
    }
    
    func test_first_match19() {
        XCTAssertNil(first_match(.Tuple([.Const(7)]), [.TupleP([.ConstP(7)])]))
    }
    
    func test_first_match20() {
        XCTAssertNil(first_match(.Tuple([.Const(7)]), [.TupleP([.ConstP(7), .ConstP(7)])]))
    }
    
    func test_first_match21() {
        XCTAssertNil(first_match(.Tuple([.Const(6), .Const(7), .Const(8)]),
                                 [.TupleP([.ConstP(7), .Variable("cat"), .Wildcard, .ConstP(8)])]))
    }
    
    func test_first_match22() {
        XCTAssertNil(first_match(.Tuple([.Const(7), .Const(7), .Unit, .Const(8)]),
                                 [.TupleP([.Variable("a"), .Variable("ab"), .Variable("abc"), .Variable("abcd")])]))
    }
    
}
