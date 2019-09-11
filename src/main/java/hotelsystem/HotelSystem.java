/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelsystem;

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
    
}
