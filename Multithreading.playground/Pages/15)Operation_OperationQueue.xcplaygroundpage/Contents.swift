import UIKit

//-------------/Example 1/-------------//
/*
let operation1 = {
    print("Start")
    print(Thread.current)
    print("Finish")
}
let queue = OperationQueue()
queue.addOperation(operation1)
*/
//-------------/Example 2/-------------//
/*
var result: String?
let concatOperation = BlockOperation {
    result = "The Swift" + " " + "Developers"
    print(Thread.current)
}
concatOperation.start()
print(result!)
*/
//-------------/Example 3/-------------//
/*
var result: String?
let concatOperation = BlockOperation {
    result = "The Swift" + " " + "Developers"
    print(Thread.current)
}
let queue = OperationQueue()
queue.addOperation(concatOperation)
print(result!)
*/
//-------------/Example 4/-------------//

let queue = OperationQueue()
queue.addOperation{
    print("Test")
    print(Thread.current)
}

//-------------/Example 5/-------------//
/*
class MyThread: Thread {
    override func main() {
        print("Test main thread")
    }
}
let myThread = MyThread()
myThread.start()
*/
//-------------/Example 6/-------------//
/*
class OperationA: Operation {
    override func main() {
        print("Test main thread")
    }
}
let operationA = OperationA()
let queue = OperationQueue()
queue.addOperation(operationA)
*/
