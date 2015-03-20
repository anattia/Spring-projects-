/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.bean;

import java.util.Date;

/**
 *
 * @author anthony
 */
public class Topics {

    public int topic_id;
    
    public int cat_id;
    public String topic_nom;
    public String topic_description;
    public Date date_creation;
    public int topic_nombre_reponse;
    public Date topic_date_der_reponse;
    public String topic_auteur_der_reponse;
    public String username;
    public String type_topic;
    public int validation;
    public Topics(){
        
    }

    public Topics(int validation ,int topic_id, int cat_id, String topic_nom, String topic_description, Date date_creation, int topic_nombre_reponse, Date topic_date_der_reponse, String topic_auteur_der_reponse, String username, String type_topic) {
        this.topic_id = topic_id;
        this.cat_id = cat_id;
        this.topic_nom = topic_nom;
        this.topic_description = topic_description;
        this.date_creation = date_creation;
        this.topic_nombre_reponse = topic_nombre_reponse;
        this.topic_date_der_reponse = topic_date_der_reponse;
        this.topic_auteur_der_reponse = topic_auteur_der_reponse;
        this.username = username;
        this.type_topic = type_topic;
        this.validation = validation;
    }

    public int getValidation() {
        return validation;
    }

    public void setValidation(int validation) {
        this.validation = validation;
    }

    public String getType_topic() {
        return type_topic;
    }

    public void setType_topic(String type_topic) {
        this.type_topic = type_topic;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getTopic_nom() {
        return topic_nom;
    }

    public void setTopic_nom(String topic_nom) {
        this.topic_nom = topic_nom;
    }

    public String getTopic_description() {
        return topic_description;
    }

    public void setTopic_description(String topic_description) {
        this.topic_description = topic_description;
    }

    public Date getDate_creation() {
        return date_creation;
    }

    public void setDate_creation(Date date_creation) {
        this.date_creation = date_creation;
    }

    public int getTopic_nombre_reponse() {
        return topic_nombre_reponse;
    }

    public void setTopic_nombre_reponse(int topic_nombre_reponse) {
        this.topic_nombre_reponse = topic_nombre_reponse;
    }

    public Date getTopic_date_der_reponse() {
        return topic_date_der_reponse;
    }

    public void setTopic_date_der_reponse(Date topic_date_der_reponse) {
        this.topic_date_der_reponse = topic_date_der_reponse;
    }

    public String getTopic_auteur_der_reponse() {
        return topic_auteur_der_reponse;
    }

    public void setTopic_auteur_der_reponse(String topic_auteur_der_reponse) {
        this.topic_auteur_der_reponse = topic_auteur_der_reponse;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
