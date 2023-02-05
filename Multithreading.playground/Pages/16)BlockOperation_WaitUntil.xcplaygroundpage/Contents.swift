import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let operationQueue = OperationQueue()

class OperationCancelTest: Operation {
    override func main() {
        if isCancelled {
            print(isCancelled)
            return
        }
        print("Test 1")
        sleep(1)
        
        if isCancelled{
            print(isCancelled)
            return
        }
        print("Test 2")
    }
}
func cancelOperationMethod() {
    let cancelOperation = OperationCancelTest()
    operationQueue.addOperation(cancelOperation)
    cancelOperation.cancel()
}
//cancelOperationMethod()

class WaitOperationTest {
    private let operationQueue = OperationQueue()
    func test() {
        operationQueue.addOperation {
            sleep(1)
            print("Test 1")
        }
        operationQueue.addOperation {
            sleep(2)
            print("Test 2")
        }
        
        operationQueue.waitUntilAllOperationsAreFinished()
        
        operationQueue.addOperation {
            print("Test 3")
        }
        operationQueue.addOperation {
            print("Test 4")
        }
    }
}
let waitOperationTest = WaitOperationTest()
//waitOperationTest.test()

class WaitOperationTest2 {
    private let operationQueue = OperationQueue()
    func test() {
        let operation1 = BlockOperation {
            sleep(1)
            print("Test 1")
        }
        let operation2 = BlockOperation {
            sleep(2)
            print("Test 2")
        }
        operationQueue.addOperations([operation1,operation2], waitUntilFinished: true)
    }
}
let waitOperationTest2 = WaitOperationTest2()
//waitOperationTest2.test()

class ComplitionBlockTest {
    private let operationQueue = OperationQueue()
    func test() {
        let operation1 = BlockOperation {
            sleep(2)
            print("Test ComplitionBlock")
        }
        operation1.completionBlock = {
            print("finish complitionBlock")
        }
        operationQueue.addOperation(operation1)
    }
}
var complitionBlockTest = ComplitionBlockTest()
complitionBlockTest.test()
