/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package supermarket;

import java.sql.*;

/**
 *
 * @author synapse
 */
public class DAL {

    public Connection con;
    public Statement st;
    public ResultSet rs;

    public static int admin_level = 0;
    public static int goods_level = 0;
    public static int customer_level = 0;
    public static int sales_level = 0;
    
    public static int user_id = 0;
    public static String username = "";
            
    
    
    DAL() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/supermarket?username=root&password=");
            st = con.createStatement();
        } catch (Exception e) {
            Helper.Tools.show(e.getMessage());
        }
    }

    public ResultSet executeQuery(String command) {
        try {
            return st.executeQuery(command);
        } catch (Exception e) {
            Helper.Tools.show("Error in Executing Query");
            return rs;
        }
    }

    public boolean execute(String command) {
        try {
            st.execute(command);
            return true;
        } catch (Exception e) {
            Helper.Tools.show("Cound Not Execute Query!");
            return false;
        }
    }

    public Object[][] select(String query) {
        try {
            rs = st.executeQuery(query);
                        
            rs.last();
            int row = rs.getRow();
            rs.beforeFirst();
            
            int column = rs.getMetaData().getColumnCount();
            
            Object[][] data = new Object[row][column];
            
            int x = 0;
            while(rs.next()) {
                
                for(int y=1; y<=column; y++) {
                    data[x][y-1] = rs.getObject(y);
                }
                
                x++;
            }
                        
            return data;
            
        } catch (Exception e) {
            return null;
        }

    }
    
    public static String filter(Object value) {
        return value.toString().replaceAll("'", "");
    }
    
}
