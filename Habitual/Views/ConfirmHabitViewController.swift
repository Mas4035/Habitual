//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Student Guest on 4/5/23.
//

import UIKit

class ConfirmHabitViewController: UIViewController {

    var habitImage: Habit.Images!

    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UILabel!
    
    // ---------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    // ----------------
    
    // Do any additional setup after loading the view.
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
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
