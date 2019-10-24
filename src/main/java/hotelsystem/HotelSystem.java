/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelsystem;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.swing.JFrame;

/**
 *
 * @author Shehan
 */
public class HotelSystem {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
          //Starting up the program
          Form_Login L = new Form_Login();
          L.setVisible(true);
          L.setLocationRelativeTo(null);
          L.setExtendedState(JFrame.MAXIMIZED_BOTH);
        
       
        
    }
    
    public static String getProperties(String propertyName)
    {
        try
        {
            InputStream input = new FileInputStream("src/main/java/hotelsystem/hotelSystem.properties");
            Properties prop = new Properties();
            prop.load(input);
            return prop.getProperty(propertyName);
        }
        catch(IOException e)
        {
            e.printStackTrace();
            return "";
        }
        
    }
    
}
