import UIKit


extension UIView {
  // top bottom left and right
  func anchorEdges(top: NSLayoutYAxisAnchor?, tConst: CGFloat = 0,
                   left: NSLayoutXAxisAnchor?, lConst: CGFloat = 0 ,
                   right: NSLayoutXAxisAnchor?, rConst: CGFloat = 0 ,
                   bottom: NSLayoutYAxisAnchor?, bConst: CGFloat = 0
  ){
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: tConst).isActive = true
    }
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: lConst).isActive = true
    }
    
    if let right = right {
      self.rightAnchor.constraint(equalTo: right, constant: rConst).isActive = true
    }
    if let bottom = bottom {
      self.bottomAnchor.constraint(equalTo: bottom, constant: bConst).isActive = true
    }
  }
  
  // width height
  func anchorWH(){
    
  }
  
  // centerXY
  func anchorCenter(){
    
  }
  
}
