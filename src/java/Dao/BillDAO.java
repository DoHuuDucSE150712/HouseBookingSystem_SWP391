/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Connect.DBContext;
import Model.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Asus
 */
public class BillDAO {
        Connection con;
    public BillDAO(){
        DBContext dbcontext = new DBContext();
        try {
            con = dbcontext.getConnection();
            System.out.println("Successful");
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
    }
    
    public List<Bill> getBill(){
        String sql = "select * from Bill_detail";
        List<Bill> list = new ArrayList<>();
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
//                int houseid = resultSet.getInt(1);
//                Date postdate = resultSet.getDate(2);
//                String housename = resultSet.getString(3);
//                String review = resultSet.getString(4);
//                double price = resultSet.getDouble(5);
//                int status = resultSet.getInt(6);
//                String address = resultSet.getString(7);
//                String description = resultSet.getString(8);
//                int locationid = resultSet.getInt(9);
//                int menuid = resultSet.getInt(10);
                
                int bill_id = resultSet.getInt(1);
                int house_id = resultSet.getInt(2);
                Date start_date = resultSet.getDate(3);
                Date end_date = resultSet.getDate(4);
                String note = resultSet.getString(5);
                Bill bill = new Bill(bill_id, house_id, start_date, end_date, note);
                //tạo model hứng giữ liệu
                list.add(bill);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
            return list;
    }
}
