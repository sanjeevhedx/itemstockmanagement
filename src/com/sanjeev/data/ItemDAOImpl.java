package com.sanjeev.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.*;
import com.sanjeev.model.Item;

public class ItemDAOImpl implements ItemDAO {

	@Override
	public List<Item> getItems() throws Exception {
		List<Item> itemList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from items order by item_name");
			rs = ps.executeQuery();
			while(rs.next()) {
				int itemCode = rs.getInt(1);
				String itemName = rs.getString(2);
				String unit = rs.getString(3);
				int beginningInventory = rs.getInt(4);
				int quantityOnHand = rs.getInt(5);
				double pricePerUnit = rs.getDouble(6);
				Date dateOfManufacture = rs.getDate(7);
				Date dateOfExpiry = rs.getDate(8);
				String location = rs.getString(9);
				String itemCategory = rs.getString(10);
				
				Item item = new Item(itemCode, itemName, unit, beginningInventory, quantityOnHand, pricePerUnit, dateOfManufacture, dateOfExpiry, location, itemCategory);
				itemList.add(item);
				
			}
		}
		finally {
			close(rs,ps,con);
		}
		
		return itemList;
	}

	private void close(ResultSet rs, PreparedStatement ps, Connection con) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void addItem(Item item) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("insert items(item_name,unit,beginning_inventory,quantity_on_hand,price_per_unit,date_of_manufacture,date_of_expiry,location,item_category)values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, item.getItemName());
			ps.setString(2, item.getUnit());
			ps.setInt(3, item.getBeginningInventory());
			ps.setInt(4, item.getQuantityOnHand());
			ps.setDouble(5, item.getPricePerUnit());
			ps.setTimestamp(6, new java.sql.Timestamp(item.getDateOfManufacture().getTime()));
			ps.setTimestamp(7, new java.sql.Timestamp(item.getDateOfExpiry().getTime()));
			ps.setString(8, item.getLocation());
			ps.setString(9, item.getItemCategory());
			
			ps.executeUpdate();
		}
		finally {
			close(null, ps, con);
		}
	}

	@Override
	public Item getItem(int itemCode) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Item item = null;
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from items where item_code=?");
			ps.setInt(1, itemCode);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				String itemName = rs.getString(2);
				String unit = rs.getString(3);
				int beginningInventory = rs.getInt(4);
				int quantityOnHand = rs.getInt(5);
				double pricePerUnit = rs.getDouble(6);
				Date dateOfManufacture = rs.getDate(7);
				Date dateOfExpiry = rs.getDate(8);
				String location = rs.getString(9);
				String itemCategory = rs.getString(10);
				
				item = new Item(itemCode,itemName, unit, beginningInventory, quantityOnHand, pricePerUnit, dateOfManufacture, dateOfExpiry, location, itemCategory);
				
			}
			else {
				throw new Exception("Could not find Item Code: " + itemCode);
			}
			
		} finally {
			con.close();
		}
		
		return item;
	}

	@Override
	public void updateItem(Item item) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
try {
			
			con = ConnectionFactory.getCon();
			
			ps = con.prepareStatement("update items set item_name=?,unit=?, beginning_inventory=?, quantity_on_hand=?, price_per_unit=?, date_of_manufacture=?, date_of_expiry=?,location=?,item_category=? where item_code = ?");
			
			ps.setString(1, item.getItemName());
			ps.setString(2, item.getUnit());
			ps.setInt(3, item.getBeginningInventory());
			ps.setInt(4, item.getQuantityOnHand());
			ps.setDouble(5, item.getPricePerUnit());
			ps.setTimestamp(6,new java.sql.Timestamp(item.getDateOfManufacture().getTime()) );
			ps.setTimestamp(7, new java.sql.Timestamp(item.getDateOfExpiry().getTime()));
			ps.setString(8, item.getLocation());
			ps.setString(9, item.getItemCategory());
			ps.setInt(10, item.getItemCode());
			
			ps.executeUpdate();
			
		}
		finally {
			close(null, ps, con);
		}
		
	}

	@Override
	public void deleteItem(int itemCode) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = ConnectionFactory.getCon();
			
			ps = con.prepareStatement("delete from items where item_code = ?");
			
			ps.setInt(1,itemCode);
			
			ps.executeUpdate();
			
		} finally {
			close(null, ps, con);
		}
		
	}

	@Override
	public List<Item> searchItems(String searchName) throws Exception {
		List<Item> itemList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionFactory.getCon();
			
			if(searchName != null  && searchName.trim().length()>0) {
				
				ps = con.prepareStatement("select * from items where lower(item_name) like ?");
				ps.setString(1, "%"+searchName.toLowerCase()+"%");
				
				
			}
			
			else {
				ps = con.prepareStatement("select * from items order by item_name");
			}
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int itemCode = rs.getInt(1);
				String itemName = rs.getString(2);
				String unit = rs.getString(3);
				int beginningInventory = rs.getInt(4);
				int quantityOnHand = rs.getInt(5);
				double pricePerUnit = rs.getDouble(6);
				Date dateOfManufacture = rs.getDate(7);
				Date dateOfExpiry = rs.getDate(8);
				String location = rs.getString(9);
				String itemCategory = rs.getString(10);
							
				Item item = new Item(itemCode, itemName, unit, beginningInventory, quantityOnHand, pricePerUnit, dateOfManufacture, dateOfExpiry, location, itemCategory);
				
				itemList.add(item);
				
			}
		}
			finally {
				close(rs, ps, con);
			}
		
		return itemList;
	}

}
