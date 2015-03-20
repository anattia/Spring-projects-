/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Commentaire;
import java.util.List;

/**
 *
 * @author anthony
 */
public interface ICommentaireDao {
    public List<Commentaire> findAll();
    public void InsertNewCommentaire(Commentaire commentaire);
    public List<Commentaire> findAllByIdTopics(int topic_id);
    public void updateCommentaire (int comment_id);
    public List<Commentaire> findAllByIdValidation ();
    public void deleteCommentaire(int comment_id);
}
