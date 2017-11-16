package com.jdm.dao;

import com.jdm.entity.Achievement;
import com.jdm.entity.AchievementGroup;
import com.jdm.entity.TagGroup;

import java.util.List;

public interface DictDao {

    // achievement
    public List<Achievement> getAchievementList();
    public List<AchievementGroup> getAchievementGroupList();

    //tag TODO
    public List<TagGroup> getTagGroupList();
    public TagGroup getTagGroup(Integer id);
    public TagGroup addTagGroup(String name);
    public TagGroup updateTagGroup(String name);
    public void removeTagGroup(Integer id);
}
