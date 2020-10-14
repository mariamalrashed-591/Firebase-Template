
import Foundation
import FirebaseFirestore
import class Firebase.User
typealias FirebaseUser = Firebase.User


struct User: Codable{
    var firstName: String = ""
    var username: String = ""
    var email: String = ""
    var phoneNumber: String = ""
    
    func fullName() -> String{
        firstName 
    }
}





struct SignInCredentials: Encodable
{
    var email: String
    var password: String
}
