//
//  hw2test.swift
//  testing
//
//  Created by Matthew on 2018-11-09.
//  Copyright © 2018 Matthew Paletta. All rights reserved.
//

import XCTest

class hw2test: XCTestCase {

    // MARK: Question 1
    func test_all_except_option1() {
        XCTAssertNil(all_except_option("3", lst: ["4","9","10"]))
    }
    
    func test_all_except_option2() {
        XCTAssertEqual(all_except_option("3", lst: ["4","9","3","10"]), ["4", "9", "10"])
    }
    
    func test_all_except_option3() {
        XCTAssertNil(all_except_option("3", lst: []))
    }
    
    func test_all_except_option4() {
        XCTAssertEqual(all_except_option("3", lst: ["3","4","9","10"]), ["4","9","10"])
    }
    
    func test_all_except_option5() {
        XCTAssertEqual(all_except_option("3", lst: ["4","9","10","3"]), ["4","9","10"])
    }
    
    func test_all_except_option6() {
        XCTAssertEqual(all_except_option("3", lst: ["3"]), [])
    }
    
    // MARK: Question 2
    func test_get_substitutions11() {
        XCTAssertEqual(get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                                          str: "Fred"), ["Fredrick","Freddie","F"])
    }
    
    func test_get_substitutions12() {
        XCTAssertEqual(get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
                                          str: "Jeff"), ["Jeffrey","Geoff","Jeffrey"])
    }
    
    func test_get_substitutions13() {
        XCTAssertEqual(get_substitutions1([["Neo","New"],["Panzer","Tank","Sherman"],["Tank", "Container"],["Epoch","Era"]],
                                          str: "Tank"), ["Panzer","Sherman","Container"])
    }
    
    func test_get_substitutions14() {
        XCTAssertEqual(get_substitutions1([["Neo","New", "Nuovo"],["Panzer","Tank","Sherman"],["Tank", "Container"],["Epoch","Era"]],
                                          str: "Neo"), ["New","Nuovo"])
    }
    
    // MARK: Question 3
    func test_get_substitutions21() {
        XCTAssertEqual(get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                                          str: "Fred"), ["Fredrick","Freddie","F"])
    }
    
    func test_get_substitutions22() {
        XCTAssertEqual(get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
                                          str: "Jeff"), ["Jeffrey","Geoff","Jeffrey"])
    }
    
    func test_get_substitutions23() {
        XCTAssertEqual(get_substitutions2([["Neo","New"],["Panzer","Tank","Sherman"],["Tank", "Container"],["Epoch","Era"]],
                                          str: "Tank"), ["Panzer","Sherman","Container"])
    }
    
    func test_get_substitutions24() {
        XCTAssertEqual(get_substitutions2([["Neo","New", "Nuovo"],["Panzer","Tank","Sherman"],["Tank", "Container"],["Epoch","Era"]],
                                          str: "Neo"), ["New","Nuovo"])
    }
    
    // MARK: Question 4
    // Xcode does not support AssertEqual on named tuples :(
    func test_similar_names1() {
        XCTAssertEqual(similar_names([["Thomas", "Neo"], ["Batman", "Hulk","Bruce"], ["Spiderman", "Peter"]],
                                     name: (first: "Bruce", middle: "(whoknows)", last: "Wayne")).count, 3)
    }
    
    func test_similar_names2() {
        XCTAssertEqual(similar_names([["Fred","Fredrick"],
                                      ["Elizabeth","Betty"],
                                      ["Freddie","Fred","F"]],
                                     name: (first: "Fred", middle: "W", last: "Smith")).count, 4)
    }
    
    
    let ClubAce = card(.Clubs, .Ace)
    let DiamondsJack = card(.Diamonds, .Jack)
    let Hearts10 = card(.Hearts, .Num(10))
    let Spades5 = card(.Spades, .Num(5))
    let DiamondsAce = card(.Diamonds, .Ace)
    let Diamonds10 = card(.Diamonds, .Num(10))
    
    // MARK: Question 5
    func test_card_color1() {
        XCTAssertEqual(card_color(c: ClubAce), .Black)
    }
    
    func test_card_color2() {
        XCTAssertEqual(card_color(c: DiamondsJack), .Red)
    }
    
    func test_card_color3() {
        XCTAssertEqual(card_color(c: Hearts10), .Red)
    }
    
    func test_card_color4() {
        XCTAssertEqual(card_color(c: Spades5), .Black)
    }
    
    // MARK: Question 6
    func test_card_value1() {
        XCTAssertEqual(card_value(c: ClubAce), 11)
    }
    
    func test_card_value2() {
        XCTAssertEqual(card_value(c: DiamondsJack), 10)
    }
    
    func test_card_value3() {
        XCTAssertEqual(card_value(c: Hearts10), 10)
    }
    
    func test_card_value4() {
        XCTAssertEqual(card_value(c: Spades5), 5)
    }
    
    func test_card_value5() {
        XCTAssertEqual(card_value(c: card(.Spades, .Queen)), 10)
    }
    
    func test_card_value6() {
        XCTAssertEqual(card_value(c: card(.Spades, .King)), 10)
    }
    
    let cards1: [card] = [card(.Clubs, .Ace), card(.Diamonds, .Num(10)), card(.Spades, .Num(4)), card(.Clubs, .Num(4))]
    let cards2: [card] = []
    let cards3: [card] = [card(.Clubs, .Ace), card(.Diamonds, .Num(10)), card(.Spades, .Num(5)), card(.Clubs, .Num(9))]
    let cards4: [card] = [card(.Clubs, .Ace), card(.Clubs, .Num(10)), card(.Spades, .Num(5)), card(.Clubs, .Num(2))]
    let cards5: [card] = [card(.Diamonds, .Ace), card(.Diamonds, .Num(10)), card(.Diamonds, .Queen), card(.Diamonds, .Jack), card(.Diamonds, .King)]
    
    // MARK: Question 7
    func test_remove_card1() {
        XCTAssertEqual(remove_card(cards3, c: ClubAce, e: .NotFound).count, 3)
    }
    
    func test_remove_card2() {
        XCTAssertEqual(remove_card(cards1, c: card(.Spades, .Num(4)), e: .NotFound).count, 3)
    }
    
    func test_remove_card3() {
        XCTAssertEqual(remove_card(cards3, c: card(.Clubs, .Num(9)), e: .NotFound).count, 3)
    }
    
    func test_remove_card4() {
        XCTAssertEqual(remove_card(cards5, c: DiamondsAce, e: .NotFound).count, 4)
    }
    
    func test_remove_card5() {
        XCTAssertEqual(remove_card(cards2, c: ClubAce, e: .NotFound).count, 0)
    }
    
    // MARK: Question 8
    func test_all_same_color1() {
        XCTAssertFalse(all_same_colour(cards1))
    }
    
    func test_all_same_color2() {
        XCTAssert(all_same_colour(cards2))
    }
    
    func test_all_same_color3() {
        XCTAssertFalse(all_same_colour(cards3))
    }
    
    func test_all_same_color4() {
        XCTAssert(all_same_colour(cards4))
    }
    
    func test_all_same_color5() {
        XCTAssert(all_same_colour(cards5))
    }
    
    // MARK: Question 9
    func test_sum_cards1() {
        XCTAssertEqual(sum_cards(cards1), 29)
    }
    
    func test_sum_cards2() {
        XCTAssertEqual(sum_cards(cards2), 0)
    }
    
    func test_sum_cards3() {
        XCTAssertEqual(sum_cards(cards3), 35)
    }
    
    func test_sum_cards4() {
        XCTAssertEqual(sum_cards(cards4), 28)
    }
    
    func test_sum_cards5() {
        XCTAssertEqual(sum_cards(cards5), 51)
    }
    
    // MARK: Question 10
    func test_score1() {
        XCTAssertEqual(score(cards1, goal: 1), 28 * 2)
    }
    
    func test_score2() {
        XCTAssertEqual(score(cards2, goal: 14), 7)
    }
    
    func test_score3() {
        XCTAssertEqual(score(cards3, goal: 35), 0)
    }
    
    func test_score4() {
        XCTAssertEqual(score(cards4, goal: 28), 0)
    }
    
    func test_score5() {
        XCTAssertEqual(score([card(.Spades, .Num(2))], goal: 28), 13)
    }
    
    func test_score6() {
        XCTAssertEqual(score([DiamondsAce, Diamonds10], goal: 20), 1)
    }
    
    // MARK: Question 11
    func test_officiate1() {
        XCTAssertEqual(officiate(cards3, moves: [], goal: 10), 5)
    }
    
    func test_officiate2() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw], goal: 10), 1)
    }
    
    func test_officiate3() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw], goal: 5), 6)
    }
    
    func test_officiate4() {
        XCTAssertEqual(officiate(cards5, moves: [.Draw, .Draw], goal: 0), 11)
    }
    
    func test_officiate5() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw, .Draw], goal: 15), 12)
    }
    
    func test_officiate6() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw, .Draw, .Draw], goal: 15), 12)
    }
    
    func test_officiate7() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw, .Draw, .Draw, .Draw], goal: 35), 0)
    }
    
    func test_officiate8() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw, .Draw, .Draw, .Discard(card(.Spades, .Num(5)))], goal: 15), 12)
    }
    
    func test_officiate9() {
        XCTAssertEqual(officiate(cards5, moves: [.Draw, .Draw, .Draw, .Discard(card(.Spades, .Num(2)))], goal: 45), 7)
    }
    
    func test_officiate10() {
        XCTAssertEqual(officiate(cards2, moves: [.Draw], goal: 10), 5)
    }
    
    func test_officiate11() {
        XCTAssertEqual(officiate(cards2, moves: [.Discard(card(.Spades, .Ace))], goal: 10), 5)
    }
    
    func test_officiate12() {
        XCTAssertEqual(officiate(cards3, moves: [.Draw, .Discard(card(.Spades, .Num(7)))], goal: 10), 1)
    }
    
    func test_officiate13() {
        XCTAssertEqual(officiate([(.Clubs,.Queen),(.Diamonds,.Ace), (.Hearts,.Ace), (.Diamonds,.Ace)], moves: [.Draw,.Discard(card(.Clubs,.Queen)), .Draw, .Draw], goal: 11), 0)
    }
    
    func test_officiate14() {
        XCTAssertEqual(officiate([(.Clubs,.Queen),(.Diamonds,.Ace),(.Hearts,.Ace),(.Diamonds,.Ace)], moves: [.Draw,.Discard(card(.Clubs,.Queen)),.Draw,.Draw],goal: 22), 6)
    }
    
    func test_officiate15() {
        XCTAssertEqual(officiate([(.Clubs,.Queen),(.Diamonds,.Ace),(.Hearts,.Ace),(.Diamonds,.Ace)], moves: [.Draw, .Discard(card(.Clubs, .Queen)), .Draw, .Draw], goal: 30), 10)
    }
}
