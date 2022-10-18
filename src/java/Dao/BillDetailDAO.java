/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Connect.DBContext;
import Model.BillDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BillDetailDAO {
    Connection con;
    public BillDetailDAO(){
        DBContext dbcontext = new DBContext();
        try {
            con = dbcontext.getConnection();
            System.out.println("Successful");
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
    }
    
    public List<BillDetail> getBillDeatai(){
        String sql = "select * from Bill_detail";
        List<BillDetail> list = new ArrayList<>();
        
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
                int billid = resultSet.getInt(1);
                int houseid = resultSet.getInt(2);
                Date startdate = resultSet.getDate(3);
                Date enđate = resultSet.getDate(4);
                String note = resultSet.getString(5);

                //tạo model hứng giữ liệu
                BillDetail b = new BillDetail(billid, houseid, startdate, enđate, note);
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
        
        return list;
    }
    
    public BillDetail getBillDeatailbyID(int id){
        String sql = "select * from Bill_detail where bill_id = ?";
        BillDetail b = new BillDetail();
        
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
                int billid = resultSet.getInt(1);
                int houseid = resultSet.getInt(2);
                Date startdate = resultSet.getDate(3);
                Date enđate = resultSet.getDate(4);
                String note = resultSet.getString(5);

                //tạo model hứng giữ liệu
                b = new BillDetail(billid, houseid, startdate, enđate, note);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
        
        return b;
    }
    
    public void editBillDetail(BillDetail billdetail){
        String sql = "UPDATE [dbo].[Bill_detail]\n" +
                        "   SET [house_id] = ?\n" +
                        "      ,[start_date] = ?\n" +
                        "      ,[end_date] = ?\n" +
                        "      ,[note] = ?\n" +
                        " WHERE [bill_id] = ?";
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //set gia tri cho dau ? 
            pre.setInt(1, billdetail.getHouseid());
            java.sql.Date DateSql = new java.sql.Date(billdetail.getStartdate().getTime());
            pre.setDate(2, DateSql);
            java.sql.Date DateSq2 = new java.sql.Date(billdetail.getEnddate().getTime());
            pre.setDate(3, DateSq2);
            pre.setString(4, billdetail.getNote());
            pre.setInt(5, billdetail.getBillid());
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
    public void deleteBillDetail(int id){
        String sql = "DELETE FROM [dbo].[Bill_detail]\n" +
                    "      WHERE bill_id = ?";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
    public void addBillDetail(BillDetail billdetail){
        String sql = "INSERT INTO [dbo].[Bill_detail]\n" +
                    "           ([bill_id]\n" +
                    "           ,[house_id]\n" +
                    "           ,[start_date]\n" +
                    "           ,[end_date]\n" +
                    "           ,[note])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?)";
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //set gia tri cho dau ? 
            pre.setInt(1, billdetail.getHouseid());
            java.sql.Date DateSql = new java.sql.Date(billdetail.getStartdate().getTime());
            pre.setDate(2, DateSql);
            java.sql.Date DateSq2 = new java.sql.Date(billdetail.getEnddate().getTime());
            pre.setDate(3, DateSq2);
            pre.setString(4, billdetail.getNote());
            pre.setInt(5, billdetail.getBillid());
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
//        public static void main(String[] args) {
//        BillDetailDAO a = new BillDetailDAO();
//    }
    
}
