import UIKit
import PlaygroundSupport


//---------------/Serial/---------------//
class DispatchGroupSerial {
    private let queueSerial = DispatchQueue(label: "MyQueue")
    private let groupRed = DispatchGroup()
    func loadInfo() {
        
        queueSerial.async(group: groupRed) {
            sleep(1)
            print("1 method")
        }
        queueSerial.async(group: groupRed) {
            sleep(1)
            print("2 method")
        }
        groupRed.notify(queue: .main) {
            sleep(1)
            print("Group Red done")
        }
    }
}
let dispatchGroupSerial = DispatchGroupSerial()
//dispatchGroupSerial.loadInfo()

//---------------/Concurrent/---------------//
class DispatchGroupConcurrent {
    private let queueConcurrent = DispatchQueue(label: "MyQueue", attributes: .concurrent)
    private let groupBlck = DispatchGroup()
    func loadInfo() {
        groupBlck.enter() // добавляем в групу
        queueConcurrent.async {
            sleep(1)
            print("1")
            self.groupBlck.leave() // выходим с групы
        }
        groupBlck.enter() // добавляем в групу
        queueConcurrent.async {
            sleep(2)
            print("2")
            self.groupBlck.leave() // выходим с групы
        }
        groupBlck.wait() // Пока група не выполнится дальше не идём
        print("Group Done")
        
        groupBlck.notify(queue: .main) {
            print("Finish all in main") // переводим в майн поток после выполнения группы
        }
         
    }
}
