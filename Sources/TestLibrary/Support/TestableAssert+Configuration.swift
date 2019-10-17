import TestableAssertSupport

func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
  AssertFuncBodies.assert(condition(), message(), file, line)
}

func assertionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
  AssertFuncBodies.assertionFailure(message(), file, line)
}

func precondition(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
  AssertFuncBodies.precondition(condition(), message(), file, line)
}

func preconditionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) -> Never {
  AssertFuncBodies.preconditionFailure(message(), file, line)
}

func fatalError(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) -> Never {
  AssertFuncBodies.fatalError(message(), file, line)
}

