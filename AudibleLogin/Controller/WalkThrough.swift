import UIKit

class WalkThrough: UIViewController {
  
  let data: [Page] = [
    Page(img: #imageLiteral(resourceName: "page1"), title: "Lorem, ipsum dolor.", desc: "ipsum eaque, neque odit sequi mollitia, quas a natus laboriosam tempore.quas a natus"),
    Page(img: #imageLiteral(resourceName: "page2"), title: "ipsum dolor sit", desc: "ipsum eaque, neque odit sequi mollitia, quas a natus laboriosam tempore.quas a natus"),
    Page(img: #imageLiteral(resourceName: "page3"), title: "sit amet consectetur.", desc: "ipsum eaque, neque odit sequi mollitia, quas a natus laboriosam tempore.quas a natus"),
  ]
  
  lazy var nextButton: UIButton =  {
    let b = UIButton()
    b.setTitleColor(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), for: .normal)
    b.setTitle("Next", for: .normal)
    b.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
    return b
  }()
  
  let skipButton: UIButton =  {
    let b = UIButton()
    b.setTitleColor(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), for: .normal)
    b.setTitle("Skip", for: .normal)
    b.addTarget(self, action: #selector(skipToLast), for: .touchUpInside)
    return b
  }()
  
  lazy var cv: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    cv.dataSource = self
    cv.delegate = self
    cv.isPagingEnabled = true
    cv.showsVerticalScrollIndicator = false
    cv.showsHorizontalScrollIndicator = false
    return cv
  }()
  
  let pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.numberOfPages = 4
    pc.currentPage = 0
    return pc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    UIApplication.shared.statusBarStyle = .lightContent
    setNeedsStatusBarAppearanceUpdate()
    setupViews()
  }
  
  func setupViews(){
    view.addSubview(cv)
    cvSetup()
    view.addSubview(nextButton)
    view.addSubview(skipButton)
    buttonsSetup()
    view.addSubview(pageControl)
    pageControlSetup()
  }
  
  func cvSetup(){
    cv.anchorEdges(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
    cv.register(WalkThroughCell.self, forCellWithReuseIdentifier: wCell)
    cv.register(WalkThroughLoginCell.self, forCellWithReuseIdentifier: lCell)
  }
  
  var nButtonTopC: NSLayoutConstraint?
  var sButtonTopC: NSLayoutConstraint?
  var pageBottomTopC: NSLayoutConstraint?
  
  func buttonsSetup(){
    nextButton.anchorEdges(top: nil, tConst: 20, left: nil , lConst: 0, right: view.rightAnchor, rConst: -20, bottom: nil, bConst: 0)
    skipButton.anchorEdges(top: nil, tConst: 20, left: view.leftAnchor, lConst: 20, right: nil, rConst: 0, bottom: nil, bConst: 0)
    
    nButtonTopC = nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
    sButtonTopC = skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)

    nButtonTopC?.isActive = true
    sButtonTopC?.isActive = true
  }
  func pageControlSetup(){
    
    pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    pageControl.currentPage = 0
    pageControl.anchorEdges(top: nil, tConst: 0, left: view.leftAnchor, lConst: 0, right: view.rightAnchor, rConst: 0, bottom: nil, bConst: -30)
    pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    pageBottomTopC = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    pageBottomTopC?.isActive = true
  }
  
  @objc func goToNext(){
    if pageControl.currentPage == data.count { return }
    let i = IndexPath(item: pageControl.currentPage + 1, section: 0)
    cv.scrollToItem(at: i, at: .centeredHorizontally, animated: true)
    
    pageControl.currentPage = pageControl.currentPage + 1
    
    if (pageControl.currentPage == data.count /* 3 */ ){
      animateControlsOut()
    }
    
    if (pageControl.currentPage > 0){
      UIApplication.shared.statusBarStyle = .default
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  @objc func skipToLast(){
    pageControl.currentPage = data.count - 1 // 3
    goToNext()
  }
}

extension WalkThrough: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.row == 3 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lCell, for: indexPath) as! WalkThroughLoginCell
      cell.WalkThrough = self 
      return cell
    }
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: wCell, for: indexPath) as! WalkThroughCell
    cell.page = data[indexPath.item]
    return cell
  }
  

  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.bounds.width, height: view.bounds.height)
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    view.endEditing(true)
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    pageControl.currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
    if pageControl.currentPage > 0 {
      UIApplication.shared.statusBarStyle = .default
      setNeedsStatusBarAppearanceUpdate()
    }else{
      UIApplication.shared.statusBarStyle = .lightContent
      setNeedsStatusBarAppearanceUpdate()
    }
    if ( pageControl.currentPage == data.count ){
      animateControlsOut()
    }else if pageControl.currentPage == data.count - 1  {
      animateControlsIn()
    }
  }
  
  func animateControlsOut(){
    nButtonTopC?.constant = -50
    sButtonTopC?.constant = -50
    pageBottomTopC?.constant = 30
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  func animateControlsIn(){
    nButtonTopC?.constant = 20
    sButtonTopC?.constant = 20
    pageBottomTopC?.constant = -20
    
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }


//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//  }
}

extension WalkThrough: WalkThroughLoginDelegate {
  func handleLogin(username: String, password: String){
    // get the rootviewcontroller
    if let rvc = UIApplication.shared.keyWindow?.rootViewController as? Main {
      rvc.viewControllers = [ Home() ] // after dismissal this will be shown.
      dismiss(animated: true, completion: nil)
    }
  }
  
  func handleLogout(){
    
  }
}
