# MVVMPatternTutorial-iOS
π λΉμ€λ λ  MVVM ν¨ν΄ λμλ

# π Design Pattern

- λμμΈ ν¨ν΄μ μ νκ² λλ©΄ λͺ¨λ  ν΄λμ€μ μμ±μ κ΅¬μ‘°μ μΌλ‘ μ λ¦¬κ°λ₯νλ©° ν μμ μ μνν μμ¬μν΅κ³Ό μ½λ μμ μ΄ κ°λ₯νλ€.

### βοΈ MVVM(Model-View-ViewModel)

- MVC ν¨ν΄μ Controller κ° μ»€μ§λ λ¬Έμ λ₯Ό View Model μ λ μΌλ‘μ¨ ν΄κ²°νκ³ μ νλ€.
- Model μμ κ°μ Έμ¨ View μ μλ°μ΄νΈν  λ°μ΄ν°λ₯Ό View Model μ΄ μ²λ¦¬νκ²ν¨μΌλ‘μ¨ Controller κ° λ³΅μ‘ν΄μ§λ κ²μ μ€μ¬μ€λ€. μ¦, View Model μ presentation logic μ λ€λ£¨κ² λμ§λ§ UI λ λ€λ£¨μ§ μλλ€.

<img src="https://user-images.githubusercontent.com/69136340/130466693-b98be596-2593-4a6a-98be-b373f4e1b4dd.PNG" width ="600">

- MVVM μμ View Model μ View μ 1:n κ΄κ³λ₯Ό μ΄λ£¬λ€. View μ View Model κ°μλ λ°μ΄ν° λ°μΈλ©μ ν΅ν΄ νΉμ  View μ μμ±κ³Ό View Model μμ±μ μ°κ²°ν λ€ View Model μμ±μ΄ λ³κ²½λλ©΄ μλμΌλ‘ View λ₯Ό μλ°μ΄νΈ.

**Data Binding**

:  View Modelκ³Ό View λΒ μλ‘μκ² λ°μ΄ν°μ λ³κ²½μ μλ €μ€ μ μλ λ°©λ²μ΄ νμνλ€. μ΄κ²μ΄ λ°λ‘Β Data Binding μ΄λ€. 

### Model

- Model μ View λ View Model κ³Ό κ΄κ³μμ΄ λλ¦½μ μΌλ‘ κ΅¬μ±. μ±μ΄ μ¬μ©μμκ² λ³΄μ¬μ§λ λͺ¨μ΅μ΄λ μ κ³΅λ°©μκ³Ό κ΄λ ¨μ΄ μλ€.

### View

- μ¬μ©μκ° λ³Ό μ μλ μμλ€. μ΄λ²€νΈ λ°μ μ  View λ View Model μ μλ¦°λ€. View λ View Model μλ§ μ κ·Ό κ°λ₯. View μ event λ₯Ό View Model μκ² μλ €μ£Όλ©΄ View Model μ΄ Model μ μλ°μ΄νΈ μν¨λ€.

### View Model

- Model κ³Ό View μ μ€κ°μ. View Model μ View μ μνλ₯Ό μ μ₯νκ³ , View μμ λ°μνλ μ‘μμ λ°λΌ μνν  μ±μ κΈ°λ₯μ μ μνλ λͺλ Ήμ κ΅¬ν. View Model μ View κ° μ΄λ€ λͺ¨μ΅μΈμ§ μ ν μμ§ λͺ»νλ€.

### μ₯λ¨μ 

- μ₯μ  : ViewModel μ View μ λλ¦½μ μ΄λ€. μ¦ UIKit κ΄λ ¨ μ½λκ° μλ€. λ°λΌμ MVC λͺ¨λΈλ³΄λ€ μ λ νμ€ννκΈ°κ° μ’λ€.(View μ View Model κ°μ μμ‘΄μ±μ΄ μκΈ° λλ¬Έ)
- λ¨μ  : ViewModel μ€κ³κ° λ§λ§μΉ μλ€. View μ λν μ²λ¦¬κ° λ³΅μ‘ν΄μ§μλ‘ ViewModel μ΄ μ€λ²μ€νμ΄ λ  μ μλ€.

### μΆμ²:

