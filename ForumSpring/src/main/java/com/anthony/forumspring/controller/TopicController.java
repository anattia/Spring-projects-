/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.controller;

import com.anthony.forumspring.bean.Categorie;
import com.anthony.forumspring.bean.Topics;
import com.anthony.forumspring.dao.ICategorieDao;
import com.anthony.forumspring.metier.ITopicsMetier;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author anthony
 */
@Controller
public class TopicController {

    ListableBeanFactory bf = new XmlBeanFactory(
            new ClassPathResource("applicationContext.xml"));
    ICategorieDao c = (ICategorieDao) bf.getBean("categorieDao");
    ITopicsMetier t = (ITopicsMetier) bf.getBean("topicsMetier");
    
    @RequestMapping(value = "/Topics/CreateTopics", method = RequestMethod.GET)
    public ModelAndView createTopicView() {
        ModelAndView mav = new ModelAndView();
        List<Categorie> ca = c.findAllC();
        mav.addObject("categorie", ca);
        mav.setViewName("createTopics");
        return mav;
    }

    @RequestMapping(value = "/createNewTopics", method = RequestMethod.POST)
    public ModelAndView creatNewTopicView(@ModelAttribute Topics topics) {
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("createTopics");
        return mav;
    }
    /**
     * 
     * @param topics
     * @return 
     */
    
    /**
     *
     * @param topics
     * @param req
     * @return
     */
    @RequestMapping(value ="/InsertTopicsBdd", method = RequestMethod.POST)
    @ResponseBody
    public String topicsBdd(Topics topics, HttpServletRequest req){
       
        String cat_nom = req.getParameter("");
        List<Categorie> cat = c.findNamebyId(topics.getCat_id());
        String nom_cat = "";
        for(Categorie ca : cat){
            nom_cat = ca.getCat_nom();
        }
        System.out.println(nom_cat);
         t.InsertTopics(topics);
         //On augement le nom
         t.UpdateNumberTopics(topics.getCat_id());
         return "Votre sujet " + topics.getTopic_nom() + "à bien été enregistré dans la base, "
                 + "il est en attente de modération et une fois modéré vous pourrez le voir dans la catégorie:   !" +nom_cat;
                
     }

}
