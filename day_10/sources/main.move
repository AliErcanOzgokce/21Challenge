/// DAY 10: Visibility Modifiers (Public vs Private Functions)
/// 
/// Today (Done in main.move):
/// 1. Learnt about visibility modifiers (public vs private)
/// 2. Designed a public API
/// 3. Wrote a function to complete tasks


module challenge::day_10 {
    use std::string::String;

    // Copy from day_09: TaskStatus enum and Task struct
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }

    // TODO: Write a public function 'complete_task' that:
    // - Takes task: &mut Task | - Sets task.status = TaskStatus::Completed
    // Public function - users can call this from outside the module
    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // TODO: (Optional) Write a private helper function
    // Private functions use 'fun' instead of 'public fun'
    // They can only be called from within the same module
     fun internal_helper(task: &Task): bool {
        // Internal validation logic (only this module can call this, not external users)
        task.reward > 0
    }
    
    // BONUS: Add a public function that calls your private helper
    // ('has_valid_reward' that internally calls 'internal_helper')
    public fun has_valid_reward(task: &Task): bool {
        internal_helper(task)
    }
}

