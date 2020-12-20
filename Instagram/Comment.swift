//
//  Comment.swift
//  Instagram
//
//  Created by 三輪駿 on 2020/12/20.
//

import UIKit

class Comment: NSObject {
    var author: String?
    var content: String?

    init(author: String, content: String) {
        self.author = author
        self.content = content
    }
}
