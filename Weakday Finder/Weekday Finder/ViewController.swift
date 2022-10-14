//
//  ViewController.swift
//  Weakday Finder
//
//  Created by iggy on 26.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func findeDayPressed(_ sender: UIButton) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return } // Guard - получаем значения наших свойств не в опциональном типе. Если значение не получено -> ().
        
        let calendar = Calendar.current // Определение календаря
        var dateComponents = DateComponents() // Достаем свойства даты
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru") // Устанавливаем лакацию(язык) свойства
        dateFormatter.dateFormat = "EEEE" //Присваиваем нужный формат вывода дня недели(полный формат)
        
        guard let date = calendar.date(from: dateComponents) else { return } // Извлекаем дату из календаря
        
        let weakday = dateFormatter.string(from: date) // Извлекаем день недели из даты
        let capitalizedWeakday = weakday.capitalized // Первую букву локализации делаем заглавной
        resultLabel.text = capitalizedWeakday
        
        
    }
    
    // Изменяем свойство клавиатуры на number pad в storyboard.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // Скрыти клавиатуры при тапе в любой области view
    }
    
    
    
}

