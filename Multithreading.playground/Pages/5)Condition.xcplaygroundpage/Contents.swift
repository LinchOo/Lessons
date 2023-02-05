import UIKit

//---------------/C Condition/---------------//

var available = false
var condition = pthread_cond_t()
var mutex = pthread_mutex_t()

class ConditionMutexPrinter: Thread {
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    override func main() {
        printerMethod()
    }
    private func printerMethod() {
        pthread_mutex_lock(&mutex)
        
        print("printerMethod Enter")
        while (!available) {
            pthread_cond_wait(&condition, &mutex)
        }
        available = false
        defer {
            pthread_mutex_unlock(&mutex)
        }
        print("printerMethod Exit")
    }
}
class ConditionMutexWriter: Thread {
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    override func main() {
        writerMethod()
    }
    private func writerMethod() {
        pthread_mutex_lock(&mutex)
        print("writerMethod Enter")
        available = true
        pthread_cond_signal(&condition)
        defer {
            pthread_mutex_unlock(&mutex)
        }
        print("writerMethod Exit")
    }
}

let conditionMutexWriter = ConditionMutexWriter()
let conditionMutexPrinter = ConditionMutexPrinter()
conditionMutexPrinter.start()
conditionMutexWriter.start()

//---------------/NSCondition/---------------//

let condi = NSCondition()
var availables = false

class WriterThread: Thread {
    override func main(){
        condi.lock()
        print("WriterThread enter")
        availables = true
        condi.signal()
        condi.unlock()
        print("WriterThread exit")
    }
}
class PrinterThread: Thread {
    override func main() {
        condi.lock()
        print("Printer enter")
        while (!availables) {
            condi.wait()
        }
        availables = false
        condi.unlock()
        print("PrinterThread exit")
    }
}

let writer = WriterThread()
let printer = PrinterThread()

writer.main()
printer.main()
