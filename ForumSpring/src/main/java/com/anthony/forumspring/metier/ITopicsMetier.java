/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Topics;
import java.util.List;

/**
 *
 * @author anthony
 */
public interface ITopicsMetier {

    public List<Topics> findAllById(int catId);

    public List<Topics> findAll();

    public List<Topics> findByTopicId(int topic_id);

    public void InsertTopics(Topics topic);

    public void UpdateNumberTopics(int id);

    public void UpdateNumberComment(int id);

    public List<Topics> findAllByValidation();

    public void UpdateTopicValidation(int topic_id);

    public void change_public_topics(int topic_id);

    public void change_prive_topic(int topic_id);
}
