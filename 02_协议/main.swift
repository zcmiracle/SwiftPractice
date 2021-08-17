//
//  main.swift
//  02_协议
//
//  Created by XFB on 2021/8/17.
//

// CustomStringConvertible 协议，可以自定义实例的打印字符串
class Person: CustomStringConvertible {
    var age : Int
    var name: String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    var description: String {
        "age=\(age), name=\(name)"
    }
}

var person = Person(age: 10, name: "TiMi")
print(person)




// Any AnyObject
// Any：可以代表任意类型（枚举、结构体、类、也包括函数类型）
// AnyObject：可以代表任意类 类型（在协议后面写上：AnyObject代表只有类能遵守这个协议）
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
