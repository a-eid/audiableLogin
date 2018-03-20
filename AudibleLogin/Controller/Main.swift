import UIKit


class Main: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var isLoggedIn = false

    if ( isLoggedIn ){
      viewControllers = [ Home() ]
    }else{
      DispatchQueue.main.async {
        self.present(WalkThrough(), animated: true, completion: nil)
      }
    }
  }
}
