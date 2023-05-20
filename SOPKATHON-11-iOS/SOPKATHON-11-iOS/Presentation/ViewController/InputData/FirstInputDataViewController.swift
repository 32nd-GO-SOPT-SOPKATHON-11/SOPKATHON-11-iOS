//
//  InputDataViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/20.
//

import UIKit
import PhotosUI

import SnapKit

final class FirstInputDataViewController: BaseViewController {

    // MARK: - Property
    
    let regionData = ["서울", "부산", "인천", "대구", "대전", "광주", "울산", "세종", "강원", "경기", "경상", "전라", "충청"]
    
    private let configuration: PHPickerConfiguration = {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images, .livePhotos])
        return configuration
    }()
    
    // MARK: - UI Property
    
    private let baseView = FirstInputView()
    
    private lazy var picker = PHPickerViewController(configuration: configuration)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setPHPickerAction()
    }
    
    // MARK: - Setting
    
    private func setDelegate() {
        picker.delegate = self
        baseView.regionPickerView.delegate = self
        baseView.regionPickerView.dataSource = self
    }
    
    private func setPHPickerAction() {
        let action = UIAction { [weak self] _ in
            self?.presentPHPicker()
        }
        baseView.addImageViewAction(action)
    }
    
    // MARK: - Action Helper
    
    private func presentPHPicker() {
        self.present(picker, animated: true)
    }
    
    // MARK: - Custom Method

    
}


// MARK: - PHPickerViewControllerDelegate

extension FirstInputDataViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) // 1
        
        let itemProvider = results.first?.itemProvider // 2
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) { // 3
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in // 4
                guard let pickerImage = image as? UIImage
                else { return }
                DispatchQueue.main.async {
                    self.baseView.configureImageView(image: pickerImage)
                }
            }
        } else {
            // TODO: Handle empty results or item provider not being able load UIImage
        }
    }
    
}


extension FirstInputDataViewController: UIPickerViewDelegate {}

extension FirstInputDataViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regionData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regionData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let region = regionData[row]
        baseView.configRegion(to: region)
    }
    
}
