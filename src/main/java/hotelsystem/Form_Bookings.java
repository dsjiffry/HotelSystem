/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shehan
 */
public class Form_Bookings extends javax.swing.JFrame {

    /**
     * Creates new form Form_Bookings
     */
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;
    private final String url = "jdbc:mysql://localhost:3306/hotelsystem";
    private final String user = "root";
    private final String password = "";
    private final String driver = "com.mysql.jdbc.Driver";
    
    public Form_Bookings() {
        initComponents();
        jTable1.setAutoCreateRowSorter(true);
        DeleteBooking.setEnabled(false);
        try
        {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,user,password);
            statement=connection.createStatement();
            
            
        } catch (Exception ex)
        {
            Logger.getLogger(Form_CheckOut.class.getName()).log(Level.SEVERE, null, ex);
        }
        Calendar c = BDate.getMonthView().getCalendar();
        c.setTime(new Date());
        BDate.getMonthView().setLowerBound(c.getTime());
        
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
        @Override
        public void mouseClicked(java.awt.event.MouseEvent evt) {
            
            ID.setText((String) jTable1.getValueAt(jTable1.getSelectedRow(),0));
            
            if(ID.getText().equals("") || ID.getText()==null)
            {
                DeleteBooking.setEnabled(false);
            }
            else
            {
                DeleteBooking.setEnabled(true);
            }
    }
});
        
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents()
    {

        jPanel1 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        BDate = new org.jdesktop.swingx.JXDatePicker();
        jLabel8 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel9 = new javax.swing.JLabel();
        ID = new javax.swing.JTextField();
        DeleteBooking = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(50, 50, 86));

        jLabel6.setFont(new java.awt.Font("Verdana", 1, 24)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel6.setText("Bookings");

        jButton1.setBackground(new java.awt.Color(100, 255, 218));
        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 24)); // NOI18N
        jButton1.setText("←");
        jButton1.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                jButton1ActionPerformed(evt);
            }
        });

        BDate.setBackground(new java.awt.Color(255, 255, 255));
        BDate.setFont(new java.awt.Font("Verdana", 0, 14)); // NOI18N
        BDate.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                BDateActionPerformed(evt);
            }
        });

        jLabel8.setFont(new java.awt.Font("Verdana", 0, 16)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Date:");

        jTable1.setFont(new java.awt.Font("Verdana", 0, 14)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][]
            {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String []
            {
                "ID", "Guest Name", "Amount Due", "Room Type", "Start Date", "End Date"
            }
        )
        {
            boolean[] canEdit = new boolean []
            {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex)
            {
                return canEdit [columnIndex];
            }
        });
        jTable1.setRowHeight(20);
        jScrollPane1.setViewportView(jTable1);

        jLabel9.setFont(new java.awt.Font("Verdana", 0, 16)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("ID:");

        ID.setEditable(false);
        ID.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                IDActionPerformed(evt);
            }
        });

        DeleteBooking.setBackground(new java.awt.Color(100, 255, 218));
        DeleteBooking.setFont(new java.awt.Font("Verdana", 0, 16)); // NOI18N
        DeleteBooking.setText("Delete Booking");
        DeleteBooking.setToolTipText("");
        DeleteBooking.setBorder(null);
        DeleteBooking.setBorderPainted(false);
        DeleteBooking.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                DeleteBookingActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jButton1)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 820, Short.MAX_VALUE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel9, javax.swing.GroupLayout.Alignment.TRAILING))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(BDate, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(ID, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(100, 100, 100)
                        .addComponent(DeleteBooking, javax.swing.GroupLayout.PREFERRED_SIZE, 162, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jButton1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(35, 35, 35)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(BDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(ID)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addComponent(DeleteBooking, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 9, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 47, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 414, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        Form_Reservation1 R = new Form_Reservation1();
        R.setVisible(true);
        R.setTab(1);
        R.setLocationRelativeTo(this);
        R.setExtendedState(this.getExtendedState());
        this.dispose();
        

        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void BDateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BDateActionPerformed

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][]
            {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String []
            {
                "ID", "Guest Name", "Amount Due", "Room Type", "Start Date", "End Date"
            }
        )
        {
            boolean[] canEdit = new boolean []
            {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex)
            {
                return canEdit [columnIndex];
            }
        });
        
        
        ID.setText("");
        Date d =  BDate.getDate();
        java.sql.Date date = new java.sql.Date(d.getTime());
        
        int rows = 0;
        try
           {
            String sql ="SELECT COUNT(number) FROM room";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next())
            {
                rows=resultSet.getInt("COUNT(number)");
            }
        }
        catch (Exception e) 
            {
            e.printStackTrace();
            }
        
        String contents[][] = new String[rows][6];
        
        try{

           String sql ="SELECT bookings.id,guest.name,bookings.amount,bookings.type,bookings.startDate,bookings.endDate,bookings.numberofRooms "
                        + "FROM bookings,guest "
                        + "WHERE bookings.guestID=guest.ID "
                        + "AND '"+date+"' BETWEEN startDate AND endDate";
            resultSet = statement.executeQuery(sql);
            int i=0;
            while(resultSet.next())
            {
                contents[i][0]=String.valueOf(resultSet.getInt("id"));
                contents[i][1]=resultSet.getString("name");
                contents[i][2]=String.valueOf(resultSet.getDouble("amount"));
                contents[i][3]=resultSet.getString("type")+" * " + resultSet.getString("numberofRooms");
                contents[i][4]=resultSet.getString("startDate");
                contents[i][5]=resultSet.getString("endDate");
                i = i + 1;
            }
           }
        catch (Exception e) {
        e.printStackTrace();
        }
        
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
    contents,
    new String [] {
        "ID", "Guest Name", "Amount Due", "Room Type", "Start Date", "End Date"
    }
) {
    boolean[] canEdit = new boolean [] {
        false, false, false, false, false, false
    };

    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return canEdit [columnIndex];
    }
});
       
        
    }//GEN-LAST:event_BDateActionPerformed

    private void IDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IDActionPerformed
        
        DeleteBooking.setEnabled(true);
        String NumberPattern = "[0-9]+";
        
        if(!ID.getText().matches(NumberPattern))
        {
            Form_Alerts A = new Form_Alerts("Please Check the Number");
            A.setDefaultCloseOperation(0);
            A.setVisible(true);
            A.setLocationRelativeTo(this);
            return;
        }
        
        if(BDate.getDate()==null)
        {
            Form_Alerts A = new Form_Alerts("Please select a date.");
            A.setDefaultCloseOperation(0);
            A.setVisible(true);
            A.setLocationRelativeTo(this);
        }
        
        
        
        
    }//GEN-LAST:event_IDActionPerformed

    private void DeleteBookingActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_DeleteBookingActionPerformed
    {//GEN-HEADEREND:event_DeleteBookingActionPerformed

        if(BDate.getDate()==null || ID.getText()==null || ID.getText().equals("") || jTable1.getValueAt(0,0)==null)
        {
            Form_Alerts A = new Form_Alerts("Please enter a valid date and Room Number");
            A.setDefaultCloseOperation(0);
            A.setVisible(true);
            A.setLocationRelativeTo(this);
            return;
        }
        java.sql.Date date = new java.sql.Date(BDate.getDate().getTime());
        int room = Integer.parseInt(ID.getText());
        int GID = 0;
        try{
        
            String sql2 ="SELECT GuestID FROM room WHERE number = "+room;
            resultSet = statement.executeQuery(sql2);
            
            while(resultSet.next())
            {
                GID = resultSet.getInt("GuestID");                
            }
            
            

            String sql ="SELECT startDate "
                        + "FROM bookings "
                        + "WHERE id="+ID.getText();
            resultSet = statement.executeQuery(sql);
            
            while(resultSet.next())
            {
                Date temp = resultSet.getDate("startDate");
                Date today = new Date();
                if(today.after(temp) || today.equals(temp))
                {
                    Form_Alerts A = new Form_Alerts("This Booking cannot be cancelled, check start date");
                    A.setDefaultCloseOperation(0);
                    A.setVisible(true);
                    A.setLocationRelativeTo(this);
                    return;
                }
            }
           
        String message;
        String sql3 ="SELECT Sender,Message,Receiver "
                        + "FROM messages "
                        + "WHERE Message LIKE '%Delete Booking%'";
            resultSet = statement.executeQuery(sql3);
            
            while(resultSet.next())
            {
                if(resultSet.getString("Sender").equalsIgnoreCase("Receptionist") && resultSet.getString("Receiver").equals("Accounting"))
                {
                    message = resultSet.getString("Message");
                    message = message.replaceAll("\\D+","");
                    
                    if(Integer.parseInt(message)==Integer.parseInt(ID.getText()))
                    {
                        Form_Alerts A = new Form_Alerts("Deletion of this booking has already been requested.");
                        A.setDefaultCloseOperation(0);
                        A.setVisible(true);
                        A.setLocationRelativeTo(this);
                        return;
                    }
                }
            }
           
        
        String sql5 = "INSERT INTO messages(Sender,Message,Receiver) VALUES('Receptionist',"
                        + "'Delete Booking: Booking ID = "+ID.getText()+"','Accounting')";
                
                        PreparedStatement pst = connection.prepareStatement(sql5);
                        pst.executeUpdate();
                        
                        
                        
        }
                    catch(SQLException e)
                    {
                            System.out.println(e.getMessage());
                    }
        
        Form_Alerts A = new Form_Alerts("Accounting will delete the Booking and refund the Customer");
        A.setDefaultCloseOperation(0);
        A.setVisible(true);
        A.setLocationRelativeTo(this);
                
        BDate.setDate(null);
        ID.setText("");
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][]
            {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String []
            {
                "ID", "Guest Name", "Amount Due", "Room Type", "Start Date", "End Date"
            }
        )
        {
            boolean[] canEdit = new boolean []
            {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex)
            {
                return canEdit [columnIndex];
            }
        });
    }//GEN-LAST:event_DeleteBookingActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Form_Bookings.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Form_Bookings.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Form_Bookings.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Form_Bookings.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Form_Bookings().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private org.jdesktop.swingx.JXDatePicker BDate;
    private javax.swing.JButton DeleteBooking;
    private javax.swing.JTextField ID;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
