//
//  RegisterViewController.swift
//  RealTimeFaceDetection
//
//  Created by 神田蒼空 on 2019/12/21.
//  Copyright © 2019 Mert Tuzer. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var profile: UITextField!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func userRegister(_ sender: UIButton){
        print("aaaaa")
        let url = "http://localhost:3000/v1/user/users/register"
        let headers: HTTPHeaders = [
            "Contenttype": "application/json"
        ]
        let parameters:[String: Any] = [
            "name": name.text,
            "email": email.text,
            "password": password.text
        ]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let result = response.result.value as? [String: Any] {
                if response.response?.statusCode == 201 {
                    print("ユーザー作成に成功しました")
                    print(result)
                    let text: String = result["updated_at"] as! String
                    self.label.text=text
                } else if response.response?.statusCode == 409{
                    print("同じメールアドレスがすでに登録されています。")
                }
            }
        }

        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
