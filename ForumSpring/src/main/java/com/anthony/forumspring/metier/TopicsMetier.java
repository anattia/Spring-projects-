/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Topics;
import com.anthony.forumspring.dao.ITopics;
import java.util.List;

/**
 *
 * @author anthony
 */
public class TopicsMetier implements ITopicsMetier {

    ITopics topics;

    public void setTopicsDao(ITopics topics) {
        this.topics = topics;
    }

    @Override
    public List<Topics> findAllById(int catId) {
        return topics.findAllById(catId);
    }

    @Override
    public List<Topics> findAll() {
        return topics.findAll();
    }

    @Override
    public List<Topics> findByTopicId(int topic_id) {
        return topics.findByTopicId(topic_id);
    }

    @Override
    public void InsertTopics(Topics topic) {
        topics.InsertTopics(topic);
    }

    @Override
    public void UpdateNumberTopics(int id) {
        topics.UpdateNumberTopics(id);
    }

    @Override
    public void UpdateNumberComment(int id) {
        topics.UpdateNumberComment(id);
    }

    @Override
    public List<Topics> findAllByValidation() {
        return topics.findAllByValidation();
    }

    @Override
    public void UpdateTopicValidation(int topic_id) {
        topics.UpdateTopicValidation(topic_id);
    }

    @Override
    public void change_public_topics(int topic_id) {
        topics.change_public_topic(topic_id);
    }

    @Override
    public void change_prive_topic(int topic_id) {
        topics.change_prive_topic(topic_id);
    }
}
