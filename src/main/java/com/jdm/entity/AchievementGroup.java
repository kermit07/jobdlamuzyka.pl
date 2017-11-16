package com.jdm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "jdm_achievement_group")
public class AchievementGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @JsonBackReference // dzięki temu nie robi nieskonczonej pętli przy kowertowaniu na JSON
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "group",      // pole group w klasie Achievement
            cascade = {CascadeType.ALL})                        // usuwamy kaskadowo wszystkie reprezentacje grupy
    private List<Achievement> achievements;

    public void addAchievement(Achievement achievement) {
        if (achievements == null)
            achievements = new ArrayList<>();
        achievements.add(achievement);
        achievement.setGroup(this);
    }

    public AchievementGroup() {
    }

    public AchievementGroup(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Achievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<Achievement> achievements) {
        this.achievements = achievements;
    }

    @Override
    public String toString() {
        return "AchievementGroup{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", achievements=" + achievements +
                '}';
    }


}
