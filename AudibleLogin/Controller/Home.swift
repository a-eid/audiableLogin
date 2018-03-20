import UIKit

class Home: UIViewController {
  
  let image: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.image = #imageLiteral(resourceName: "home")
    return iv
  }()
  
  lazy var signoutButton: UIBarButtonItem = {
    let b = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(signout))
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
  }
  
  @objc func signout(){
    UserDefaults.standard.set(false, forKey: isLoggedIn)
    UserDefaults.standard.synchronize()
    print( "Home" , UserDefaults.standard.bool(forKey: isLoggedIn))
    present(WalkThrough(), animated: true, completion: nil)
  }
}
