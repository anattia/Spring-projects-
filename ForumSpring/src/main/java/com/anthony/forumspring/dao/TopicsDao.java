/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Topics;
import java.util.Date;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author anthony
 */
public class TopicsDao implements ITopics {

    private JdbcTemplate jdbcTemplate;

    public void setDatasource(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Topics> findAllById(int catId) {
        String sql = "SELECT * FROM TOPICS where cat_id = " + catId;
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Topics.class));
    }

    @Override
    public List<Topics> findAll() {
        String sql = "SELECT * FROM TOPICS";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Topics.class));
    }

    @Override
    public List<Topics> findAllByValidation() {
        String sql = "SELECT * FROM TOPICS where validation = 0";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Topics.class));
    }

    @Override
    public void InsertTopics(Topics topic) {
        String sql = "Insert into topics(cat_id,topic_description,date_creation,username,topic_nom,"
                + "topic_nombre_reponse,topic_date_der_reponse,topic_auteur_der_reponse,type_topic,validation) values(?,?,?,?,?,?,?,?,?,?) ";

        jdbcTemplate.update(sql, new Object[]{topic.getCat_id(), topic.getTopic_description(), new Date(),
            topic.getUsername(), topic.getTopic_nom(), 0, null, null, topic.getType_topic(), 0});

    }

    @Override
    public void UpdateNumberTopics(int id) {
        String sql = "Update categorie set cat_nombre_topics = cat_nombre_topics + 1 where cat_id = " + id;
        jdbcTemplate.update(sql);
    }

    @Override
    public List<Topics> findByTopicId(int topic_id) {
        String sql = "SELECT * FROM TOPICS where topic_id = " + topic_id;
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Topics.class));
    }

    @Override
    public void UpdateDateLastComment(int id) {
        String sql = "UPDATE TOPICS SET topic_date_der_reponse = ?  where topic_id = ?";
        jdbcTemplate.update(sql, new Object[]{new Date(), id});

    }

    @Override
    public void UpdateUsernameLastComment(int id, String username) {
        String sql = "UPDATE TOPICS SET TOPIC_AUTEUR_DER_REPONSE = ?  where topic_id = ?";
        jdbcTemplate.update(sql, new Object[]{username, id});
    }

    @Override
    public void UpdateNumberComment(int id) {
        String sql = "Update topics set TOPIC_NOMBRE_REPONSE = TOPIC_NOMBRE_REPONSE + 1 where topic_id = ?";
        jdbcTemplate.update(sql, new Object[]{id});
    }

    @Override
    public void UpdateTopicValidation(int topic_id) {
        String sql = "update topics set validation = 1 where topic_id = ?";
        jdbcTemplate.update(sql, new Object[]{topic_id});
    }

    @Override
    public void change_prive_topic(int topic_id) {
        String sql = "update topics set type_topic = 'Privé' where topic_id = ?  ";
        jdbcTemplate.update(sql, new Object[]{topic_id});
    }

    @Override
    public void change_public_topic(int topic_id) {
        String sql = "update topics set type_topic = 'Public' where topic_id = ?  ";
        jdbcTemplate.update(sql, new Object[]{topic_id});
    }
}
