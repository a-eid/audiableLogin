import UIKit

class WalkThroughCell: UICollectionViewCell {

  let iv: UIImageView = {
    let iv = UIImageView()
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  func setupViews(){
    addSubview(iv)
    iv.image = #imageLiteral(resourceName: "page1")
    iv.anchorEdges(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
