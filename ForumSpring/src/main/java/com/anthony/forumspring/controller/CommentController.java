/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.controller;

import com.anthony.forumspring.bean.Commentaire;
import com.anthony.forumspring.dao.ITopics;
import com.anthony.forumspring.metier.ICategorieMetier;
import com.anthony.forumspring.metier.ICommentaireMetier;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author anthony
 */
@Controller
public class CommentController {

    ListableBeanFactory bf = new XmlBeanFactory(
            new ClassPathResource("applicationContext.xml"));

    ICommentaireMetier IcD = (ICommentaireMetier) bf.getBean("commentaireMetier");
    ITopics topic = (ITopics) bf.getBean("topicsDao");
    ICategorieMetier cat = (ICategorieMetier) bf.getBean("categorieMetier");
    
    @RequestMapping(value = "/ListComment", method = RequestMethod.GET)
    public ModelAndView viewComments() {
        ModelAndView MaV = new ModelAndView();
        MaV.setViewName("ListComment");
        return MaV;

    }
    /**
     * Cette  méthode est appelée lors de l'ajout d'un commentaire, 
     * elle redirige sur la page de tous les commentaires, et affiche un message en cas de succès
     * @param com
     * @return 
     */
    @RequestMapping(value = "/AddComment", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView InsertCommentsBdd(Commentaire com) {
        
        //Insertion du commentaire dans la base de données
        IcD.InsertNewCommentaire(com);
        
        //Mise a jour de la date du dernier commentaire
        topic.UpdateNumberTopics(com.getTopic_id());
        
        //Mise a jour de l'auteur du dernier message
        topic.UpdateUsernameLastComment(com.getTopic_id(),com.getUsername());
        
        cat.UpdateNbCommentaireByCategorie(com.getCat_id());
        //Mise à jour du nombre de commentaire appartenant au topic
        topic.UpdateNumberComment(com.getTopic_id());
        
        System.out.println("id = " + com.getTopic_id());
        
        //On augement le nomt
        ModelAndView MaV = new ModelAndView();
        
       
        //Ajout des deux variables pour la redirection, lorsque le commentaire est inséré
        MaV.addObject("topic_id", com.getTopic_id());
        MaV.addObject("cat_id",com.getCat_id());
        MaV.addObject("action", "newCom");
        
       //On redirige sur la page des commentaires 
        MaV.setViewName("redirect:/Topics/ListComment" );
        return MaV;
    }
}
