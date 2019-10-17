func testWithAssert() {
  assert(false, "assert() message")
}

func testWithAssertionFailure() {
  assertionFailure("assertionFailure() message")
}

func testWithPrecondition() {
  precondition(false, "precondition() message")
}

func testWithPreconditionFailure() {
  preconditionFailure("preconditionFailure() message")
}

func testWithFatalError() {
  fatalError("fatalError() message")
}

func testWithRandomFailure() {
  let testFuncs = [
    testWithAssert,
    testWithPreconditionFailure,
    testWithFatalError,
  ]
  guard let testFunc = testFuncs.randomElement() else {
    fatalError()
  }
  
  testFunc()
}

