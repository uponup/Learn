//
//  Stack.swift
//  Learn
//
//  Created by 龙格 on 2018/12/25.
//  Copyright © 2018年 Paul Gao. All rights reserved.
//

import Foundation

protocol Stack {
    associatedtype Element
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    
    //进栈
    mutating func push(_ newElement: Element)
    //出栈
    mutating func pop() -> Element?
}

struct IntegerStack: Stack {
    typealias Element = Int
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var size: Int {
        return stack.count
    }
    var peek: Element? {
        return stack.last
    }
    
    private var stack = [Element]()
    
    mutating func push(_ newElement: Int) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Int? {
        return stack.popLast()
    }
}
