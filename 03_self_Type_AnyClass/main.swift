//
//  main.swift
//  03_self_Type_AnyClass
//
//  Created by Fearless on 2021/8/17.
//

import Foundation

// X.self 是一个元类型（metadata）的指针，metadata存放着类型相关信息
// X.self 属于X.Type类型

class Person {}
class Student: Person {}
var personType: Person.Type = Person.self
var studentType: Student.Type = Student.self
personType = Student.self // 父类指针指向子类对象

var anyType : AnyObject.Type = Person.self
anyType = Student.self

public typealias AnyClass = AnyObject.Type
var anyType2: AnyClass = Person.self
anyType2 = Student.self

var person = Person()
var personType1 = type(of: person)
// type(of: person) 不是函数调用
// 只是从person的内存地址中取出前8个字节的数据，也就是类型信息
// === 不是 ==
print(person.self === type(of: person))



// 元类型的应用
class Animal { required init() {} }
class Cat: Animal {}
class Dog: Animal {}
class Pig: Animal {}

func create(_ clses: [Animal.Type]) -> [Animal] {
    var arr = [Animal]()
    for cls in clses {
        arr.append(cls.init())
    }
    return arr
}
// [_3_self_Type_AnyClass.Cat, _3_self_Type_AnyClass.Dog, _3_self_Type_AnyClass.Pig]
print(create([Cat.self, Dog.self, Pig.self]))



class Person1 {
    var age: Int = 0
}

class Student1: Person1 {
    var no: Int = 0
}

print(class_getInstanceSize(Student1.self))
print(class_getSuperclass(Student1.self)!)
print(class_getSuperclass(Person1.self)!)



// Self 代表当前类型
class Person2 {
    var age = 1
    static var count = 2
    func run() {
        print(self.age)
        // 只能Person2.count 调用 类属性
//        print(self.count)
    }
}
print(Person2.count)

// Self一般用作返回值类型，限定返回值跟方法调用这必须是同一类型（也可以作为参数类型）
protocol Runnable {
    func test() -> Self
}

class Person3: Runnable {
    required init() {}
    func test() -> Self { type(of: self).init() }
}

class Student2: Person3 {}

var person3 = Person3()
print(person3.test())

var student2 = Student2()
print(student2.test())




// CaseIterable
// 让枚举遵守 CaseIterable 协议，可以实现遍历枚举值
enum Season : CaseIterable {
    case sprint, summer, autumn, winter
}

let seasons = Season.allCases
print(seasons.count)

for season in seasons {
    print(season)
}
