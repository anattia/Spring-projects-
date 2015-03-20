/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.bean;

/**
 *
 * @author anthony
 */
public class Categorie {
    public int cat_id;
    public String cat_nom;
    public int cat_nombre_topics;
    public int cat_nombre_commentaire;
    
    public Categorie(){
        
    }
    public Categorie(int cat_id, String cat_nom, int cat_nombre_topics,int cat_nombre_commentaire) {
        this.cat_id = cat_id;
        this.cat_nom = cat_nom;
        this.cat_nombre_topics = cat_nombre_topics;
        this.cat_nombre_commentaire = cat_nombre_commentaire;
    }
    
    public int getCat_nombre_commentaire() {
        return cat_nombre_commentaire;
    }

    public void setCat_nombre_commentaire(int cat_nombre_commentaire) {
        this.cat_nombre_commentaire = cat_nombre_commentaire;
    }
    
    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getCat_nom() {
        return cat_nom;
    }

    public void setCat_nom(String cat_nom) {
        this.cat_nom = cat_nom;
    }

    public int getCat_nombre_topics() {
        return cat_nombre_topics;
    }

    public void setCat_nombre_topics(int cat_nombre_topics) {
        this.cat_nombre_topics = cat_nombre_topics;
    }
    
}
