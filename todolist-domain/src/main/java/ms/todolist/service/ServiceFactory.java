package ms.todolist.service;

import ms.todolist.service.impl.TodoServiceImpl;

/**
 *
 * @author MS
 */
public class ServiceFactory {

    public static TodoService getTodoService() {        
        return new TodoServiceImpl();
    }
}
