//
//  ViewController.swift
//  iOS_Calculating
//
//  Created by Nazym Sayakhmet on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let userInput = UILabel()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        userInput.text = "123"
        userInput.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        userInput.textAlignment = .right
        userInput.font = UIFont.systemFont(ofSize: 90, weight: .light)
        userInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userInput)
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 15
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        
        firstStackView.axis = .horizontal
        firstStackView.distribution = .equalSpacing
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(firstStackView)
        
        clearButton.setTitle("AC", for: .normal)
            clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        clearButton.configureButton()
        firstStackView.addArrangedSubview(clearButton)
        
        plusMinusButton.setImage(UIImage(systemName: "plus.slash.minus"), for: .normal)
        plusMinusButton.tintColor = .black
        plusMinusButton.contentMode = .scaleAspectFit
        plusMinusButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        plusMinusButton.configureButton()
        firstStackView.addArrangedSubview(plusMinusButton)
        
        percentButton.setImage(UIImage(systemName: "percent"), for: .normal)
        percentButton.tintColor = .black
        percentButton.contentMode = .scaleAspectFill
        percentButton.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        percentButton.configureButton()
        firstStackView.addArrangedSubview(percentButton)
        
        divisionButton.setImage(UIImage(systemName: "divide"), for: .normal)
        divisionButton.tintColor = .white
        divisionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        divisionButton.configureButton()
        firstStackView.addArrangedSubview(divisionButton)
        
        secondStackView.axis = .horizontal
        secondStackView.distribution = .equalSpacing
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(secondStackView)
        
        sevenButton.setTitle("7", for: .normal)
        sevenButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        sevenButton.configureButton()
        secondStackView.addArrangedSubview(sevenButton)
        
        eightButton.setTitle("8", for: .normal)
        eightButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        eightButton.configureButton()
        secondStackView.addArrangedSubview(eightButton)
        
        nineButton.setTitle("9", for: .normal)
        nineButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        nineButton.configureButton()
        secondStackView.addArrangedSubview(nineButton)
        
        multiplicationButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        multiplicationButton.tintColor = .white
        multiplicationButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        multiplicationButton.configureButton()
        secondStackView.addArrangedSubview(multiplicationButton)
        
        thirdStackView.axis = .horizontal
        thirdStackView.distribution = .equalSpacing
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(thirdStackView)
        
        fourButton.setTitle("4", for: .normal)
        fourButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        fourButton.configureButton()
        thirdStackView.addArrangedSubview(fourButton)
        
        fiveButton.setTitle("5", for: .normal)
        fiveButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        fiveButton.configureButton()
        thirdStackView.addArrangedSubview(fiveButton)
        
        sixButton.setTitle("6", for: .normal)
        sixButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        sixButton.configureButton()
        thirdStackView.addArrangedSubview(sixButton)
        
        substractionButton.setImage(UIImage(systemName: "minus"), for: .normal)
        substractionButton.tintColor = .white
        substractionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        substractionButton.configureButton()
        thirdStackView.addArrangedSubview(substractionButton)
        
        fourthStackView.axis = .horizontal
        fourthStackView.distribution = .equalSpacing
        fourthStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(fourthStackView)
        
        oneButton.setTitle("1", for: .normal)
        oneButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        oneButton.configureButton()
        fourthStackView.addArrangedSubview(oneButton)
        
        twoButton.setTitle("2", for: .normal)
        twoButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        twoButton.configureButton()
        fourthStackView.addArrangedSubview(twoButton)
        
        threeButton.setTitle("3", for: .normal)
        threeButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        threeButton.configureButton()
        fourthStackView.addArrangedSubview(threeButton)
        
        additionButton.setImage(UIImage(systemName: "plus"), for: .normal)
        additionButton.tintColor = .white
        additionButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        additionButton.configureButton()
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
        fifthStackView.addArrangedSubview(zeroButton)
        
        decimalButton.setTitle(",", for: .normal)
        decimalButton.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        decimalButton.configureButton()
        fifthStackView.addArrangedSubview(decimalButton)
        
        equalButton.setImage(UIImage(systemName: "equal"), for: .normal)
        equalButton.tintColor = .white
        equalButton.backgroundColor = UIColor(red: 242/255, green: 163/255, blue: 60/255, alpha: 1)
        equalButton.configureButton()
        fifthStackView.addArrangedSubview(equalButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            userInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: userInput.bottomAnchor, constant: 15),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            zeroButton.heightAnchor.constraint(equalToConstant: 80),
            zeroButton.widthAnchor.constraint(equalToConstant: 175)
        ])
        
    }


}

