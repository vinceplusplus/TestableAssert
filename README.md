TestableAssert
==============
Use TestableAssert to test if assertions in your code can catch programming errors properly
```swift
// TestLibrary.swift

func testWithAssert() {
  assert(false, "assert() message")
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

// Tests.swift

expectFailedAssertion(testWithAssert())
expectFailedPrecondition(testWithPreconditionFailure(), "preconditionFailure() message")
expectFatalError(testWithFatalError())
expectAnyFailure(testWithRandomFailure())
```

# Installation
### Xcode
Follow the [official guide](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to add to your Xcode project
1. Add the following package to the target you want to test:
    ```
    https://github.com/vinceplusplus/TestableAssertSupport
    ```
2. Add the following package to the unit test target:
    ```
    https://github.com/vinceplusplus/TestableAssert
    ```
3. Add the following configuration file to override built-in assertion functions to the target you want to test:
    ```swift
    // TestableAssertSupport+Configuration.swift

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
    ```
### Swift Package Manager
1. Add the following package dependencies:
    ```swift
    .package(url: "https://github.com/vinceplusplus/TestableAssertSupport", from: "1.0.0"),
    .package(url: "https://github.com/vinceplusplus/TestableAssert", from: "1.0.0"),
    ```
2. Add `TestableAssertSupport` as a dependency to the target you want to test
3. Add `TestableAssert` as a dependency to the test target that tests the above target
4. Add the following configuration file to override built-in assertion functions to the target you want to test:
    ```swift
    // TestableAssertSupport+Configuration.swift

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
    ```

