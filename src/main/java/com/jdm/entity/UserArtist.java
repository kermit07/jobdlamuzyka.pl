package com.jdm.entity;

import javax.persistence.*;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "jdm_artist")
@PrimaryKeyJoinColumn(name = "id")
public class UserArtist extends UserAccount {
    @Column
    private String name;
    @Column
    private String surname;
    @Column
    private String phone;
    @Column
    private String dateOfBirth;
    @Column
    private Blob photo;
    @Column
    private int views;
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinTable(
            name = "jdm_artist_achievement",
            joinColumns = @JoinColumn(name = "artist_id"),
            inverseJoinColumns = @JoinColumn(name = "achievement_id")
    )
    private List<Achievement> achievements;

    public void addAchievement(Achievement achievement) {
        if (achievements == null)
            achievements = new ArrayList<>();
        achievements.add(achievement);
    }

    // constructors
    public UserArtist() {
    }

    public UserArtist(String email, String password, UserState state, UserType type, String name, String surname, String phone, String dateOfBirth) {
        super(email, password, state, type);
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.dateOfBirth = dateOfBirth;
        this.photo = null;
        this.views = 0;
    }

    // getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Blob getPhoto() {
        return photo;
    }

    public void setPhoto(Blob photo) {
        this.photo = photo;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public List<Achievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<Achievement> achievements) {
        this.achievements = achievements;
    }

    //to string
    @Override
    public String toString() {
        return "UserArtist{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", phone='" + phone + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", views=" + views +
                ", achievements=" + achievements +
                '}';
    }
}
