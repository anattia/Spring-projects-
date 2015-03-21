/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Categorie;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author anthony
 */
public class CategorieDao implements ICategorieDao {

    private JdbcTemplate jdbcTemplate;

    public void setDatasource(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Categorie> findAllC() {
        String sql = "SELECT * FROM CATEGORIE";
        return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(Categorie.class));

    }

    @Override
    public Boolean existeCategorie(String Nom) {
        String sql = "select count(*) from categorie where cat_nom=?";
        int count = jdbcTemplate.queryForInt(sql, new Object[]{Nom});

        return count > 0 ? true : false;

    }

    @Override
    public void InsertCategorie(String nom) {

        String sql = "INSERT INTO CATEGORIE (cat_nom, cat_nombre_topics, CAT_NOMBRE_COMMENTAIRE) \n"
                + "VALUES (?, ?, ?) ";
        jdbcTemplate.update(sql, new Object[]{nom, 0, 0});

    }

    @Override
    public void UpdateNbCommentaireByCategorie(int cat_id) {
        String sql = "UPDATE categorie set cat_nombre_commentaire = cat_nombre_commentaire + 1 where cat_id = ?";
        jdbcTemplate.update(sql, new Object[]{cat_id});
    }

    @Override
    public List<Categorie> findNamebyId(int cat_id) {
        String sql = "SELECT cat_nom FROM CATEGORIE WHERE cat_id = " + cat_id;

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Categorie.class));
    }

}
