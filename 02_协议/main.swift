//
//  main.swift
//  02_协议
//
//  Created by XFB on 2021/8/17.
//

/**
 协议可以用来定义方法、属性、下标的声明。协议可以被枚举、结构体、类遵守
 多个协议之间用逗号隔开
 协议中定义方法时候不能有默认参数
 默认情况下，协议中定义的内容必须全部都实现
 */
protocol Drawable {
    func draw()
    var x: Int { get set }
    var y: Int { get }
    subscript(index: Int) -> Int { get set }
}

protocol Test1 {}
protocol Test2 {}
protocol Test3 {}

class TestClass: Test1, Test2, Test3 {}
    
/**
 协议中的属性
 协议中定义的属性必须是 var 关键字
 实现协议时的属性权限要不小于协议中定义的属性权限
    协议定义get、set，用var存储属性或get、set计算属性去实现
    协议定义get，用任何属性都可以实现
 
 */

class Person5: Drawable {
    var x: Int = 0
    var y: Int = 0
    
    func draw() {
        print("Person5 draw")
    }
    
    // 下标
    subscript(index: Int) -> Int {
        set {}
        get { index }
    }
}

class Person6: Drawable {
    var x: Int {
        get { 0 }
        set {}
    }
    var y: Int { 0 }
    func draw() {
        print("Person6 draw")
    }

    // 下标
    subscript(index: Int) -> Int {
        set {}
        get { index }
    }
}


/**
 static/class
 为了保证通用，协议中必须用static定义类型方法、类型属性、类型下标
 */

protocol Drawable2 {
    static func draw()
}

class Person8: Drawable2 {
    class func draw() {
        print("Person8 draw")
    }
}

class Person9: Drawable2 {
    static func draw() {
        print("Person8 draw")
    }
}


/**
 mutating
 只有将协议中的实例方法标记为mutating
    才允许结构体、枚举的具体实现修改自身内存
    类在实现方法时不用加mutating，枚举、结构体才需要加mutatin
 */

protocol Drawable3 {
    mutating func draw()
}

class Size3: Drawable3 {
    var width: Int = 0
    func draw() {
        width = 10
    }
}

struct Point3: Drawable3 {
    var x: Int = 0
    mutating func draw() {
        x = 10
    }
}

/**
 init init? init!
 协议中定义的init? init! 可以用init、init? init! 去实现
 协议中定义的init，可以用init、init! 去实现
 */
protocol Liveable {
    init()
    init?(age: Int)
    init!(no: Int)
}

class Person10: Liveable {
    required init() {}
    required init?(age: Int) {}
    required init!(no: Int) {}
}
    
/**
 协议组合
 协议组合，可以包含1个类类型
 */
protocol Liveable1 {}
protocol Runnable5 {}
class Person11 {}

func fn0(obj: Person) {}
func fn1(obj: Liveable1) {}
func fn2(obj: Liveable1 & Runnable5) {}
func fn3(obj: Person & Liveable1 & Runnable5) {}

typealias RealPerson = Person & Liveable1 & Runnable5
func fn4(obj: RealPerson) {}


/**
 CustomStringConvertible 协议，可以自定义实例的打印字符串
 */
class Person: CustomStringConvertible, CustomDebugStringConvertible {
    var age : Int
    var name: String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    // description
    var description: String {
        "description: age=\(age), name=\(name)"
    }
    
    // debugDescription
    var debugDescription: String {
        "debugDescription: age=\(age), name=\(name)"
    }
}

var person = Person(age: 10, name: "TiMi")
// 调用的是 CustomStringConvertible 协议的 description
print(person)
// debugPrint调用的是 CustomDebugStringConvertible协议的 description
debugPrint(person)



// Any AnyObject
// Any：可以代表任意类型（枚举、结构体、类、也包括函数类型）
// AnyObject：可以代表任意【类】类型（在协议后面写上：AnyObject代表只有类能遵守这个协议）
// 在协议后面协商：class 也代表只有类能遵守这个协议
var student : Any = 10
student = "James"
student = 20.5
student = false

struct Student {
    var age = 10
}
var data = [Any]()
data.append(1)
data.append(3.14)
data.append("James")
data.append({ 100 }) // 函数
data.append(Student())



// is、as？、as!、as
protocol Runnable { func run() }
class Person1 {}
class Student1: Person1, Runnable {
    func run() {
        print("Student1 Run")
    }
    func study() {
        print("Student1 study")
    }
}

// is用来判断是否为某类型
var stu: Any = 10
print(stu is Int) // true
stu = "James"
print(stu is String) // true
stu = Student1()
print(stu is Person1) // true
print(stu is Student1) // true
print(stu is Runnable) // true

// as用来做强制类型转换
var stu2: Any = 10
(stu2 as? Student1)?.study() // 没有调用study
stu2 = Student1()
(stu2 as? Student1)?.study() // Student1 study
(stu2 as! Student1).study() // Student1 study
(stu2 as? Student1)?.run() // Student1 run

var data1 = [Any]()
data1.append(Int("123") as Any)

var data2 = 10 as Double
print(data2) // 10.0


