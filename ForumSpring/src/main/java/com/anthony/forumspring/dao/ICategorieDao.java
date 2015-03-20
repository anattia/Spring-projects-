/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.dao;

import com.anthony.forumspring.bean.Categorie;
import java.util.List;

/**
 *
 * @author anthony
 */
public interface ICategorieDao {
    public List<Categorie> findAllC();
    public void InsertCategorie(String nom);
    public Boolean existeCategorie(String Nom);
    public void UpdateNbCommentaireByCategorie(int cat_id);
}
