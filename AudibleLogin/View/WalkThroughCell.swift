import UIKit

class WalkThroughCell: UICollectionViewCell {
  var page: Page? {
    didSet{
      guard let page = page else { return }
      iv.image = page.img
      let center = NSMutableParagraphStyle()
      center.alignment = .center

      let titleAttributes:[NSAttributedStringKey : Any]  = [
        .font: UIFont.systemFont(ofSize: 20, weight: .medium),
        .paragraphStyle: center,
        .foregroundColor: UIColor(white: 0.2, alpha: 1)
      ]
      let descAttributes: [NSAttributedStringKey : Any]  = [
        .font: UIFont.systemFont(ofSize: 16, weight: .light),
        .paragraphStyle: center,
        .foregroundColor: UIColor(white: 0.3, alpha: 1)
      ]
      let text = NSMutableAttributedString(string: page.title, attributes: titleAttributes)
      let descAttributedString = NSMutableAttributedString(string: page.desc, attributes: descAttributes)
      text.append(NSAttributedString(string: "\n\n\n"))
      text.append(descAttributedString)
      tv.attributedText = text
    }
  }

  let iv: UIImageView = {
    let iv = UIImageView()
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  lazy var tv: UITextView = {
    let tv = UITextView()
    tv.isEditable = false
    tv.isSelectable = false
    return tv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  func setupViews(){
    addSubview(iv)
    addSubview(tv)

    tv.anchorEdges(top: nil, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor)

    tv.textContainerInset.left = 20
    tv.textContainerInset.right = 20
    tv.textContainerInset.top = 30

    tv.anchorWH(width: nil,height: heightAnchor, hMultiplier: 0.3)
    iv.anchorEdges(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: tv.topAnchor)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
