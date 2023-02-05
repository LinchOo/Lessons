import UIKit

//-------------/C - Mutex example:/-------------//
//class SaveThread {
//    private var mutex = pthread_mutex_t()
//    init() {
//            pthread_mutex_init(&mutex, nil)
//    }
//
//    func someMethod(competion: () -> ()) {
//        pthread_mutex_lock(&mutex)
//        competion()
//        defer{
//            pthread_mutex_unlock(&mutex)
//        }
//    }
//}
//-------------/NSThread - Mutex example:/-------------//
class SaveThread {
    private let lockMutex = NSLock()
    func someMethod(competion: () -> ()) {
        lockMutex.lock()
        competion()
        defer {
            lockMutex.unlock()
        }
    }
}


var array = [String]()
let saveThread = SaveThread()

saveThread.someMethod {
    print("Test")
    array.append("1 thread")
}
array.append("2 thread")
