import UIKit

extension UserDefaults {
  enum keys: String {
    case isLoggedIn
  }
  
  func setLoggedIn(_ value: Bool){
    set(value, forKey: UserDefaults.keys.isLoggedIn.rawValue)
    synchronize()
  }
  
  func isLoggedIn() -> Bool{
    return bool(forKey: UserDefaults.keys.isLoggedIn.rawValue)
  }
}
