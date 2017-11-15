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


//: ### Output 4:
//: a Swift program that uses an enumeration, a mutable structure, and an immutable structure.

enum EmployeeType: String {
    case manager = "Manager"
    case supervisor = "Supervisor"
    case staff = "Staff"
}

struct Person {
    let name: String
    let DoB: String
    var title: EmployeeType
}

var newEmployee = Person(name: "kayeli", DoB: "20/10/1990" , title: .staff)
print(newEmployee.title)

// Promotion
newEmployee.title = .manager

print(newEmployee.title)


//: ### Output 5:
//: Write a that uses at least 3 classes:
//: 1. A class with at least 3 stored properties, at least 2 computed properties, at least 2 methods, and at least 1 custom initializer.
//: 2. A class that inherits from the first class and overrides at least 1 method, 1 property, and 1 initializer.
//: 3. A   class   with   both   a   failable   initializer   and   a   deinitializer.

enum Permisions {
    case admin
    case editor
    case user
}

class User {
    var firstName: String
    var lastName: String
    var age: Int
    var permision: Permisions = .user
    var fullName: String {
        get {
            return "\(self.firstName) \(self.lastName)"
        }
    }
    var accessLevel: String {
        if self.age < 18 {
            return "Read Only"
        } else {
            return "Read and Write"
        }
    }
    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
    }
    func changeName (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    func canUpdateProfile () {
        print("can not update profile")
    }
}

class Editor: User {
    override var permision: Permisions {
        get {
            return .editor
        }
        set{
            
        }
    }
    
    override func canUpdateProfile() {
        print("can update some profile")
    }
}

let editor = Editor(firstName: "firstName", lastName: "lastName", age: 10)
editor.permision = .admin
print("new position", editor.permision)

class Admin: User {
    override var permision: Permisions {
        get {
            return .admin
        }
        set{
            
        }
    }
    var accessToken: String
    override init ( firstName: String, lastName: String, age: Int ) {
        self.accessToken = "accessToken"
        super.init(firstName: firstName, lastName: lastName, age: age )
    }
    
    //    convenience override init? (firstName: String, lastName: String, age: Int, accessToken: String ) {
    //
    //        if accessToken.isEmpty {
    //            return nill
    //        }
    //    }
    
    override func canUpdateProfile() {
        print("can update all profiles")
    }
}

let test = Admin(firstName: "john", lastName: "Doe", age: 56)

test.accessToken

