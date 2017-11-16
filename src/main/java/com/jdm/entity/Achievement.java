package com.jdm.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;

@Entity
@Table(name = "jdm_achievement")
public class Achievement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @JsonManagedReference // dzięki temu nie robi nieskonczonej pętli przy kowertowaniu na JSON
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE,
            CascadeType.DETACH, CascadeType.REFRESH}) // nie usuwamy kaskadowo grupy
    @JoinColumn(name = "achievement_group_id")
    private AchievementGroup group;

    public Achievement() {
    }

    public Achievement(String name) {
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

    public AchievementGroup getGroup() {
        return group;
    }

    public void setGroup(AchievementGroup group) {
        this.group = group;
    }

    @Override
    public String toString() {
        return "Achievement{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
