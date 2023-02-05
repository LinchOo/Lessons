import UIKit


//-------------/C - QOS example/-------------//
var pThread = pthread_t(bitPattern: 0)
var attribute = pthread_attr_t()
pthread_attr_init(&attribute)
pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
pthread_create(&pThread, &attribute, { (pointer) -> UnsafeMutableRawPointer? in
    print("test")
    pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
    return nil
}, nil)

//-------------/NSThread - QOS example/-------------//
let nsThread = Thread {
    print("Test 2")
    print(qos_class_self())
}
nsThread.qualityOfService = .userInitiated
nsThread.start()
print(qos_class_main())
nsThread.cancel()
