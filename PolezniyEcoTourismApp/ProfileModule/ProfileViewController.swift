//
//  ProfileViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let logInView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Электронная почта"
        textField.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "logInIcon")
        button.setTitle("ВОЙТИ", for: .normal)
        button.backgroundColor = UIColor(named: "Green")
        button.layer.cornerRadius = 22
        button.setTitleColor(UIColor(named: "DarkGrey"), for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(logInActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 8
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("ЗАРЕГЕСТРИРОВАТЬСЯ", for: .normal)
        button.setTitleColor(UIColor(named: "DarkGrey"), for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "signUpIcon"), for: .normal)
        button.tintColor = UIColor(named: "DarkGrey")
        button.addTarget(self, action: #selector(signUpActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 4
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(logInView)
        view.addSubview(mailTextField)
        view.addSubview(lineView)
        view.addSubview(passTextField)
        view.addSubview(logInButton)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInView.heightAnchor.constraint(equalToConstant: 90),
            logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            mailTextField.topAnchor.constraint(equalTo: logInView.topAnchor),
            mailTextField.leadingAnchor.constraint(equalTo: logInView.leadingAnchor, constant: 16),
            mailTextField.trailingAnchor.constraint(equalTo: logInView.trailingAnchor, constant: -16),
            mailTextField.heightAnchor.constraint(equalToConstant: 44),
                        
            lineView.topAnchor.constraint(equalTo: mailTextField.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: logInView.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: logInView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
                        
            passTextField.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            passTextField.leadingAnchor.constraint(equalTo: logInView.leadingAnchor, constant: 16),
            passTextField.trailingAnchor.constraint(equalTo: logInView.trailingAnchor, constant: -16),
            passTextField.heightAnchor.constraint(equalToConstant: 44),
            
            logInButton.topAnchor.constraint(equalTo: logInView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 44),
            
            signUpButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 8),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signUpButton.heightAnchor.constraint(equalToConstant: 17),
            
        ])
        
    }
    

    @objc func logInActionButton() {
        guard let username = mailTextField.text, let password = passTextField.text else {
            print("Username or password is missing")
            return
        }
        
        let parameters = [
            [
                "key": "username",
                "value": username,
                "type": "text"
            ],
            [
                "key": "password",
                "value": password,
                "type": "text"
            ]
        ] as [[String: Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""

        for param in parameters {
            if param["disabled"] != nil {
                continue
            }

            let paramName = param["key"]!

            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""

            if param["contentType"] != nil {
                body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }

            let paramType = param["type"] as! String

            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String

                do {
                    let fileData = try Data(contentsOf: URL(fileURLWithPath: paramSrc))
                    let fileContent = String(data: fileData, encoding: .utf8)!

                    body += "; filename=\"\(paramSrc)\"\r\n"
                        + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                } catch {
                    print("Error reading file data: \(error)")
                    return
                }
            }
        }

        body += "--\(boundary)--\r\n"
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://81.163.30.36:8000/users/api/mobile_token/")!, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error in data task: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")

                // Assuming the response contains the access token in JSON format
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let accessToken = json["access"] as? String {
                        // Store the access token
                        UserDefaults.standard.set(accessToken, forKey: "AccessToken")
                        // Use the access token as needed
                        print("Access Token: \(accessToken)")
                    }
                } catch {
                    print("Failed to parse JSON: \(error)")
                }
            }
        }

        task.resume()
    }

    
    @objc func signUpActionButton() {
        print("Sign Up button tapped")
    }
}
