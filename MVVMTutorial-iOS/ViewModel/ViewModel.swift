//
//  ViewModel.swift
//  MVVMTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/23.
//

import Foundation
import UIKit

public class ViewModel {
    
    // 초기화 목적의 변수
    let defaultName = "홍길동"
    let defaultAge = "25"
    let defaultImage = "person"
        
    let name = Observable("")
    let age = Observable("")
    // 초기에는 이미지가 없음.
    let image: Observable<UIImage?> = Observable(nil)
    
    init() {
        setName(to: defaultName)
        setAge(to: defaultAge)
        setImg(to: defaultImage)
    }
    
    // value 를 바꾸어서 didSet 이 실행되도록 함.
    func setName(to name: String) {
        self.name.value = name
    }
    
    func setAge(to age: String) {
        self.age.value = age
    }
    
    func setImg(to image: String) {
        if let image = UIImage(systemName: image) {
            self.image.value = image
        }
    }
}
