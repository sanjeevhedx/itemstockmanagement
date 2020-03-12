package com.sanjeev.data;

import java.util.List;
import com.sanjeev.model.Item;

public interface ItemDAO {
	public List<Item> getItems()throws Exception;
	public void addOrUpdateItem(Item item) throws Exception;
    public Item getItem(int itemCode) throws Exception;
	public void deleteItem(int itemCode)throws Exception;
	public List<Item> searchItems(String searchName)  throws Exception;

}
