package com.jdm.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="jdm_tag_group")
public class TagGroup {
    public TagGroup() {}

    public TagGroup(String name) {
        this.setName(name);
    }

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name")
    private String name;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL) // LAZY - ładowanie po requeście przez aplikacje, cascade z usuwaniem itp
    @JoinColumn(name="tag_group_id")
    private List<Tag> tags;

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

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public void addTag(Tag tag) {
        if(tags == null)
            tags = new ArrayList<>();
        tags.add(tag);
    }

    @Override
    public String toString() {
        return "TagGroup{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tags=" + tags +
                '}';
    }
}
