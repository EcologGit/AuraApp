//
//  ReportViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit


class ReportViewController: UIViewController, UITextViewDelegate, PlaceReportViewControllerDelegate, PointReportDelegate {
    
    weak var delegate: PlaceReportViewControllerDelegate?
    weak var pointDelegate: PointReportViewController?
    var selectedImage: UIImage?
    var accessToken: String = ""
    var selectedOption: String = ""
    var selectedOptionID: Int = 0
    var selectedPointID: Int = 0
    let rateInputView = RateInputView()
    let wasteInputView = WasteInputView()
    
    struct Media {
        let key: String
        let filename: String
        let data: Data
        let mimeType: String
        
        init?(withImage image: UIImage, forKey key: String) {
            self.key = key
            self.mimeType = "image/jpeg"
            self.filename = "imagefile.jpg"
            guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
            self.data = data
        }
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let objectInformationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Информация об объекте"
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let buttonsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var placeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тип и название объекта", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        button.setImage(UIImage(named: "chevronRight"), for: .normal)
        button.tintColor = .gray
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(placeActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        let spacing: CGFloat = 139
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
        
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray // Adjust the color as needed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pointButton: UIButton = {
        let button = UIButton()
        button.setTitle("Точка сортировки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        button.setImage(UIImage(named: "chevronRight"), for: .normal)
        button.tintColor = .gray
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(pointActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        let spacing: CGFloat = 181
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
        
        return button
    }()
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Фото*"
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var photoButton: UIButton = {
        let button = UIButton()
        button.setTitle("ДОБАВИТЬ ФОТО", for: .normal)
        button.backgroundColor = UIColor(named: "DarkGrey")
        button.layer.cornerRadius = 22
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "photoIcon"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(photoActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 8
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Описание*"
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Расскажите, как все прошло"
        textView.textColor = UIColor.lightGray
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return textView
    }()
    
    let annotationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Поля, обязательные к заполнению*"
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("ОПУБЛИКОВАТЬ", for: .normal)
        button.backgroundColor = UIColor(named: "DarkGrey")
        button.layer.cornerRadius = 22
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "postIcon"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(postActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 8
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    lazy var draftButton: UIButton = {
        let button = UIButton()
        button.setTitle("СОХРАНИТЬ ЧЕРНОВИК", for: .normal)
        button.setTitleColor(UIColor(named: "DarkGrey"), for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "draftIcon"), for: .normal)
        button.tintColor = UIColor(named: "DarkGrey")
        button.addTarget(self, action: #selector(draftActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 4
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(objectInformationLabel)
        scrollView.addSubview(buttonsView)
        scrollView.addSubview(placeButton)
        scrollView.addSubview(lineView)
        scrollView.addSubview(pointButton)
        scrollView.addSubview(photoLabel)
        scrollView.addSubview(photoButton)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(descriptionTextView)
        scrollView.addSubview(rateInputView)
        scrollView.addSubview(wasteInputView)
        scrollView.addSubview(annotationLabel)
        scrollView.addSubview(postButton)
        scrollView.addSubview(draftButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            objectInformationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            objectInformationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            buttonsView.topAnchor.constraint(equalTo: objectInformationLabel.bottomAnchor, constant: 8),
            buttonsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonsView.heightAnchor.constraint(equalToConstant: 90),
            buttonsView.widthAnchor.constraint(equalToConstant: 358),
            buttonsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            placeButton.topAnchor.constraint(equalTo: buttonsView.topAnchor),
            placeButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            placeButton.heightAnchor.constraint(equalToConstant: 45),
            placeButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            placeButton.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 45),
            
            lineView.topAnchor.constraint(equalTo: placeButton.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            pointButton.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 45),
            pointButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            pointButton.heightAnchor.constraint(equalToConstant: 45),
            pointButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            pointButton.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 90),
            
            photoLabel.topAnchor.constraint(equalTo: buttonsView.bottomAnchor, constant: 16),
            photoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            photoButton.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 8),
            photoButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            photoButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            photoButton.heightAnchor.constraint(equalToConstant: 44),
            
            descriptionLabel.topAnchor.constraint(equalTo: photoButton.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 132),
            
            rateInputView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            rateInputView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            rateInputView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            rateInputView.heightAnchor.constraint(equalToConstant: 172),
            
            wasteInputView.topAnchor.constraint(equalTo: rateInputView.bottomAnchor, constant: 16),
            wasteInputView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            wasteInputView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            wasteInputView.heightAnchor.constraint(equalToConstant: 292),
            
            annotationLabel.topAnchor.constraint(equalTo: wasteInputView.bottomAnchor, constant: 16),
            annotationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            postButton.topAnchor.constraint(equalTo: annotationLabel.bottomAnchor, constant: 16),
            postButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            postButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            postButton.heightAnchor.constraint(equalToConstant: 44),
            
            draftButton.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 8),
            draftButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            draftButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            draftButton.heightAnchor.constraint(equalToConstant: 17),
            draftButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
        ])
        
    }
    
