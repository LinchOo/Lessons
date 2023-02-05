/*
 //----------------------------/Troubles with Threads/---------------------------//
 
 //--------------//--------------//--------------//--------------//--------------//
 
                     Условия гонки () Race condition
    Несколько потоков работают с одними данными, непредсказуемость данных
 //--------------//--------------//--------------//--------------//--------------//
 
             Конкуренция за ресурс () Resource contetnion
 Несколько потоков пытаются получить доступ к одному ресурсу, увеличивается время
 
 //--------------//--------------//--------------//--------------//--------------//
 
                 Вечная блокировка () DeadLock
                Несолько потоков блокируют друг друга
 
 //--------------//--------------//--------------//--------------//--------------//
 
                         Голодание () Starvation
                Поток не может получить доступ к ресурсу
 
 //--------------//--------------//--------------//--------------//--------------//
 
              Инверсия приоритетов () Priority Inversion
 Поток с низким приоритетом удерживает ресурс который ждет другой поток с высшим приоритетом
 
 //--------------//--------------//--------------//--------------//--------------//
 
 Неопределенность и справедливость () Non-deterministic and Fairness
 
 //--------------//--------------//--------------//--------------//--------------//
*/

import UIKit
//------------/C - recursive example/------------//
class RecursiveMutexTest {
    private var mutex = pthread_mutex_t()
    private var attribute = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&attribute)
        pthread_mutexattr_settype(&attribute, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attribute)
    }
    
    func firstMethod() {
        pthread_mutex_lock(&mutex)
        secondMethod()
        defer{
            pthread_mutex_unlock(&mutex)
        }
        print("Exit firstMethod")
    }
    private func secondMethod() {
        pthread_mutex_lock(&mutex)
        defer{
            pthread_mutex_unlock(&mutex)
        }
        print("Exit secondMethod")
    }
}

let recursive = RecursiveMutexTest()
recursive.firstMethod()

//------------/NSThread - recursive example/------------//
let recursiveLock = NSRecursiveLock()
class RecursiveThread: Thread {
    override func main() {
        recursiveLock.lock()
        print("Thread acquired lock")
        callMe()
        defer {
            recursiveLock.unlock()
        }
        print("Exit Main")
    }
    func callMe() {
        recursiveLock.lock()
        print("Thread acquired lock")
        defer {
            recursiveLock.unlock()
        }
        print("Exit CollMe")
    }
}
let thread = RecursiveThread()
thread.start()
