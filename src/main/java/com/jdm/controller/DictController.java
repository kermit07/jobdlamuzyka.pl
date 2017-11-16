package com.jdm.controller;

import com.jdm.dao.DictDaoImpl;
import com.jdm.entity.Achievement;
import com.jdm.entity.AchievementGroup;
import com.jdm.entity.TagGroup;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/dict")
@Api(value = "Dictionary Controller", produces = MediaType.APPLICATION_JSON_VALUE)
public class DictController {

    @Autowired
    private DictDaoImpl dictDao;

    @RequestMapping(
            value = "/achievement",
            method = RequestMethod.GET,
            produces = "application/json"
    )
    @ApiOperation("Get achievement list")
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = List.class)})
    // przykładowy opis do dokumentacji - niepotrzebny, bo i tak są generowane
    public List<Achievement> getAchievementList() {
        return dictDao.getAchievementList();
    }

    @RequestMapping(
            value = "/achievement_group",
            method = RequestMethod.GET,
            produces = "application/json"
    )
    public List<AchievementGroup> getAchievementGroupList() {
        return dictDao.getAchievementGroupList();
    }

    @RequestMapping(
            value = "/tag_group",
            method = RequestMethod.POST,
            produces = "application/json"
    )
    public TagGroup addTagGroup(@RequestBody String name) {
        return dictDao.addTagGroup(name);
    }

    @RequestMapping(
            value = "/tag_group",
            method = RequestMethod.GET,
            produces = "application/json"
    )
    public List<TagGroup> getTagGroupList() {
        return dictDao.getTagGroupList();
    }

    @RequestMapping(
            value = "/tag_group/{id}",
            method = RequestMethod.GET,
            produces = "application/json"
    )
    public TagGroup getTagGroup(@PathVariable("id") Integer id) {
        return dictDao.getTagGroup(id);
    }
}