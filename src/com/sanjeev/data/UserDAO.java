package com.sanjeev.data;

import java.io.InputStream;

import com.sanjeev.model.User;

public interface UserDAO {
public void addUser(User user)throws Exception;
public User getUser(String userId) throws Exception;
public void updatePhoto(String userId,InputStream inputStream) throws Exception;
}
