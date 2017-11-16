package com.jdm.dao;

import com.jdm.entity.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<UserAccount> getUserAccountList() {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserAccount ORDER BY id");
            List<UserAccount> list = query.list();
            return list;
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            ArrayList<UserAccount> arrayList = new ArrayList<>();
            return arrayList;
        }
    }

    @Override
    public List<UserArtist> getUserArtistList() {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserArtist ORDER BY id");
            List<UserArtist> list = query.list();
            return list;
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            ArrayList<UserArtist> arrayList = new ArrayList<>();
            return arrayList;
        }
    }

    @Override
    public List<UserClient> getUserClientList() {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserClient ORDER BY id");
            List<UserClient> list = query.list();
            return list;
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            ArrayList<UserClient> arrayList = new ArrayList<>();
            return arrayList;
        }
    }

    @Override
    public UserArtist addArtistAccount(String email, String password, UserState state, UserType type, String name, String surname, String phone, String dateOfBirth) {
        try {
            Session  session = sessionFactory.openSession();
            session.beginTransaction();
            UserArtist userArtist = new UserArtist(email, password, state, type, name, surname, phone, dateOfBirth);
            Integer id = (Integer) session.save(userArtist);
            session.getTransaction().commit();
            return userArtist;
        } catch (Exception e) {
            System.err.println("exception!");
            return null;
        }
    }

    @Override
    public UserClient addClientAccount(String email, String password, UserState state, UserType type, String name, String phone) {
        try {
            Session  session = sessionFactory.openSession();
            session.beginTransaction();
            UserClient userClient = new UserClient(email, password, state, type, name, phone);
            Integer id = (Integer) session.save(userClient);
            session.getTransaction().commit();
            return userClient;
        } catch (Exception e) {
            System.err.println("exception!");
            return null;
        }
    }

    @Override
    public UserState getNewState() {
        Session  session = sessionFactory.openSession();
        UserState userState = session.get(UserState.class, 1);
        return userState;
    }

    @Override
    public UserType getArtistType() {
        Session  session = sessionFactory.openSession();
        UserType userType = session.get(UserType.class, 2);
        return userType;
    }

    @Override
    public UserType getClientType() {
        Session  session = sessionFactory.openSession();
        UserType userType = session.get(UserType.class, 3);
        return userType;
    }

    @Override
    public UserArtist getArtist(Integer id) {
        Session  session = sessionFactory.openSession();
        UserArtist userArtist = session.get(UserArtist.class, id);
        return userArtist;
    }

    @Override
    public UserClient getClient(Integer id) {
        Session  session = sessionFactory.openSession();
        UserClient userClient = session.get(UserClient.class, id);
        return userClient;
    }

    @Override
    public UserArtist getArtist(String email) {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserArtist WHERE email=:email");
            query.setParameter("email", email);
            return (UserArtist)query.uniqueResult();
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public UserClient getClient(String email) {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserClient WHERE email=:email");
            query.setParameter("email", email);
            return (UserClient)query.uniqueResult();
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public UserAccount getUserAccount(String email) {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM UserAccount WHERE email=:email");
            query.setParameter("email", email);
            return (UserAccount)query.uniqueResult();
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void deleteArtist(Integer id) {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            UserArtist tempArtist = session.get(UserArtist.class, id);
            session.delete(tempArtist);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.err.println("exception!");
            e.printStackTrace();
        }
    }
}
