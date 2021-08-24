# MVVMPatternTutorial-iOS
🌂 비오는 날 MVVM 패턴 대소동

# 🌂 Design Pattern

- 디자인 패턴을 정하게 되면 모든 클래스와 속성을 구조적으로 정리가능하며 팀 작업 시 원활한 의사소통과 코드 수정이 가능하다.

### ❗️ MVVM(Model-View-ViewModel)

- MVC 패턴의 Controller 가 커지는 문제를 View Model 을 둠으로써 해결하고자 한다.
- Model 에서 가져온 View 에 업데이트할 데이터를 View Model 이 처리하게함으로써 Controller 가 복잡해지는 것을 줄여준다. 즉, View Model 은 presentation logic 을 다루게 되지만 UI 는 다루지 않는다.

<img src="https://user-images.githubusercontent.com/69136340/130466693-b98be596-2593-4a6a-98be-b373f4e1b4dd.PNG" width ="600">

- MVVM 에서 View Model 은 View 와 1:n 관계를 이룬다. View 와 View Model 간에는 데이터 바인딩을 통해 특정 View 의 속성과 View Model 속성을 연결한 뒤 View Model 속성이 변경되면 자동으로 View 를 업데이트.

**Data Binding**

:  View Model과 View 는 서로에게 데이터의 변경을 알려줄 수 있는 방법이 필요하다. 이것이 바로 Data Binding 이다. 

### Model

- Model 은 View 나 View Model 과 관계없이 독립적으로 구성. 앱이 사용자에게 보여지는 모습이나 제공방식과 관련이 없다.

### View

- 사용자가 볼 수 있는 요소들. 이벤트 발생 시  View 는 View Model 에 알린다. View 는 View Model 에만 접근 가능. View 의 event 를 View Model 에게 알려주면 View Model 이 Model 을 업데이트 시킨다.

### View Model

- Model 과 View 의 중개자. View Model 은 View 의 상태를 저장하고, View 에서 발생하는 액션에 따라 수행할 앱의 기능을 정의하는 명령을 구현. View Model 은 View 가 어떤 모습인지 전혀 알지 못한다.

### 장단점

- 장점 : ViewModel 은 View 와 독립적이다. 즉 UIKit 관련 코드가 없다. 따라서 MVC 모델보다 유닛 테스팅하기가 좋다.(View 와 View Model 간의 의존성이 없기 때문)
- 단점 : ViewModel 설계가 만만치 않다. View 에 대한 처리가 복잡해질수록 ViewModel 이 오버스펙이 될 수 있다.

### 출처:

[https://eunjin3786.tistory.com/31?category=837198](https://eunjin3786.tistory.com/31?category=837198)

## 🌂 적용할 프로젝트

- 프로필사진 옆의 버튼을 누르면 이미지 변경
- 텍스트필드에 텍스트를 입력 후 버튼을 누르면 라벨의 텍스트 변경

<img src ="https://user-images.githubusercontent.com/69136340/130536969-748e7b45-6f4a-4b7e-a72a-3308e7ab7f11.gif" width ="250">

## 🌂 Data Binding

우선 data binding 에 대해서 알아보자. 가장 쉽고 널리 알려진 Observable 테크닉을 사용할 것이다. Observable 이라는 클래스를 생성해서 바인딩 역할을 수행해주면 된다.

- Observable

이 클래스를 통해서 원하는 값으로 초기화해주고, binding 역할을 해주고, 값을 가져오는 함수를 제공할 것이다.

```swift
import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
// ✅ 값이 변할 때마다 클로저 listener 를 호출한다.(View 의 액션에 따라서 자동으로 View Model 의 값이 최신화.)
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.listener = closure
        listener?(value)
    }
}
```

## 🌂 MVVM 패턴 적용

간단하게 인적사항을 다루는 프로젝트에 적용해보겠다.

- Person.swift

Model 역할

```swift
import Foundation
import UIKit

struct Person {
    var name: String
    var age: String
    var image: UIImage
}
```

- ViewController.swift & Main.storyboard

View 역할

<img src ="https://user-images.githubusercontent.com/69136340/130466343-2d11f723-db7d-4960-a361-0cc8bf0aef4b.png" width="500">

```swift
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // ✅ ViewModel 인스턴스화해서 사용
    private var personViewModel = ViewModel()
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var setProfileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextfield: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ✅ View Model 이 업데이트 되면 view 를 바꿀 수 있도록 data binding 을 한다.
        personViewModel.image.bind { image in
            self.profileImg.image = image
        }
        
        personViewModel.name.bind { name in
            self.nameLabel.text = name
        }
        
        personViewModel.age.bind { age in
            self.ageLabel.text = age
        }
    }
    
    // MARK: - @IBAction Properties
    
    // ✅ @IBAction 으로 View Model을 업데이트한다.
    @IBAction func touchSetProfile(_ sender: UIButton) {
        personViewModel.setImg(to: "person.fill")
    }
    
    @IBAction func touchSetNameButton(_ sender: UIButton) {
        if let name = nameTextfield.text {
            personViewModel.setName(to: name)
        }
    }
    
    @IBAction func touchSetAgeButton(_ sender: UIButton) {
        if let age = ageTextfield.text {
            personViewModel.setAge(to: age)
        }
    }
}
```

- View Model 역할

```swift
import Foundation
import UIKit

public class ViewModel {
    
    // ✅ 아무 설정 없는 초기의 View 를 보여주기위한 목적의 변수 초기화
    let defaultName = "홍길동"
    let defaultAge = "25"
    let defaultImage = "person"
    
    // ✅ 변수 초기화
    let name = Observable("")
    let age = Observable("")
    // ✅ 변수의 자료형 명시
    let image: Observable<UIImage?> = Observable(nil)
    
    init() {
        setName(to: defaultName)
        setAge(to: defaultAge)
        setImg(to: defaultImage)
    }
    
    // ✅ value 를 바꾸어서 didSet 이 실행되도록 함.
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
```

## 🌂 끝

실습이 끝나고 mvvm 패턴 이미지를 살펴보았다. 아래는 mvvm 을 구글링하면 많이 볼 수 있는 이미지이다. 조금 더 잘 이해할 수 있게 된 것 같다.

<img width="600" alt="스크린샷 2021-08-23 오후 2 33 35" src="https://user-images.githubusercontent.com/69136340/130466281-f27e1e4d-e177-46ef-9f02-a242350d4dbf.png">

출처 : [https://lsh424.tistory.com/68](https://lsh424.tistory.com/68)

### 출처:

[Data Binding in MVVM on iOS](https://beenii.tistory.com/124)

[[iOS] MVVM 패턴? 어떤 장점이 있을까!](https://velog.io/@sso0022/iOS-MVC-와-MVVM)

[간단한 예제로 살펴보는 iOS Design/Architecture Pattern: MVVM](https://lena-chamna.netlify.app/post/ios_design_pattern_mvvm/#MVVM의-규칙들)

[[iOS] MVVM 디자인 패턴 정리 및 예제코드](https://lsh424.tistory.com/68)
