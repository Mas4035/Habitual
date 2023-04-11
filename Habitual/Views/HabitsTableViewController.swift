//
//  MainViewController.swift
//  Habitual
//
//  Created by Student Guest on 3/20/23.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    private var persistence = PersistenceLayer()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        let habit = persistence.habits[indexPath.row]
      cell.configure(habit) // Shows an error, you'll fix this next!

      return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar() // Call the new method
        
        tableView.register(
          HabitTableViewCell.nib,
          forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistence.setNeedsToReloadHabits()
        tableView.reloadData()
    }
}


// extension
extension HabitsTableViewController {
    func setupNavBar() {
        title = "Habitual" // Add a title to the nav bar
        // Create a UIBarButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        // Add the barbuttonitem to the navbar
        navigationItem.rightBarButtonItem = addButton
    }

    // This function handle taps on the bar button item, see #selector above
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVC = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

