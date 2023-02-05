import UIKit

// Паралельно          Parallel
// 1)MainThread  ----------------------
// 2)Thread      ----------------------

// Послiдовно        Successively
// 1)MainThread    ---   ----   -- - -
// 2)Thread      --   ---    ---  - --

// Асинхронно           Async
// 1)MainThread  ----------------------
// 2)Thread        --   -   ---  -



//-------------/ C - example /-------------//

var thread = pthread_t(bitPattern: 0) // create thread
var attribut = pthread_attr_t()       // create attribut for thread

pthread_attr_init(&attribut)
pthread_create(&thread, &attribut, { (pointer) -> UnsafeMutableRawPointer? in
    print("Test")
    return nil
}, nil)

//-------------/ NSThread - example /-------------//

var nsThread = Thread {
        print("Test 2")
}
nsThread.start()
Thread.setThreadPriority(2)
nsThread.cancel()

