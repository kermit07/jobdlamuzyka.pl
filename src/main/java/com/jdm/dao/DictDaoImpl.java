package com.jdm.dao;

import com.jdm.entity.Achievement;
import com.jdm.entity.AchievementGroup;
import com.jdm.entity.TagGroup;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class DictDaoImpl implements DictDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public List<Achievement> getAchievementList() {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Achievement ORDER BY id");
            return query.list();
        } catch (Exception e) {
            System.err.println("getAchievementList exception!");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public List<AchievementGroup> getAchievementGroupList() {
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM AchievementGroup ORDER BY id");
            return query.list();
        } catch (Exception e) {
            System.err.println("getAchievementGroupList exception!");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public List<TagGroup> getTagGroupList() {
        try {
            Session  session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM TagGroup ORDER BY id");
            return query.list();
        } catch (Exception e) {
            System.err.println("getTagGroupList exception!");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public TagGroup addTagGroup(String name) {
        try {
            Session  session = sessionFactory.openSession();
            session.beginTransaction();
            TagGroup tagGroup = new TagGroup(name);
            Integer id = (Integer) session.save(tagGroup);
            session.getTransaction().commit();
            tagGroup.setId(id);
            return tagGroup;
        } catch (Exception e) {
            System.err.println("addTagGroup exception!");
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public TagGroup updateTagGroup(String name) {
        return null; // TODO
    }

    @Override
    public TagGroup getTagGroup(Integer id) {
        Session session = sessionFactory.openSession();
        TagGroup tagGroup = session.get(TagGroup.class, id);
        return tagGroup;
    }

    @Override
    public void removeTagGroup(Integer id) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM TagGroup WHERE id=:id");
        query.setParameter("id", id);
        query.executeUpdate();
    }
}
