/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Commentaire;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author anthony
 */
public class CommentaireDao implements ICommentaireDao {

    private JdbcTemplate jdbcTemplate;

    public void setDatasource(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Commentaire> findAll() {
        String sql = "Select * from commentaires";
        return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(Commentaire.class));

    }

    @Override
    public void InsertNewCommentaire(Commentaire commentaire) {
        Calendar calendar = Calendar.getInstance();
        Timestamp date_commentaire = new Timestamp(calendar.getTime().getTime());

        String sql = "INSERT INTO COMMENTAIRES(CAT_ID, TOPIC_ID, USERNAME, COMMENT_NUMBER,COMMENT_DATE_DETAILS, COMMENT_TEXT,VALIDATION,MEDIA) values (?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[]{commentaire.getCat_id(), commentaire.getTopic_id(),
            commentaire.getUsername(), 0, date_commentaire, commentaire.getComment_text(), 0, commentaire.getMedia()});

    }

    @Override
    public List<Commentaire> findAllByIdTopics(int topic_id) {
        String sql = "Select * from commentaires where topic_id = " + topic_id + " order by comment_id desc";
        return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(Commentaire.class));

    }

    @Override
    public void updateCommentaire(int comment_id) {
        String sql = "update commentaires set validation = 1 where comment_id = ? ";
        this.jdbcTemplate.update(sql, new Object[]{comment_id});
    }

    @Override
    public List<Commentaire> findAllByIdValidation() {
        String sql = "Select * from commentaires where validation = 0";
        return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(Commentaire.class));
    }
    
    @Override
    public void deleteCommentaire(int comment_id){
        String sql =" delete from commentaires where comment_id = ?";
        this.jdbcTemplate.update(sql,new Object[]{comment_id});
    }
}
