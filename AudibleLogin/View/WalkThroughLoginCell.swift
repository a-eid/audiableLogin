//
//  WalkThroughLoginCell.swift
//  AudibleLogin
//
//  Created by Ahmed Eid on 19/03/2018.
//  Copyright © 2018 Ahmed Eid. All rights reserved.
//

import UIKit

class WalkThroughLoginCell: UICollectionViewCell {
  
  var container: UIView = {
    let v = UIView()
    return v
  }()
  
  var logo: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "logo")
    return iv
  }()
  
  var emailInput: UITextField = {
    let tf = UITextField()
    tf.layer.borderWidth = 1
    tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tf.layer.cornerRadius = 5
    tf.keyboardType = .emailAddress
    
    let lp = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
    tf.leftView = lp
    tf.leftViewMode = .always
    
    return tf
  }()
  
  var passwordInput: UITextField = {
    let tf = UITextField()
    tf.layer.borderWidth = 1
    tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tf.layer.cornerRadius = 5
    tf.isSecureTextEntry = true
    
    let lp = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
    tf.leftView = lp
    tf.leftViewMode = .always
    
    return tf
  }()
  
  lazy var submit: UIButton = {
    let b = UIButton()
    b.layer.cornerRadius = 5
    b.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    b.setTitle("Login", for: .normal)
    b.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    b.addTarget(self, action: #selector(handleLoginIn), for: .touchUpInside)
    return b
  }()
  
  
  @objc func handleLoginIn(){
    // hmmm.
    print("working")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    setupViews()
    addObservers()
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
    tap.numberOfTapsRequired = 1
    addGestureRecognizer(tap)
  }
  
  func setupViews(){
    setupContainer()
    setupLogo()
    setupEmail()
    setupPassword()
    setupSubmit()
  }
  
  var containerCY: NSLayoutConstraint?
  
  func setupContainer(){
    addSubview(container)
//    container.anchorCenter(x: centerXAnchor, y: centerYAnchor)
    container.anchorCenter(x: centerXAnchor, y: nil)
    container.anchorEdges(top: nil, tConst: 0, left: leftAnchor, lConst: 20, right: rightAnchor, rConst: -20, bottom: nil, bConst: 0)
    container.heightAnchor.constraint(equalToConstant: 380).isActive = true
    
    containerCY = container.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50)
    containerCY?.isActive = true
  }
  
  func setupLogo(){
    container.addSubview(logo)
    logo.anchorCenter(x: container.centerXAnchor, y: nil)
    logo.anchorEdges(top: container.topAnchor, left: nil, right: nil, bottom: nil)
    logo.anchorWHC(width: 160, height: 160)
  }
  
  func setupEmail(){
    container.addSubview(emailInput)
    emailInput.anchorEdges(top: logo.bottomAnchor, tConst: 20, left: container.leftAnchor, lConst: 5, right: container.rightAnchor, rConst: -5, bottom: nil, bConst: 0)
    emailInput.anchorWHC(width: nil, height: 50)
  }
  func setupPassword(){
    container.addSubview(passwordInput)
    passwordInput.anchorEdges(top: emailInput.bottomAnchor, tConst: 20, left: container.leftAnchor, lConst: 5, right: container.rightAnchor, rConst: -5, bottom: nil, bConst: 0)
    passwordInput.anchorWHC(width: nil, height: 50)
  }
  func setupSubmit(){
    container.addSubview(submit)
    submit.anchorEdges(top: passwordInput.bottomAnchor, tConst: 20, left: container.leftAnchor, lConst: 5, right: container.rightAnchor, rConst: -5, bottom: nil, bConst: 0)
    submit.anchorWHC(width: nil, height: 50)
  }
  
  func addObservers(){
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  @objc func keyboardWillShow(){
    // assume 432 is the height of the keyboard.
    containerCY?.constant = -90
    UIView.animate(withDuration: 0.2) {
      self.layoutIfNeeded()
    }
  }
  

  @objc func keyboardWillHide(){
    containerCY?.constant = -50
    UIView.animate(withDuration: 0.2) {
      self.layoutIfNeeded()
    }
  }
  
  // dismiss keyboard if tap anywhere but textfields
  
  @objc func handleTap(gesture: UITapGestureRecognizer){
    if !gesture.isKind(of: UITextField.self) {
      endEditing(true)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
