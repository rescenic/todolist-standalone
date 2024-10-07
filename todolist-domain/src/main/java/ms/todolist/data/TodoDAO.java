
package ms.todolist.data;

import java.util.List;
import ms.todolist.todo.Todo;

/**
 *
 * @author MS
 */
public interface TodoDAO {
    boolean insert(Todo todo);
    List<Todo> get();
    boolean delete(int id);
    void update(int id);
}