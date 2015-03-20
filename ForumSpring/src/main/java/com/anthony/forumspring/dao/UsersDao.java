/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Users;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author anthony
 */
public class UsersDao implements IusersDao {

    private JdbcTemplate jdbcTemplate;

    public void setDatasource(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Users> findAll() {
        String sql = "Select * from users";
        return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(Users.class));

    }

    @Override
    public void InsertPersonne(Users users) {

        String sql = "Insert into users(username,password,email,picture,enabled) values(?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[]{users.getUsername(), users.getPassword(), users.getEmail(), users.getPicture(), 1});

    }

    @Override
    public void InsertAuthorities(String nom, String autority) {
        String sql = "INSERT INTO AUTHORITIES(username,authority) values(?,?)";
        jdbcTemplate.update(sql, new Object[]{nom, autority});
    }

    @Override
    public List<Users> findAllByUsername(String username) {

        String sql = "Select * from users where username = ?";
        return this.jdbcTemplate.query(sql, new Object[]{username}, new BeanPropertyRowMapper(Users.class));

    }

    @Override
    public int nbCommentPost(String username) {
        String sql = " Select count(*) from commentaires where username = ?";
        return this.jdbcTemplate.queryForInt(sql, new Object[]{username});
    }

    @Override
    public int nbCreateTopics(String username) {
        String sql = " Select count(*) from  topics where username = ?";
        return this.jdbcTemplate.queryForInt(sql, new Object[]{username});
    }
    @Override
    public Boolean existeUsers(String email) {
        String sql = "select count(*) from users where email=?";
        int count = jdbcTemplate.queryForInt(sql, new Object[]{email});

        return count > 0 ? true : false;

    }
}
