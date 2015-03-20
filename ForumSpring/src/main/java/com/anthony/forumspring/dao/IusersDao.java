/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Users;
import java.util.List;

/**
 *
 * @author anthony
 */
public interface IusersDao {

    public List<Users> findAll();

    public void InsertPersonne(Users user);

    public void InsertAuthorities(String nom, String autority);

    public List<Users> findAllByUsername(String username);

    public int nbCommentPost(String username);
    
    public int nbCreateTopics(String username);
    
     public Boolean existeUsers(String email);
}
