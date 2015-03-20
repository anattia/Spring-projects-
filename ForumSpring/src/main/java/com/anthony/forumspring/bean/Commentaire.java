/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author anthony
 */
public class Commentaire {
    public int comment_id;
    public int cat_id;
    public int topic_id;
    public String username;
    public int comment_number;
    public Date comment_date;
    public String comment_text;
    public int validation;
    public String media;
    public Timestamp comment_date_details;
    
    public Commentaire(){
        
    }
    public Commentaire(int comment_id, int cat_id, int topic_id, String username, int comment_number, 
            Date comment_date, String comment_text,String media,Timestamp comment_date_details) {
        this.comment_id = comment_id;
        this.cat_id = cat_id;
        this.topic_id = topic_id;
        this.username = username;
        this.comment_number = comment_number;
        this.comment_date = comment_date;
        this.comment_text = comment_text;
        this.media = media;
        this.comment_date_details = comment_date_details;
    }

    public Timestamp getComment_date_details() {
        return comment_date_details;
    }

    public void setComment_date_details(Timestamp comment_date_details) {
        this.comment_date_details = comment_date_details;
    }
    
    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }
    
    public int getValidation() {
        return validation;
    }

    public void setValidation(int validation) {
        this.validation = validation;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getComment_number() {
        return comment_number;
    }

    public void setComment_number(int comment_number) {
        this.comment_number = comment_number;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_text() {
        return comment_text;
    }

    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }
    
}
