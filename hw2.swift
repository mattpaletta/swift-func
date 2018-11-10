func all_except_option(_ str: String, lst: [String]) -> [String]? {
    func does_contain(s: String, lst: [String]) -> [String] {
        guard let head = lst.first else { return [] }
        switch lst {
        case _ where head == str:
            return does_contain(s: s, lst: Array(lst.dropFirst()))
        default:
            return [head] + does_contain(s: s, lst: Array(lst.dropFirst()))
        }
    }
    let my_list = does_contain(s: str, lst: lst)
    
    switch my_list {
    case _ where my_list.count == lst.count || lst.count == 0:
        return nil
    default:
        return my_list
    }
}

func get_substitutions1(_ lstlst: [[String]], str: String) -> [String] {
    guard let head = lstlst.first else { return [] }
    
    let y = all_except_option(str, lst: head)
    switch y {
    case let y?:
        return y + get_substitutions1(Array(lstlst.dropFirst()), str: str)
    case .none:
        return get_substitutions1(Array(lstlst.dropFirst()), str: str)
    }
}

func get_substitutions2(_ lstlst: [[String]], str: String) -> [String] {
    func aux(_ lst2: [[String]], acc: [String]) -> [String] {
        guard let head = lst2.first else { return acc }
        
        let y = all_except_option(str, lst: head)
        switch y {
        case let y?:
            return aux(Array(lst2.dropFirst()), acc: acc + y)
        case .none:
            return aux(Array(lst2.dropFirst()), acc: acc)
        }
    }
    return aux(lstlst, acc: [])
}

func similar_names(_ lstlst: [[String]], name: (first: String, middle: String, last: String)) -> [(first: String, last: String, middle: String)] {
    func aux(_ lst: [String]) -> [(first: String, last: String, middle: String)] {
        guard let head = lst.first else { return [] }
        switch name {
        case let (_, m, l):
            switch lst {
            case _ where lst.count == 1:
                return [(first: head, last: l, middle: m)]
            default:
                return [(first: head, last: l, middle: m)] + aux(Array(lst.dropFirst()))
            }
        }
    }
    return [name] + aux(get_substitutions2(lstlst, str: name.first))
}

// Setup custom datatypes for questions.
enum suit {
    case Clubs
    case Diamonds
    case Hearts
    case Spades
}
enum rank {
    case Jack
    case Queen
    case King
    case Ace
    case Num(Int)
}
typealias card = (suit, rank)
enum color {
    case Red
    case Black
}

enum move {
    case Discard(card)
    case Draw
}

func == (pattern: card, value: card) -> Bool {
    switch (pattern, value) {
    case let ((_, .Num(i)), (_,.Num(j))):
        return pattern.0 == value.0 && i == j
    case ((_, .Jack), (_,.Jack)):
        return pattern.0 == value.0
    case ((_, .Queen), (_,.Queen)):
        return pattern.0 == value.0
    case ((_, .King), (_,.King)):
        return pattern.0 == value.0
    case ((_, .Ace), (_,.Ace)):
        return pattern.0 == value.0
    default:
        return false
    }
}

func card_color(c: card) -> color {
    switch c {
    case (.Clubs, _):
        return .Black
    case (.Diamonds, _):
        return .Red
    case (.Hearts, _):
        return .Red
    case (.Spades, _):
        return .Black
    }
}

func card_value(c: card) -> Int {
    switch c {
    case (_, .Jack):
        return 10
    case (_, .Queen):
        return 10
    case (_, .King):
        return 10
    case (_, .Ace):
        return 11
    case let (_, .Num(i)):
        return i
    }
}

func remove_card(_ cs: [card], c: card, e: MyError) -> [card] {
    switch cs.match {
    case (.none, _):
        return []
    case let (.some(head), tail) where head == c:
        return tail
    case let (.some(head), tail):
        return [head] + remove_card(tail, c: c, e: e)
    }
}

func all_same_colour(_ cs: [card]) -> Bool {
    func aux(_ c: color, cs2: [card]) -> Bool {
        return cs2.count == 0 ? true : card_color(c: cs2.head!) == c && aux(c, cs2: cs2.tail)
    }
    return cs.count == 0 ? true : aux(card_color(c: cs.head!), cs2: cs)
}


func sum_cards(_ cs: [card]) -> Int {
    func aux(_ cs: [card], acc: Int) -> Int {
        if let head = cs.head {
            return aux(cs.tail, acc: card_value(c: head) + acc)
        } else {
            return acc
        }
    }
    return aux(cs, acc: 0)
}

func score(_ cs: [card], goal: Int) -> Int {
    let sum = sum_cards(cs)
    let preliminary = sum > goal ? (sum - goal) * 2 : (goal - sum)
    return  all_same_colour(cs) ? preliminary / 2 : preliminary
}


func officiate(_ cs: [card], moves: [move], goal: Int) -> Int {
    func update_cards_with_move(move: move, cards: [card]) -> [card] {
        switch move {
        case .Discard(_, _):
            return cards
        case .Draw where cards.isEmpty:
            return []
        case .Draw:
            return cards.tail
        }
    }
    
    func update_hand_with_move(move: move, hand: [card], cards: [card]) -> [card] {
        switch move {
        case let .Discard(c):
            return remove_card(hand, c: c, e: .IllegalMove)
        case .Draw where cards.isEmpty:
            return hand
        case .Draw:
            return [cards.head!] + hand
        }
    }
    
    func next_move(hand: [card], moves: [move], cards: [card]) -> Int {
        if moves.isEmpty {
            return score(hand, goal: goal)
        } else {
            let next_hand = update_hand_with_move(move: moves.head!, hand: hand, cards: cards)
            let next_cards = update_cards_with_move(move: moves.head!, cards: cards)
            if next_hand.isEmpty {
                return score(hand, goal: goal)
            } else if sum_cards(hand) > goal {
                return score(hand, goal: goal)
            } else {
                return next_move(hand: next_hand, moves: moves.tail, cards: next_cards)
            }
        }
    }
    return next_move(hand: [], moves: moves, cards: cs)
}
