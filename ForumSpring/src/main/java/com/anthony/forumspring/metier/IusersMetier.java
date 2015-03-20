/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Users;
import com.anthony.forumspring.dao.IusersDao;
import java.util.List;

/**
 *
 * @author anthony
 */
public interface IusersMetier {

    public List<Users> findAll();

    public void InsertPersonne(Users user);

    public void setPersonneDao(IusersDao user);

    public List<Users> findAllByUsername(String username);

    public int nbCommentPost(String username);

    public int nbCreateTopics(String username);

    public Boolean existeUsers(String email);
}
