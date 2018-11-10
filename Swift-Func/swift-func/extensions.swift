//
//  extensions.swift
//  swift-func
//
//  Created by Matthew on 2018-11-10.
//  Copyright © 2018 Matthew Paletta. All rights reserved.
//

import Foundation

extension Array {
    var head: Element? {
        return self.first
    }
    
    var tail: Array<Element> {
        return Array(self.dropFirst())
    }
    
    var match: (Element?, Array<Element>) {
        return (self.head, self.tail)
    }
}
