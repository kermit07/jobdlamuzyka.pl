package com.jdm.dao;


import com.jdm.entity.*;

import java.util.List;

public interface UserDao {
    public List<UserAccount> getUserAccountList();
    public List<UserArtist> getUserArtistList();
    public List<UserClient> getUserClientList();

    public UserState getNewState();

    public UserType getClientType();
    public UserType getArtistType();
    public UserClient getClient(Integer id);
    public UserArtist getArtist(Integer id);
    public UserClient getClient(String email);
    public UserArtist getArtist(String email);
    public UserAccount getUserAccount(String email);

    public UserArtist addArtistAccount(String email, String password, UserState state, UserType type, String name, String surname, String phone, String dateOfBirth);
    public UserClient addClientAccount(String email, String password, UserState state, UserType type, String name, String phone);

    public void deleteArtist(Integer id);
}
