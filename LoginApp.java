import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class LoginApp {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Pet Store Management - Login");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);
        frame.setLayout(new BorderLayout());

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 2));

        JLabel usernameLabel = new JLabel("Username:");
        JTextField usernameField = new JTextField();

        JLabel passwordLabel = new JLabel("Password:");
        JPasswordField passwordField = new JPasswordField();
        passwordField.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {}

            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                    performLogin(usernameField.getText(), new String(passwordField.getPassword()), frame);
                }
            }

            @Override
            public void keyReleased(KeyEvent e) {}
        });

        JButton loginButton = new JButton("Login");
        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                performLogin(usernameField.getText(), new String(passwordField.getPassword()), frame);
            }
        });

        panel.add(usernameLabel);
        panel.add(usernameField);
        panel.add(passwordLabel);
        panel.add(passwordField);
        panel.add(loginButton);

        frame.add(panel, BorderLayout.CENTER);

        frame.setVisible(true);
    }

    private static void performLogin(String username, String password, JFrame frame) {
        // Check for predefined admin username and password
        if (username.equals("admin") && password.equals("admin")) {
            JOptionPane.showMessageDialog(frame, "Admin login successful!");
        } else {
            JOptionPane.showMessageDialog(frame, "Invalid username or password. Please try again.");
        }
    }
}
