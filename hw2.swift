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
    case []:
      return nil
    case _ where my_list.count == lst.count:
      return nil
    default:
      return my_list
  }
}

assert(all_except_option("3", lst: ["4","9","10"]) == nil)
assert(all_except_option("3", lst: ["4","9","3","10"])!.count == 3)