    @objc func placeActionButton() {
        let placeViewController = PlaceReportViewController()
        placeViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: placeViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    
    func didSelectOption(_ option: String, id: Int) {
        selectedOption = option // Store the selected option
        selectedOptionID = id // Store the selected id
    }
    
    func didSelectPoint(_ pointId: Int) {
        selectedPointID = pointId
    }
    
    @objc func pointActionButton() {
        let pointViewController = PointReportViewController()
        pointViewController.pointDelegate = self
        let navigationController = UINavigationController(rootViewController: pointViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func photoActionButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func postActionButton() {
        guard let accessToken = UserDefaults.standard.string(forKey: "AccessToken") else {
            print("Access token is missing")
            return
        }
        let authorizationHeaderValue = "Bearer " + accessToken
        let description = descriptionTextView.text ?? ""
        
        guard let availabilityText = rateInputView.transportTextField.text,
              let availability = Int(availabilityText) else { return }
        
        guard let beautyText = rateInputView.beautyTextField.text,
              let beauty = Int(beautyText) else { return }
        
        guard let purityText = rateInputView.pollutionTextField.text,
              let purity = Int(purityText) else { return }
        
        guard let plasticText = wasteInputView.plasticTextField.text,
              let plastic = Int(plasticText) else { return }
        
        guard let batteriesText = wasteInputView.batteryTextField.text,
              let batteries = Int(batteriesText) else { return }
        
        guard let bulbText = wasteInputView.bulbTextField.text,
              let bulb = Int(bulbText) else { return }
        
        guard let paperText = wasteInputView.paperTextField.text,
              let paper = Int(paperText) else { return }
        
        guard let metallText = wasteInputView.metalTextField.text,
              let metall = Int(metallText) else { return }
        
        guard let glassText = wasteInputView.glassTextField.text,
              let glass = Int(glassText) else { return }
        
        guard let image = selectedImage else {
            print("No image selected")
            return
        }
        
        guard let fileURL = saveImageToFile(image) else {
            print("Failed to save image to file")
            return
        }
        
        guard let filePath = fileURL.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            print("Failed to encode file path")
            return
        }
        
        let parameters = [
            [
                "key": "description",
                "value": description,
                "type": "text",
                "contentType": "text/plain"
            ],
            [
                "key": "photo",
                "src": filePath,
                //                "src": "/path/to/file",
                "type": "file"
            ],
            [
                "key": "rate",
                "value": "{\"availability\": \(availability), \"beauty\": \(beauty), \"purity\": \(purity)}",
                "type": "text"
            ],
            [
                "key": "results",
                "value": "[{\"waste_id\":{\"name\": \"Крышечки\", \"unit_of_waste\": \"шт\"}, \"amount\": \(metall)}]",
                "type": "text"
            ],
            [
                "key": "report_status",
                "value": "Принят",
                "type": "text"
            ],
            [
                "key": "point_id",
                "value": String(selectedPointID),
                "type": "text"
            ],
            [
                "key": "type_obj",
                "value": selectedOption,
                "type": "text"
            ],
            [
                "key": "id_obj",
                "value": String(selectedOptionID),
                "type": "text"
            ]
        ] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"] as! String
            body += "--\(boundary)\r\n"
            body += "Content-Disposition: form-data; name=\"\(paramName)\""
            if let contentType = param["contentType"] as? String {
                body += "\r\nContent-Type: \(contentType)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String
                let fileData = try! NSData(contentsOfFile: paramSrc, options: []) as Data
                let fileContent = String(data: fileData, encoding: .utf8)!
                body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
        }
        print(parameters)
        body += "--\(boundary)--\r\n"
        let postData = body.data(using: .utf8)
        
        guard let url = URL(string: "http://81.163.30.36:8000/report/create_report/") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.addValue(authorizationHeaderValue, forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }
        
        task.resume()
        
    }
    
    func saveToDocuments(image: UIImage) throws -> URL
    {
        let imageFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imageURL = imageFolder.appendingPathComponent("\(UUID()).jpg")
        let jpegData = image.jpegData(compressionQuality: 0.8)
        try jpegData?.write(to: imageURL, options: .atomic)
        return imageURL
    }
    
    @objc func draftActionButton() {
    }
    
}

extension ReportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        // Store the selected image
        selectedImage = image
        
        dismiss(animated: true, completion: nil)
    }
    
    func saveImageToFile(_ image: UIImage) -> String? {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Failed to convert image to JPEG data")
            return nil
        }
        
        let fileManager = FileManager.default
        let temporaryDirectory = NSTemporaryDirectory()
        let fileName = UUID().uuidString + ".jpeg"
        let fileURL = URL(fileURLWithPath: temporaryDirectory).appendingPathComponent(fileName)
        
        do {
            try imageData.write(to: fileURL)
            return fileURL.path
        } catch {
            print("Failed to save image to file: \(error)")
            return nil
        }
    }
}

