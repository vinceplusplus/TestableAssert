import XCTest

public func expectFailureByAssert(_ closure: @escaping @autoclosure () -> Void,
                                  _ expectedMessage: @autoclosure () -> String? = .none,
                                  file: StaticString = #file,
                                  line: UInt = #line) {
  expectFailure(assertFuncs: [.assert],
                functionName: getFunctionName(#function),
                passingMessage: "no assert()s failed",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFailureByAssertionFailure(_ closure: @escaping @autoclosure () -> Void,
                                            _ expectedMessage: @autoclosure () -> String? = .none,
                                            file: StaticString = #file,
                                            line: UInt = #line) {
  expectFailure(assertFuncs: [.assertionFailure],
                functionName: getFunctionName(#function),
                passingMessage: "assertionFailure() was not reached",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFailureByPrecondition(_ closure: @escaping @autoclosure () -> Void,
                                        _ expectedMessage: @autoclosure () -> String? = .none,
                                        file: StaticString = #file,
                                        line: UInt = #line) {
  expectFailure(assertFuncs: [.precondition],
                functionName: getFunctionName(#function),
                passingMessage: "no precondition()s failed",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFailureByPreconditionFailure(_ closure: @escaping @autoclosure () -> Void,
                                               _ expectedMessage: @autoclosure () -> String? = .none,
                                               file: StaticString = #file,
                                               line: UInt = #line) {
  expectFailure(assertFuncs: [.preconditionFailure],
                functionName: getFunctionName(#function),
                passingMessage: "preconditionFailure() was not reached",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFatalError(_ closure: @escaping @autoclosure () -> Void,
                             _ expectedMessage: @autoclosure () -> String? = .none,
                             file: StaticString = #file,
                             line: UInt = #line) {
  expectFailure(assertFuncs: [.fatalError],
                functionName: getFunctionName(#function),
                passingMessage: "fatalError() was not reached",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFailedAssertion(_ closure: @escaping @autoclosure () -> Void,
                                  _ expectedMessage: @autoclosure () -> String? = .none,
                                  file: StaticString = #file,
                                  line: UInt = #line) {
  expectFailure(assertFuncs: [.assert, .assertionFailure],
                functionName: getFunctionName(#function),
                passingMessage: "no assertions failed",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectFailedPrecondition(_ closure: @escaping @autoclosure () -> Void,
                                     _ expectedMessage: @autoclosure () -> String? = .none,
                                     file: StaticString = #file,
                                     line: UInt = #line) {
  expectFailure(assertFuncs: [.precondition, .preconditionFailure],
                functionName: getFunctionName(#function),
                passingMessage: "no preconditions failed",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

public func expectAnyFailure(_ closure: @escaping @autoclosure () -> Void,
                             _ expectedMessage: @autoclosure () -> String? = .none,
                             file: StaticString = #file,
                             line: UInt = #line) {
  expectFailure(assertFuncs: [.assert,
                              .assertionFailure,
                              .precondition,
                              .preconditionFailure,
                              .fatalError],
                functionName: getFunctionName(#function),
                passingMessage: "no failure occured",
                expressionClosure: closure(),
                expectedMessage: expectedMessage(),
                file: file,
                line: line)
}

