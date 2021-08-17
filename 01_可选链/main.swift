//
//  main.swift
//  01_可选链
//
//  Created by XFB on 2021/8/17.
//

// 可选链 Optional Chaining
class Car { var price = 0 }
class Dog { var weight = 0 }
class Person {
    var name: String = ""
    var dog: Dog = Dog()
    var car: Car? = Car()
    func age() -> Int { 18 }
    func eat() { print("Person eat!!!") }
    subscript(index: Int) -> Int { index }
}

var person: Person? = Person()

//var age1 = person!.age()
//var age2 = person?.age()
//var name = person?.name
//var index = person?[6]
//func getName() -> String { "Jack" }
//person?.name = getName()

if let age = person?.age() {
    print("调用age成功", age)
} else {
    print("调用age失败")
}



// 如果可选项为nil，调用方法、下标、属性失败，结果为nil
// 如果可选项不为nil，调用方法、下标、属性成功，结果会被包装成可选项
// 如果结果本来是可选项，不会进行再次包装
