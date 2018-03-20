import UIKit


class Main: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


    if ( UserDefaults.standard.isLoggedIn()){
      let home = Home()
      viewControllers = [ home ]
    }else{
      DispatchQueue.main.async {
        self.present(WalkThrough(), animated: true, completion: nil)
      }
    }
  }
  
  func logout(){
    self.present(WalkThrough(), animated: true, completion: nil)
  }
}
