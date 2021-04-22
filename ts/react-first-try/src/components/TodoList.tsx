import React from 'react'
import TodoListProps from '../interfaces/TodoListProps'
import Todo from './Todo'

export default class TodoList extends React.Component<TodoListProps> {
    render() {
        return (
            <div className="todo-container">
                <ul className="todo-list">
                    { this.props.todos.map(todo => (
                        <Todo todo={todo}
                            key={todo.id}
                            removeTodo={this.props.removeTodo}
                            completeTodo={this.props.completeTodo}
                        />
                    ))}
                </ul>
            </div>
        )
    }
}