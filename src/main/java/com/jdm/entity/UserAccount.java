package com.jdm.entity;

import javax.persistence.*;

@Entity
@Table(name = "jdm_user")
@Inheritance(strategy=InheritanceType.JOINED)//Highly normalized
public class UserAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer id;
    @Column
    private String email;
    @Column
    private String password;
    @ManyToOne
    @JoinColumn(name="state_id")
    private UserState state;
    @ManyToOne
    private UserType type;

    public UserAccount() {
    }

    public UserAccount(String email, String password, UserState state, UserType type) {
        this.email = email;
        this.password = password;
        this.state = state;
        this.type = type;
    }

    @Override
    public String toString() {
        return "UserAccount{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", state=" + state +
                ", type=" + type +
                '}';
    }
}
