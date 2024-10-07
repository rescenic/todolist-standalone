package ms.todolist.gui;

import ms.todolist.gui.form.FormTodo;

/**
 *
 * @author MS
 */
public class Main {

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormTodo().setVisible(true);
            }
        });

    }

}
