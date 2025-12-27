/// DAY 9: Enums & TaskStatus
/// 
/// Today (Done in main.move):
/// 1. Learnt about enums
/// 2. Replaced bool with an enum
/// 3. Used match expressions

module challenge::day_09 {
    use std::string::String;

    // Copy Task struct from day_08, but we'll update it

    // TODO: Define an enum called 'TaskStatus' with two variants:
    // - Open // - Completed // Add 'copy' and 'drop' abilities
    // Task status enum
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    // TODO: Update Task struct to use TaskStatus instead of done: bool
    // Task struct using TaskStatus instead of bool
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus, // Changed from done: bool
    }

    // TODO: Update new_task to set status = TaskStatus::Open
    // Constructor that sets status to Open
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

     // TODO: Write a function 'is_open' that checks if task.status == TaskStatus::Open
    // Check if a task is open
    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }
}