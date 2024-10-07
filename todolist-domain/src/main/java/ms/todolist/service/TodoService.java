package ms.todolist.service;

import java.util.List;
import ms.todolist.todo.Todo;

/**
 *
 * @author MS
 */
public interface TodoService {
    
    public List<Todo> getData();
    public void save(String todo);
    public void delete(int id);
    public void complete(int id);
    
}