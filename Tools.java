/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.awt.Toolkit;
import javax.swing.ImageIcon;
import javax.swing.JFrame;

/**
 *
 * @author synapse
 */
public class Tools {
    
    public static void setCenter(JFrame frame) {
        
        double screenWidth = Toolkit.getDefaultToolkit().getScreenSize().getWidth();
        double screenHeight = Toolkit.getDefaultToolkit().getScreenSize().getHeight();
        
        int frameWidth = frame.getWidth();
        int frameHeight = frame.getHeight();
        
        int x = (int)(screenWidth - frameWidth) / 2;
        int y = (int)(screenHeight - frameHeight) / 2;
        
        frame.setLocation(x, y);
        
    }
    
    public static String convertPassword(char[] password) {
        
        String fixedPassword = "";
        
        for(char c : password) {
            fixedPassword += c;
        }
        
        return fixedPassword;
        
    }
    
    public static void show(Object msg) {
        javax.swing.JOptionPane.showMessageDialog(null, msg);
    }
    
    public static int confirm(Object msg) {
        return javax.swing.JOptionPane.showConfirmDialog(null, msg, "Delete Confirmtion", javax.swing.JOptionPane.YES_NO_OPTION);
    }
 
    
    public void setIcon(JFrame frame) {
        
        ImageIcon icon = new ImageIcon(getClass().getResource("coffee.png").getFile());
        
        frame.setIconImage(icon.getImage());
    }
}
