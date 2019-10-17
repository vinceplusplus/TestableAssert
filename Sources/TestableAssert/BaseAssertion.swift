import Foundation
import XCTest
import TestableAssertSupport

func getFunctionName(_ declaration: String) -> String {
  if let index = declaration.firstIndex(of: "(") {
    return String(declaration[..<index])
  } else {
    return declaration
  }
}

func expectFailure(assertFuncs: [AssertFunc],
                   functionName: String,
                   passingMessage: String,
                   expressionClosure: @escaping @autoclosure () -> Void,
                   expectedMessage: @autoclosure () -> String?,
                   file: StaticString,
                   line: UInt) {
  var didFail = false
  var messageOnFail = ""
  assertFuncs.forEach {
    switch $0 {
    case .assert:
      AssertFuncBodies.assert = { condition, message, _, _ in
        if !condition() {
          didFail = true
          messageOnFail = message()
          Thread.exit()
        }
      }
    case .assertionFailure:
      AssertFuncBodies.assertionFailure = { message, _, _ in
        didFail = true
        messageOnFail = message()
        Thread.exit()
        Swift.assertionFailure()
      }
    case .precondition:
      AssertFuncBodies.precondition = { condition, message, _, _ in
        if !condition() {
          didFail = true
          messageOnFail = message()
          Thread.exit()
        }
      }
    case .preconditionFailure:
      AssertFuncBodies.preconditionFailure = { message, _, _ in
        didFail = true
        messageOnFail = message()
        Thread.exit()
        Swift.preconditionFailure()
      }
    case .fatalError:
      AssertFuncBodies.fatalError = { message, _, _ in
        didFail = true
        messageOnFail = message()
        Thread.exit()
        Swift.fatalError()
      }
    }
  }

  let thread = Thread {
    expressionClosure()
  }
  thread.start()

  while !thread.isFinished {
    Thread.sleep(forTimeInterval: 0.001)
  }

  assertFuncs.forEach {
    switch $0 {
    case .assert:
      AssertFuncBodies.assert = Swift.assert
    case .assertionFailure:
      AssertFuncBodies.assertionFailure = Swift.assertionFailure
    case .precondition:
      AssertFuncBodies.precondition = Swift.precondition
    case .preconditionFailure:
      AssertFuncBodies.preconditionFailure = Swift.preconditionFailure
    case .fatalError:
      AssertFuncBodies.fatalError = Swift.fatalError
    }
  }

  if didFail {
    if let message = expectedMessage(), message != messageOnFail {
      XCTFail("\(functionName): expected \"\(message)\" but got \"\(messageOnFail)\"", file: file, line: line)
    }
  } else if !didFail {
    XCTFail("\(functionName): \(passingMessage)", file: file, line: line)
  }
}

