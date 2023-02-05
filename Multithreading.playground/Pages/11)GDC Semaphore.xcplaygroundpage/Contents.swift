import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 2)

queue.async {
    semaphore.wait() // -1
    sleep(3)
    print("method 1")
    semaphore.signal() // +1
}
queue.async {
    semaphore.wait() // -1
    sleep(3)
    print("method 2")
    semaphore.signal() // +1
}
queue.async {
    semaphore.wait() // -1
    sleep(3)
    print("method 3")
    semaphore.signal() // +1
}
