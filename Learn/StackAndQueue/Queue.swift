//
//  Queue.swift
//  Learn
//
//  Created by 龙格 on 2018/12/25.
//  Copyright © 2018年 Paul Gao. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
}

struct IntegerQueue: Queue {
    typealias Element = Int
    var isEmpty: Bool {
        return right.isEmpty && left.isEmpty
    }
    var size: Int{
        return right.count + left.count
    }
    var peek: Int? {
        return left.isEmpty ? right.first : left.last
    }
    
    private var left: [Element] = []
    private var right: [Element] = []
    
    mutating func enqueue(_ newElement: Int) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}
