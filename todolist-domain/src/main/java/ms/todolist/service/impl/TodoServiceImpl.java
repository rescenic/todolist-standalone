package ms.todolist.service.impl;

import java.util.List;
import ms.todolist.todo.Todo;
import ms.todolist.data.TodoDAO;
import ms.todolist.data.TodoDAOFile;
import ms.todolist.service.TodoService;

/**
 *
 * @author MS
 */
public class TodoServiceImpl implements TodoService {

    private final TodoDAO todoDAO;

    public TodoServiceImpl() {
        todoDAO = new TodoDAOFile();
    }

    @Override
    public List<Todo> getData() {
        return todoDAO.get();
    }

    @Override
    public void save(String todo) {
        if (!todo.isBlank()) {
            todoDAO.insert(new Todo(getNextId(), todo));
        }
    }

    private int getNextId() {
        int lastId = getData().stream()
                .map(todo -> todo.getId())
                .max(Integer::compareTo)
                .orElse(0);

        return lastId + 1;
    }

    @Override
    public void delete(int id) {
        todoDAO.delete(id);
    }

    @Override
    public void complete(int id) {
        todoDAO.update(id);
    }

}