[https://eunjin3786.tistory.com/31?category=837198](https://eunjin3786.tistory.com/31?category=837198)

## π μ μ©ν  νλ‘μ νΈ

- νλ‘νμ¬μ§ μμ λ²νΌμ λλ₯΄λ©΄ μ΄λ―Έμ§ λ³κ²½
- νμ€νΈνλμ νμ€νΈλ₯Ό μλ ₯ ν λ²νΌμ λλ₯΄λ©΄ λΌλ²¨μ νμ€νΈ λ³κ²½

<img src ="https://user-images.githubusercontent.com/69136340/130536969-748e7b45-6f4a-4b7e-a72a-3308e7ab7f11.gif" width ="250">

## π Data Binding

μ°μ  data binding μ λν΄μ μμλ³΄μ. κ°μ₯ μ½κ³  λλ¦¬ μλ €μ§ Observable νν¬λμ μ¬μ©ν  κ²μ΄λ€. Observable μ΄λΌλ ν΄λμ€λ₯Ό μμ±ν΄μ λ°μΈλ© μ­ν μ μνν΄μ£Όλ©΄ λλ€.

- Observable

μ΄ ν΄λμ€λ₯Ό ν΅ν΄μ μνλ κ°μΌλ‘ μ΄κΈ°νν΄μ£Όκ³ , binding μ­ν μ ν΄μ£Όκ³ , κ°μ κ°μ Έμ€λ ν¨μλ₯Ό μ κ³΅ν  κ²μ΄λ€.

```swift
import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
// β κ°μ΄ λ³ν  λλ§λ€ ν΄λ‘μ  listener λ₯Ό νΈμΆνλ€.(View μ μ‘μμ λ°λΌμ μλμΌλ‘ View Model μ κ°μ΄ μ΅μ ν.)
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

## π MVVM ν¨ν΄ μ μ©

κ°λ¨νκ² μΈμ μ¬ν­μ λ€λ£¨λ νλ‘μ νΈμ μ μ©ν΄λ³΄κ² λ€.

- Person.swift

Model μ­ν 

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

View μ­ν 

<img src ="https://user-images.githubusercontent.com/69136340/130466343-2d11f723-db7d-4960-a361-0cc8bf0aef4b.png" width="500">

```swift
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // β ViewModel μΈμ€ν΄μ€νν΄μ μ¬μ©
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
        
        // β View Model μ΄ μλ°μ΄νΈ λλ©΄ view λ₯Ό λ°κΏ μ μλλ‘ data binding μ νλ€.
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
    
    // β @IBAction μΌλ‘ View Modelμ μλ°μ΄νΈνλ€.
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

- View Model μ­ν 

```swift
import Foundation
import UIKit

public class ViewModel {
    
    // β μλ¬΄ μ€μ  μλ μ΄κΈ°μ View λ₯Ό λ³΄μ¬μ£ΌκΈ°μν λͺ©μ μ λ³μ μ΄κΈ°ν
    let defaultName = "νκΈΈλ"
    let defaultAge = "25"
    let defaultImage = "person"
    
    // β λ³μ μ΄κΈ°ν
    let name = Observable("")
    let age = Observable("")
    // β λ³μμ μλ£ν λͺμ
    let image: Observable<UIImage?> = Observable(nil)
    
    init() {
        setName(to: defaultName)
        setAge(to: defaultAge)
        setImg(to: defaultImage)
    }
    
    // β value λ₯Ό λ°κΎΈμ΄μ didSet μ΄ μ€νλλλ‘ ν¨.
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

## π λ

μ€μ΅μ΄ λλκ³  mvvm ν¨ν΄ μ΄λ―Έμ§λ₯Ό μ΄ν΄λ³΄μλ€. μλλ mvvm μ κ΅¬κΈλ§νλ©΄ λ§μ΄ λ³Ό μ μλ μ΄λ―Έμ§μ΄λ€. μ‘°κΈ λ μ μ΄ν΄ν  μ μκ² λ κ² κ°λ€.

<img width="600" alt="αα³αα³αα΅α«αα£αΊ 2021-08-23 αα©αα? 2 33 35" src="https://user-images.githubusercontent.com/69136340/130466281-f27e1e4d-e177-46ef-9f02-a242350d4dbf.png">

μΆμ² : [https://lsh424.tistory.com/68](https://lsh424.tistory.com/68)

### μΆμ²:

[Data Binding in MVVM on iOS](https://beenii.tistory.com/124)

[[iOS] MVVM ν¨ν΄? μ΄λ€ μ₯μ μ΄ μμκΉ!](https://velog.io/@sso0022/iOS-MVC-μ-MVVM)

[κ°λ¨ν μμ λ‘ μ΄ν΄λ³΄λ iOS Design/Architecture Pattern: MVVM](https://lena-chamna.netlify.app/post/ios_design_pattern_mvvm/#MVVMμ-κ·μΉλ€)

[[iOS] MVVM λμμΈ ν¨ν΄ μ λ¦¬ λ° μμ μ½λ](https://lsh424.tistory.com/68)
