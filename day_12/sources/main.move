/// DAY 12: Option for Task Lookup
/// 
/// Today (Done in main.move):
/// 1. Learnt about Option<T> type
/// 2. Wrote a function to find tasks by title
/// 3. Handled the case when task is not found


module challenge::day_12 {
    use std::string::String;

    // Copy from day_11: TaskStatus, Task, and TaskBoard
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    // TODO: Write a function 'find_task_by_title' that:
    // - Takes board: &TaskBoard and title: &String
    // - Returns Option<u64> (the index if found, None if not found)
    // - Loops through tasks and compares titles
    // Find task by title, returns Option<u64> with index if found
    public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
        let len = vector::length(&board.tasks);
        let mut i: u64 = 0;
        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (*&task.title == *title) {
                return option::some(i)
            };
            i = i + 1;
        };
        option::none()
    }
}

