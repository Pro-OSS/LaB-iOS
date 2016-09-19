//
//  ChatViewController.swift
//  LaB-iOS
//
//  Created by 鲁浩 on 16/9/6.
//  Copyright © 2016年 鲁浩. All rights reserved.
//

import UIKit
import IBAnimatable

class MessageDetailViewController: UIViewController {

    @IBOutlet weak var messagesTableView: UITableView!
    
    @IBOutlet weak var typeView: UIView!
    
    @IBOutlet weak var functionalButton: AnimatableButton!
    
    @IBOutlet weak var sendButton: AnimatableButton!
    
    @IBOutlet weak var typeField: UITextField!
    
    @IBOutlet weak var functionalView: UIStackView!
    
    // 功能区是否打开中
    var isFunctionalViewOpened: Bool = false
    
    // 是否已经获取键盘高度
    var isKnownKeyboardHeight: Bool = false
    
    @IBAction func typing(_ sender: AnyObject) {
        if (typeField.text == "" && functionalButton.hidden) {
            sendButton.zoomOut()
            functionalButton.zoomIn()
            functionalButton.hidden = false
        }
        if (typeField.text != "" && !functionalButton.hidden){
            sendButton.zoomIn()
            functionalButton.zoomOut()
            functionalButton.hidden = true
        }
    }
    
    var keyboardHeight: CGFloat = 200 {
        didSet {
            let heightConstraint = NSLayoutConstraint(item: functionalView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: keyboardHeight)
            view.addConstraint(heightConstraint)
        }
    }
    
    @IBAction func functionalButtonClicked(_ sender: AnyObject) {
        dismissKeyboard()
        UIView.animate(withDuration: 0.25, animations: {
            self.messagesTableView.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
            self.typeView.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        })
    }
    
    @IBAction func sendButtonClicked(_ sender: AnyObject) {
        let typeContent = typeField.text
        self.typeField.text = ""
        // ToDo: 发送typeContent.
        typeContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.typeField.becomeFirstResponder()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MessageDetailViewController.dismissKeyboardAndFunctionalView))
        self.messagesTableView.addGestureRecognizer(tap)
    }
    
    func dismissKeyboardAndFunctionalView() {
        if (isFunctionalViewOpened) {
            UIView.animate(withDuration: 0.25, animations: {
                self.messagesTableView.transform = CGAffineTransform.identity
                self.typeView.transform = CGAffineTransform.identity
            })
        }
        isFunctionalViewOpened = false
        self.view.endEditing(true)
    }
    
    func dismissKeyboard() {
        isFunctionalViewOpened = true
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(MessageDetailViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MessageDetailViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
  
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        // 键盘高度
        self.keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        if (!isKnownKeyboardHeight) {
            isKnownKeyboardHeight = true
            self.view.endEditing(true)
        }
        // 动画时长
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations: (() -> Void) = {
            self.messagesTableView.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
            self.typeView.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if (isFunctionalViewOpened) {
            return
        }
        let userInfo = (notification as NSNotification).userInfo!
        // 动画时长
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations: (() -> Void) = {
            self.messagesTableView.transform = CGAffineTransform.identity
            self.typeView.transform = CGAffineTransform.identity
        }
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
