package com.jdm.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="jdm_user_state")
public class UserState {
    public UserState() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @Column(name="name")
    private String name;

    @Override
    public String toString() {
        return "UserState{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
