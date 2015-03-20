/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.metier;

import com.anthony.forumspring.bean.Categorie;
import com.anthony.forumspring.dao.CategorieDao;
import com.anthony.forumspring.dao.ICategorieDao;
import java.util.List;

/**
 *
 * @author anthony
 */
public class CategorieMetier implements ICategorieMetier {

    ICategorieDao cat;
    
    public void setCategorieDao(CategorieDao cat) {
        this.cat = cat;
    }

    @Override
    public List<Categorie> findAllC() {
        return cat.findAllC();
    }
    
    @Override
    public void InsertCategorie(String nom) {
        cat.InsertCategorie(nom);
    }
    
    @Override
    public Boolean existeCategorie(String Nom) {
        return cat.existeCategorie(Nom);
    }
    @Override
    public void UpdateNbCommentaireByCategorie(int cat_id){
        cat.UpdateNbCommentaireByCategorie(cat_id);
    }
}
