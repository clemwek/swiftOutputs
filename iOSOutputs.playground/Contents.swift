//: ### Output   1:
//: a program that iterates over an arbitrary range of integers and prints descriptive phrases for each.


func testFunc(limit: Int) {
    for i in 0...limit {
        let isEven: Bool = i % 2 == 0 ? true : false
        switch isEven {
        case true:
            print("\(i) is an even Number")
        default:
            print("\(i) is an odd number")
        }
    }
}
