import UIKit

class Home: UIViewController {
  
  var main: Main?
  
  let image: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.image = #imageLiteral(resourceName: "home")
    return iv
  }()
  
  let signoutButton: UIBarButtonItem = {
    let b = UIBarButtonItem()
    b.title = "Log Out"
    return b
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupNavItem()
  }
  
  func setupViews(){
    view.addSubview(image)
    image.anchorEdges(top: view.safeAreaLayoutGuide.topAnchor, tConst: 0, left: view.leftAnchor, lConst: 0,
                      right: view.rightAnchor, rConst: 0, bottom: view.bottomAnchor, bConst: 0)
  }
  
  func setupNavItem(){
    navigationItem.title = "You Are Logged in"
    navigationItem.leftBarButtonItem = signoutButton
    signoutButton.action = #selector(signout)
  }
  
  @objc func signout(){
    main?.logout()
  }
}
