//
//  CommentViewController.swift
//  Instagram
//
//  Created by 三輪駿 on 2020/12/19.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField!

    var id: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handlePostCommentButton(_ sender: Any) {
        if let commentText = commentTextField.text {
            if commentText.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力してください。")
            } else {
                if let myname = Auth.auth().currentUser?.displayName {
                    SVProgressHUD.show()
                    let postRef = Firestore.firestore().collection(Const.PostPath).document(id)
                    let postDic = [
                        "author": myname,
                        "comment": commentText,
                    ] as [String: Any]
                    let updateValue = FieldValue.arrayUnion([postDic])
                    postRef.updateData(["comments": updateValue])
                    SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
