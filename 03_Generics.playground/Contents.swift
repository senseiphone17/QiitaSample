// https://qiita.com/rotors123/items/15a6354be8a81f728f42

import UIKit

class Hoge<T> {
    private var array = [T]()
    func add(value: T) {
        array.append(value)
    }
    
    func show() {
        for obj in array {
            print(obj)
        }
    }
}

var class1 = Hoge<Int>()
class1.add(value: 1)
class1.add(value: 2)
class1.show()

var class2 = Hoge<String>()
class2.add(value: "test 1")
class2.add(value: "test 2")
class2.show()

protocol MogeProtocol {
    associatedtype U
    var arrayU: [U] { get set }
    
    func addU(value: U)
    func showU()
}

class Moge<M>: MogeProtocol {
    typealias U = M
    var arrayU = [U]()
    
    func addU(value: U) {
        arrayU.append(value)
    }
    
    func showU() {
        for obj in arrayU {
            print(obj)
        }
    }
}

var class3 = Moge<Int>()
class3.addU(value: 3)
class3.addU(value: 4)
class3.showU()

var class4 = Moge<String>()
class4.addU(value: "test 3")
class4.addU(value: "test 4")
class4.showU()
