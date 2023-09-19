//
//  ViewController.swift
//  iOS_Calculating
//
//  Created by Nazym Sayakhmet on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let topContainerView = UIView()
    let bottomContainerView = UIView()
    
    let displayLabel = UILabel()
    let mainStackView = UIStackView()
    let firstStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    let fifthStackView = UIStackView()
    
    let zeroButton = UIButton()
    let oneButton = UIButton()
    let twoButton = UIButton()
    let threeButton = UIButton()
    let fourButton = UIButton()
    let fiveButton = UIButton()
    let sixButton = UIButton()
    let sevenButton = UIButton()
    let eightButton = UIButton()
    let nineButton = UIButton()
    
    let clearButton = UIButton()
    let plusMinusButton = UIButton()
    let percentButton = UIButton()
    let divisionButton = UIButton()
    let multiplicationButton = UIButton()
    let substractionButton = UIButton()
    let additionButton = UIButton()
    let equalButton = UIButton()
    let decimalButton = UIButton()
    
    var userInput = ""
    var allCleanTouched = false
    var firstInput = ""
    var secondInput = ""
  //  var resultDisplay = ""
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentOperation: Operation?
    var hasResult = false
    var isNegative = false
    
    
    enum Operation {
    case add, substract, multiply, divide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        
        let topHeightProportion: CGFloat = 0.25
        let bottomHeightProportion: CGFloat = 0.75
        
        let screenHeight = UIScreen.main.bounds.height
        let topHeight = screenHeight * topHeightProportion
        let bottomHeight = screenHeight * bottomHeightProportion
        topContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: topHeight)
        bottomContainerView.frame = CGRect(x: 0, y: topHeight, width: view.frame.width, height: bottomHeight)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        displayLabel.text = "0"
        displayLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 90, weight: .light)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.addSubview(displayLabel)
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 15
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.addSubview(mainStackView)
        
        firstStackView.axis = .horizontal
        firstStackView.distribution = .equalSpacing
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(firstStackView)
        
    
        clearButton.setTitle("AC", for: .normal)
            clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        clearButton.configureButton()
        clearButton.addTarget(self, action: #selector(allCleanPressed), for: .touchDown)
        firstStackView.addArrangedSubview(clearButton)
        
        plusMinusButton.setImage(UIImage(systemName: "plus.slash.minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .medium)), for: .normal)
        plusMinusButton.tintColor = .black
        plusMinusButton.contentMode = .scaleAspectFit
        plusMinusButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        plusMinusButton.configureButton()
        plusMinusButton.addTarget(self, action: #selector(plusMinusPressed), for: .touchDown)
        firstStackView.addArrangedSubview(plusMinusButton)
        
        percentButton.setImage(UIImage(systemName: "percent", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .medium)), for: .normal)
        percentButton.tintColor = .black
        percentButton.contentMode = .scaleAspectFill
        percentButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        percentButton.configureButton()
        firstStackView.addArrangedSubview(percentButton)
        
        divisionButton.setImage(UIImage(systemName: "divide", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)), for: .normal)
        divisionButton.tintColor = .white
        divisionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        divisionButton.configureButton()
        divisionButton.addTarget(self, action: #selector(divide), for: .touchDown)
        firstStackView.addArrangedSubview(divisionButton)
        
        secondStackView.axis = .horizontal
        secondStackView.distribution = .equalSpacing
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(secondStackView)
        
        sevenButton.setTitle("7", for: .normal)
        sevenButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        sevenButton.configureButton()
        sevenButton.addTarget(self, action: #selector(sevenPressed), for: .touchDown)
        secondStackView.addArrangedSubview(sevenButton)
        
        eightButton.setTitle("8", for: .normal)
        eightButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        eightButton.configureButton()
        eightButton.addTarget(self, action: #selector(eightPressed), for: .touchDown)
        secondStackView.addArrangedSubview(eightButton)
        
        nineButton.setTitle("9", for: .normal)
        nineButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        nineButton.configureButton()
        nineButton.addTarget(self, action: #selector(ninePressed), for: .touchDown)
        secondStackView.addArrangedSubview(nineButton)
        
        multiplicationButton.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)), for: .normal)
        multiplicationButton.tintColor = .white
        multiplicationButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        multiplicationButton.configureButton()
        multiplicationButton.addTarget(self, action: #selector(multiply), for: .touchDown)
        secondStackView.addArrangedSubview(multiplicationButton)
        
        thirdStackView.axis = .horizontal
        thirdStackView.distribution = .equalSpacing
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(thirdStackView)
        
        fourButton.setTitle("4", for: .normal)
        fourButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        fourButton.configureButton()
        fourButton.addTarget(self, action: #selector(fourPressed), for: .touchDown)
        thirdStackView.addArrangedSubview(fourButton)
        
        fiveButton.setTitle("5", for: .normal)
        fiveButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        fiveButton.configureButton()
            fiveButton.addTarget(self, action: #selector(fivePressed), for: .touchDown)
        thirdStackView.addArrangedSubview(fiveButton)
        
        sixButton.setTitle("6", for: .normal)
        sixButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        sixButton.configureButton()
        sixButton.addTarget(self, action: #selector(sixPressed), for: .touchDown)
        thirdStackView.addArrangedSubview(sixButton)
        
        substractionButton.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)), for: .normal)
        substractionButton.tintColor = .white
        substractionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        substractionButton.configureButton()
        substractionButton.addTarget(self, action: #selector(substract), for: .touchDown)
        thirdStackView.addArrangedSubview(substractionButton)
        
        fourthStackView.axis = .horizontal
        fourthStackView.distribution = .equalSpacing
        fourthStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(fourthStackView)
        
        oneButton.setTitle("1", for: .normal)
        oneButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        oneButton.configureButton()
        oneButton.addTarget(self, action: #selector(onePressed), for: .touchDown)
        fourthStackView.addArrangedSubview(oneButton)
        
        twoButton.setTitle("2", for: .normal)
        twoButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        twoButton.configureButton()
        twoButton.addTarget(self, action: #selector(twoPressed), for: .touchDown)
        fourthStackView.addArrangedSubview(twoButton)
        
        threeButton.setTitle("3", for: .normal)
        threeButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        threeButton.configureButton()
        threeButton.addTarget(self, action: #selector(threePressed), for: .touchDown)
        fourthStackView.addArrangedSubview(threeButton)
        
        additionButton.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)), for: .normal)
        additionButton.tintColor = .white
        additionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        additionButton.configureButton()
        additionButton.addTarget(self, action: #selector(add), for: .touchDown)
        fourthStackView.addArrangedSubview(additionButton)
        
        fifthStackView.axis = .horizontal
        fifthStackView.distribution = .equalSpacing
        fifthStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(fifthStackView)
        
        zeroButton.setTitle("0", for: .normal)
        zeroButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        zeroButton.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        zeroButton.layer.cornerRadius = 40
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        zeroButton.addTarget(self, action: #selector(zeroPressed), for: .touchDown)
        fifthStackView.addArrangedSubview(zeroButton)
        
        decimalButton.setTitle(",", for: .normal)
        decimalButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        decimalButton.configureButton()
        decimalButton.addTarget(self, action: #selector(decimalPressed), for: .touchDown)
        fifthStackView.addArrangedSubview(decimalButton)
        
        equalButton.setImage(UIImage(systemName: "equal", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)), for: .normal)
        equalButton.tintColor = .white
        equalButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        equalButton.configureButton()
        equalButton.addTarget(self, action: #selector(equalPressed), for: .touchDown)
        fifthStackView.addArrangedSubview(equalButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 15),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            zeroButton.heightAnchor.constraint(equalToConstant: 80),
            zeroButton.widthAnchor.constraint(equalToConstant: 175)
        ])
        
    }
    
   @objc func onePressed() {
       if hasResult {
           userInput = ""
           userInput = "1"
           displayLabel.text = userInput
           hasResult = false
       } else {
           displayLabel.text = ""
           userInput += "1"
           displayLabel.text! = userInput
       }
    }
    
    @objc func twoPressed() {
        if hasResult {
            userInput = ""
            userInput = "2"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "2"
            displayLabel.text! = userInput
        }
    }
    
    @objc func threePressed() {
        if hasResult {
            userInput = ""
            userInput = "3"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "3"
            displayLabel.text! = userInput
        }
    }
    @objc func fourPressed() {
        if hasResult {
            userInput = ""
            userInput = "4"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "4"
            displayLabel.text! = userInput
        }
    }
    @objc func fivePressed() {
        if hasResult {
            userInput = ""
            userInput = "5"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "5"
            displayLabel.text! = userInput
        }
    }
    @objc func sixPressed() {
        if hasResult {
            userInput = ""
            userInput = "6"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "6"
            displayLabel.text! = userInput
        }
    }
    @objc func sevenPressed() {
        if hasResult {
            userInput = ""
            userInput = "7"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "7"
            displayLabel.text! = userInput
        }
    }
    @objc func eightPressed() {
        if hasResult {
            userInput = ""
            userInput = "8"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "8"
            displayLabel.text! = userInput
        }
    }
    @objc func ninePressed() {
        if hasResult {
            userInput = ""
            userInput = "9"
            displayLabel.text = userInput
            hasResult = false
        } else {
            displayLabel.text = ""
            userInput += "9"
            displayLabel.text! = userInput
        }
    }
    @objc func zeroPressed() {
        if hasResult {
            return
        } else {
            displayLabel.text = ""
            userInput += "0"
            displayLabel.text! = userInput
        }
    }
    
    @objc func plusMinusPressed() {
        if userInput == "" {
            return
        }
        isNegative.toggle()
           if isNegative {
               userInput = "-" + userInput
               isNegative = false
           } else {
               userInput.removeFirst()
           }
        displayLabel.text! = userInput
    }
    @objc func decimalPressed() {
        if userInput.contains(".") {
            return
        }
            displayLabel.text = ""
            userInput += "."
            displayLabel.text! = userInput
    }
    @objc func allCleanPressed() {
        userInput = ""
        displayLabel.text! = "0"
        hasResult = false
        isNegative = false
        currentOperation = nil
    }
    
    @objc func add() {
        if currentOperation != nil {
            return
        } else {
            if let value = Double(userInput) {
                firstNumber = value
                userInput = ""
            }
            currentOperation = .add
        }
    }
    
    @objc func substract() {
        if currentOperation != nil {
            return
        } else {
            if let value = Double(userInput) {
                firstNumber = value
                userInput = ""
            }
            currentOperation = .substract
        }
    }
    @objc func multiply() {
        if currentOperation != nil {
            return
        } else {
            if let value = Double(userInput) {
                firstNumber = value
                userInput = ""
            }
            currentOperation = .multiply
        }
    }
    @objc func divide() {
        if currentOperation != nil {
            return
        } else {
            if let value = Double(userInput) {
                firstNumber = value
                userInput = ""
            }
            currentOperation = .divide
        }
    }
    
     @objc func equalPressed() {
            if let value = Double(userInput) {
                secondNumber = value
            }
         if let operation = currentOperation {
             switch operation {
             case .add:
                 let result = firstNumber + secondNumber
                 let roundedResult = round(result * 100000000) / 100000000
                 let numberFormatter = NumberFormatter()
                 numberFormatter.minimumFractionDigits = 0
                 numberFormatter.maximumFractionDigits = 15

                 if let formattedResult = numberFormatter.string(from: NSNumber(value: roundedResult)) {
                     displayLabel.text = formattedResult
                 } else {
                     displayLabel.text = "Error"
                 }
                 userInput = "\(result)"
                 hasResult = true
                 currentOperation = nil
                 break
             case .substract:
                 let result = firstNumber - secondNumber
                 let roundedResult = round(result * 100000000) / 100000000
                 let numberFormatter = NumberFormatter()
                 numberFormatter.minimumFractionDigits = 0
                 numberFormatter.maximumFractionDigits = 15

                 if let formattedResult = numberFormatter.string(from: NSNumber(value: roundedResult)) {
                     displayLabel.text = formattedResult
                 } else {
                     displayLabel.text = "Error"
                 }
                 userInput = "\(result)"
                 hasResult = true
                 currentOperation = nil
                 break
             case .multiply:
                 let result = firstNumber * secondNumber
                 let roundedResult = round(result * 100000000) / 100000000
                 let numberFormatter = NumberFormatter()
                 numberFormatter.minimumFractionDigits = 0
                 numberFormatter.maximumFractionDigits = 15

                 if let formattedResult = numberFormatter.string(from: NSNumber(value: roundedResult)) {
                     displayLabel.text = formattedResult
                 } else {
                     displayLabel.text = "Error"
                 }
                 userInput = "\(result)"
                 hasResult = true
                 currentOperation = nil
                 break
             case .divide:
                 if secondNumber != 0 {
                     let result = firstNumber / secondNumber
                     let roundedResult = round(result * 100000000) / 100000000
                     let numberFormatter = NumberFormatter()
                     numberFormatter.minimumFractionDigits = 0
                     numberFormatter.maximumFractionDigits = 15

                     if let formattedResult = numberFormatter.string(from: NSNumber(value: roundedResult)) {
                         displayLabel.text = formattedResult
                     } else {
                         displayLabel.text = "Error"
                     }
                     userInput = "\(result)"
                     hasResult = true
                     currentOperation = nil
                 } else {
                     displayLabel.text = "Error"
                 }
             }
         }
        }
}

