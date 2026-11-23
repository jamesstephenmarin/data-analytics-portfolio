import FreeSimpleGUI as sg
import functions


label = sg.Text("Type in a to-do")
input_box = sg.InputText(tooltip="Enter todo", key="ibox")
add_button = sg.Button("Add")
edit_button = sg.Button("Edit")
list_box = sg.Listbox(values=functions.get_todos(), key="lbox", enable_events=True, size=[64,10])
complete_button = sg.Button("Complete")
exit_button = sg.Button("Exit")

window = sg.Window("MyTodo-App", 
                   layout=[[label,input_box,add_button], 
                   [list_box],
                    [edit_button, complete_button, exit_button]],
                           font=('Helvetica',10))

while True:
    event, values = window.read()
    print(event)
    print(values)

    match event:
        case 'Add':
            #adding and saving new todo to the text file
            todos = functions.get_todos()    
            new_todo = values['ibox'] + '\n'
            todos.append(new_todo)
            functions.write_todos(todos)

            #refreshing the list in realtime
            window['lbox'].update(values=todos)
        case 'Edit':
            #get the inputs for the new and old todo 
            todo_to_edit = values['lbox'][0]   
            new_todo = values['ibox']

            #editing the values saved in the text file
            todos = functions.get_todos()
            index = todos.index(todo_to_edit)
            todos[index] = new_todo + '\n'
            functions.write_todos(todos)
            window['lbox'].update(values=todos)
        case 'Complete':
            #storing the value for deleting
            todo_to_complete = values['lbox'][0]

            #removing the value in the list and text file
            todos = functions.get_todos()
            todos.remove(todo_to_complete)
            functions.write_todos(todos)
            window['lbox'].update(values=todos)
            window['ibox'].update(value='')
        case 'lbox':
            #updating the inputbox via the listbox value selected
            window['ibox'].update(value=values['lbox'][0])
        case 'Exit':
            exit()
        case sg.WIN_CLOSED:
            break

window.close()
