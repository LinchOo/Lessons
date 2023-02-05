//Multithreading в swift с нуля_  урок 7 - GCD,Concurrent queues, Serial queues,sync-async
import UIKit

class QueueTest1 {
    private let serialQueue = DispatchQueue(label: "serialTest")
    private let concurrentQueue = DispatchQueue(label: "concurrentTest", attributes: .concurrent)
}
class QueueTest2 {
    private let globalQueue = DispatchQueue.global()
    private let mainQueue = DispatchQueue.main
}
