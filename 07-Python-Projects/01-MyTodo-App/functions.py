def get_todos():
    with open("todos.txt", 'r') as file:
        todos_local = file.readlines()
        return todos_local


def write_todos(todo_args):
    with open("todos.txt", 'w') as file:
        file.writelines(todo_args)


