//
//  UserModel.swift
//  AR_Meisi_iOS
//
//  Created by s0ra on 2020/01/18.
//  Copyright © 2020 s0ra. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object{
    @objc dynamic var name: String? = nil
    @objc dynamic var email: String? = nil
    @objc dynamic var password: String? = nil
    @objc dynamic var profile: String? = nil
    @objc dynamic var token: String? = nil
    @objc dynamic var user_id: String? = nil
}

