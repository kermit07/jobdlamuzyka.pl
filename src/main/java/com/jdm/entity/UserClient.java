package com.jdm.entity;

import javax.persistence.*;
import java.sql.Blob;

@Entity
@Table(name = "jdm_client")
@PrimaryKeyJoinColumn(name = "id")
public class UserClient extends UserAccount {
    @Column
    private String name;
    @Column
    private String phone;
    @Column
    private int views;
    @Column
    private Blob photo;

    public UserClient() {
    }

    public UserClient(String email, String password, UserState state, UserType type, String name, String phone) {
        super(email, password, state, type);
        this.name = name;
        this.phone = phone;
        this.views = 0;
        this.photo = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "UserClient{" +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                "} -> " + super.toString();
    }
}
