// https://app.codility.com/programmers/lessons/7-stacks_and_queues/

import Foundation

var input =  "([)()]"


public struct Stack<T> {
  var array = [T]()
  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var peek: T? {
    return array.last
  }
}

public func solution(_ S : inout String) -> Int {
    let blackets = [
        ")": "(",
        "}": "{",
        "]": "[",
    ]
    var stack = Stack<String>()

    let close = blackets.keys
    let open = blackets.values

    for i in S {
        let processing = i.description
        if open.contains(processing) {
            stack.push(processing)
        }
        if close.contains(processing) {
            if let last = stack.peek, last == blackets[processing] {
                stack.pop()
            }
        }
    }

    return stack.isEmpty ? 1 : 0
}

print(solution(&input))
