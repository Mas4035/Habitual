//
//  HabitDetailViewController.swift
//  Habitual
//
//  Created by Student Guest on 4/10/23.
//




import UIKit

class HabitDetailViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    var habit: Habit!
    var habitIndex: Int!

    private var persistence = PersistenceLayer()

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonAction(_ sender: Any) {
    }
    
    @IBAction func pressActionButton(_ sender: Any) {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    private func updateUI() {
        title = habit.title
    imageView.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
        labelStartingDate.text = habit.dateCreated.stringValue

        if habit.completedToday {
           // buttonAction.setTitle("Completed for Today!", for: .normal)
            button.setTitle("Completed for Today!", for: .normal)
        } else {
           // buttonAction.setTitle("Mark as Completed", for: .normal)
            button.setTitle("Mark as Completed", for: .normal)
        }
    }
}
