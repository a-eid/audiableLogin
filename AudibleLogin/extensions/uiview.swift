import UIKit


extension UIView {
  // top bottom left and right
  func anchorEdges(top: NSLayoutYAxisAnchor?, tConst: CGFloat = 0,
                   left: NSLayoutXAxisAnchor?, lConst: CGFloat = 0 ,
                   right: NSLayoutXAxisAnchor?, rConst: CGFloat = 0 ,
                   bottom: NSLayoutYAxisAnchor?, bConst: CGFloat = 0
  ){
    self.translatesAutoresizingMaskIntoConstraints = false
    if let top = top { topAnchor.constraint(equalTo: top, constant: tConst).isActive = true }
    if let left = left { leftAnchor.constraint(equalTo: left, constant: lConst).isActive = true }
    if let right = right { rightAnchor.constraint(equalTo: right, constant: rConst).isActive = true }
    if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: bConst).isActive = true }
  }
  
  // width height
  func anchorWH(width: NSLayoutDimension?, wMultiplier: CGFloat = 1, height: NSLayoutDimension?, hMultiplier: CGFloat = 1){
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if let width = width {
      self.widthAnchor.constraint(equalTo: width, multiplier: wMultiplier).isActive = true
    }
    if let height = height {
      self.heightAnchor.constraint(equalTo: height, multiplier: hMultiplier).isActive = true
    }
  }
  
  // centerXY
  func anchorCenter(x: NSLayoutXAxisAnchor?, xConstant: CGFloat = 0, y: NSLayoutYAxisAnchor?, yConstant: CGFloat = 0){
    self.translatesAutoresizingMaskIntoConstraints = false
    if let x = x { self.centerXAnchor.constraint(equalTo: x, constant: xConstant).isActive = true }
    if let y = y { self.centerYAnchor.constraint(equalTo: y, constant: yConstant).isActive = true }
  }
  
}



















