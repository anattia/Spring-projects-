/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Users;
import com.anthony.forumspring.dao.IusersDao;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author anthony
 */
@Component

public class UsersMetier implements IusersMetier {

    IusersDao userd;

    public void setDao(IusersDao userd) {
        this.userd = userd;
    }

    @Override
    public void setPersonneDao(IusersDao user) {
        this.userd = user;
    }

    @Override
    public List<Users> findAll() {
        return userd.findAll();
    }

    @Override
    public void InsertPersonne(Users user) {
        userd.InsertPersonne(user);
    }

    @Override
    public List<Users> findAllByUsername(String username) {
        return userd.findAllByUsername(username);
    }

    @Override
    public int nbCommentPost(String username) {
        return userd.nbCommentPost(username);
    }

    @Override
    public int nbCreateTopics(String username) {
        return userd.nbCreateTopics(username);
    }
    
    @Override
    public Boolean existeUsers(String email){
        
        return userd.existeUsers(email);
    }
}
