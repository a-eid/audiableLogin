import UIKit

class WalkThrough: UIViewController {
  
  lazy var cv: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    cv.dataSource = self
    cv.delegate = self
    cv.isPagingEnabled = true
    return cv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  func setupViews(){
    view.addSubview(cv)
    cvSetup()
  }
  
  func cvSetup(){
    cv.anchorEdges(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
    cv.register(WalkThroughCell.self, forCellWithReuseIdentifier: wCell)
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

}

extension WalkThrough: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: wCell, for: indexPath)
    if (indexPath.item == 0 ){ cell.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1) }
    if (indexPath.item == 1 ){ cell.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1) }
    if (indexPath.item == 2 ){ cell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) }
    if (indexPath.item == 3 ){ cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) }
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.bounds.width, height: view.bounds.height)
  }
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//  }
}

