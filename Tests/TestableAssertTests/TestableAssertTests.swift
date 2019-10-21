import XCTest
import TestableAssert
@testable import TestLibrary

final class TestableAssertTests: XCTestCase {
  func testForOneKind() {
    // MARK: - assertions that catch assert()
    expectFailureByAssert({ testWithAssert() })
    expectFailureByAssert({ testWithAssert() }, "assert() message")
    
    // MARK: - assertions that catch assertionFailure()
    expectFailureByAssertionFailure({ testWithAssertionFailure() })
    expectFailureByAssertionFailure({ testWithAssertionFailure() }, "assertionFailure() message")
    
    // MARK: - assertions that catch precondition()
    expectFailureByPrecondition({ testWithPrecondition() })
    expectFailureByPrecondition({ testWithPrecondition() }, "precondition() message")
    
    // MARK: - assertions that catch preconditionFailure()
    expectFailureByPreconditionFailure({ testWithPreconditionFailure() })
    expectFailureByPreconditionFailure({ testWithPreconditionFailure() }, "preconditionFailure() message")
    
    // MARK: - assertions that catch fatalError()
    expectFatalError({ testWithFatalError() })
    expectFatalError({ testWithFatalError() }, "fatalError() message")
  }
  
  func testForMultipleKinds() {
    // MARK: - assertions that catch assert(), assertionFailure()
    expectFailedAssertion({ testWithAssert() })
    expectFailedAssertion({ testWithAssert() }, "assert() message")
    expectFailedAssertion({ testWithAssertionFailure() })
    expectFailedAssertion({ testWithAssertionFailure() }, "assertionFailure() message")
    
    // MARK: - assertions that catch precondition(), preconditionFailure()
    expectFailedPrecondition({ testWithPrecondition() })
    expectFailedPrecondition({ testWithPrecondition() }, "precondition() message")
    expectFailedPrecondition({ testWithPreconditionFailure() })
    expectFailedPrecondition({ testWithPreconditionFailure() }, "preconditionFailure() message")
    
    // MARK: - assertions that catch assert(), assertionFailure, precondition(), preconditionFailure(), fatalError()
    expectAnyFailure({ testWithAssert() })
    expectAnyFailure({ testWithAssert() }, "assert() message")
    expectAnyFailure({ testWithAssertionFailure() })
    expectAnyFailure({ testWithAssertionFailure() }, "assertionFailure() message")
    
    expectAnyFailure({ testWithPrecondition() })
    expectAnyFailure({ testWithPrecondition() }, "precondition() message")
    expectAnyFailure({ testWithPreconditionFailure() })
    expectAnyFailure({ testWithPreconditionFailure() }, "preconditionFailure() message")
    
    expectAnyFailure({ testWithFatalError() })
    expectAnyFailure({ testWithFatalError() }, "fatalError() message")
    
    expectAnyFailure({ testWithRandomFailure() })
  }

  static var allTests = [
    ("testForOneKind", testForOneKind),
    ("testForMultipleKinds", testForMultipleKinds),
  ]
}

