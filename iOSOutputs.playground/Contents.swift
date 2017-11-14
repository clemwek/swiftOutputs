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

testFunc(limit: 23)


//: ### Output 2:
//: Using   a   Swift   playground,   write   a   program   that   combines   an   array   of   dictionaries   into   a   single dictionary   such   that   the   value   associated   with   each   key   is   a   _set_   containing   the   unique   values associated   with   that   key   in   the   input   dictionaries.   The   program   should   then   print   out   the _sorted_   results   in   human-readable   form.

let myArray = [
    ["Girls": ["Tiffany", "Kim", "Tiffany"]],
    ["Girls": ["jane", "tess"]],
    ["Boys": ["Martin"]]
]


var myDict: [String : [String]] = [:]

let reducedDictionary = myArray
    .flatMap(){$0}
    .reduce([String: Set<String>]()){ (result, value) in
        if (result.keys).contains(value.key){
            
            let tempValue = result[value.key]
            //container for our temporary dict
            var tempDictionary = result
            
            // pick the dictionary value
            let dictValue = value.value
            
            //convert the dict value to a set
            let newSet = Set(dictValue)
            
            let newValue = tempValue?.union(newSet)
            tempDictionary.updateValue(newValue ?? Set(), forKey: value.key)
            return tempDictionary
        }
        else{
            var tempDictionary = result
            tempDictionary[value.key] = Set(value.value)
            return tempDictionary
        }
}

print(reducedDictionary)



//: ### Output 3:
//: a dictionary program with at least three functions that allow the user to look-up values in a dictionary and return them in human-readable form, and then traverse the dictionary to print out each value in each set.
//: Use a Swift playground as your tools. Use a trailing closure in your code when you are traversing the dictionary such that the closure is called once for each key and value within the associated sets.

let someDict = [
    "n": "north",
    "s": "south",
    "w": "west",
    "e": "east"
]

func dict (_ LookUp: String) {
    if let result = someDict[LookUp]{
        print("You are searching for \(LookUp) which is for \(result) direction.")
    } else {
        print("You are search for \(LookUp) was not found.")
    }
}

func dict () {
    for (initial, direction) in someDict {
        print("Initial: \(initial) - Direction: \(direction)")
    }
}

dict()

someDict.map { print("Key \($0.key) with value \($0.value)") }
