import UIKit


protocol Rule {
    var username:String {get set}
    var password:String {get set}
    var auth:Bool {get set }
    func isEquals(person:Person) throws
}


enum ErrorHandling: Error {
    case usernameNotSatisfy
    case passwordNotSatisfy
    case authNotSatisfy
}


struct Person{
    var username:String
    var password:String
    var auth:Bool
}

class PersonData:Rule{  // conform
    
    var username: String
    var password: String
    var auth: Bool
    
    func isEquals(person: Person) throws {
        if username != person.username {
            throw ErrorHandling.usernameNotSatisfy
        }
        if password != person.password {
            throw ErrorHandling.passwordNotSatisfy
        }
        if auth != person.auth{
            throw ErrorHandling.authNotSatisfy
        }
    }
    
    init (username:String , password:String , auth:Bool){
        self.username = username  //shadowing
        self.password = password
        self.auth = auth
    }
}

let personDataOne = PersonData(username: "Osman", password: "Osman123", auth: true)
let personLogin = Person(username: "Osman", password: "Osman123", auth: true)


func test (){
    
    do {
        try personDataOne.isEquals(person: personLogin)
    }catch{
        print(error)
    }
}
test()
