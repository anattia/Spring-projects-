/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Commentaire;
import com.anthony.forumspring.dao.ICommentaireDao;
import java.util.List;

/**
 *
 * @author anthony
 */
public class CommentaireMetier implements ICommentaireMetier {

    ICommentaireDao commentaires;

    public void setCommentaireDao(ICommentaireDao commentaires) {
        this.commentaires = commentaires;
    }

    @Override
    public List<Commentaire> findAll() {
        return commentaires.findAll();
    }

    @Override
    public void InsertNewCommentaire(Commentaire commentaire) {
        commentaires.InsertNewCommentaire(commentaire);
    }

    @Override
    public List<Commentaire> findAllByIdTopics(int topic_id) {
        return commentaires.findAllByIdTopics(topic_id);
    }

    @Override
    public void updateCommentaire(int comment_id) {
        commentaires.updateCommentaire(comment_id);
    }

    @Override
    public List<Commentaire> findAllByIdValidation() {
        return commentaires.findAllByIdValidation();
    }
    public void deleteCommentaire(int comment_id){
        commentaires.deleteCommentaire(comment_id);
    }
}
