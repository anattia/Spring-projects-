/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.controller;

import com.anthony.forumspring.bean.Categorie;
import com.anthony.forumspring.bean.Commentaire;
import com.anthony.forumspring.bean.Topics;
import com.anthony.forumspring.bean.Users;
import com.anthony.forumspring.dao.ICategorieDao;
import com.anthony.forumspring.dao.ICommentaireDao;
import com.anthony.forumspring.dao.ITopics;
import com.anthony.forumspring.metier.IusersMetier;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author anthony
 */
@Controller
public class PublicController {

    ListableBeanFactory bf = new XmlBeanFactory(
            new ClassPathResource("applicationContext.xml"));
    ICategorieDao c = (ICategorieDao) bf.getBean("categorieDao");
    ITopics topic = (ITopics) bf.getBean("topicsDao");
    ICommentaireDao com = (ICommentaireDao) bf.getBean("commentaireDao");
    IusersMetier usersM = (IusersMetier) bf.getBean("userMetier");

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String afficherPersonne(final Model pModel) {

        List<Categorie> ca = c.findAllC();
        pModel.addAttribute("categorie", ca);
        return "indexAcceuil";
    }
    /**
     * Affiche la liste des topics en fonction de leur categorie 
     * @param req
     * @return 
     */
    @RequestMapping(value = "/Categorie/**/ListeTopics", method = RequestMethod.GET)
    public ModelAndView viewTopics(HttpServletRequest req) {
        String cat_nom = req.getParameter("cat_nom");
        int cat_id = Integer.parseInt(req.getParameter("cat_id"));
        List<Topics> to = topic.findAllById(cat_id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("topics", cat_nom);
        mav.addObject("ListTopics", to);
        mav.setViewName("Topics");
        return mav;
    }
    /**
     * Affiche et gere l'insertion des commentaires dans la base de données
     * @param topic_id
     * @param cat_id
     * @param action
     * @param comment_id
     * @return 
     */
    @RequestMapping(value = "/Topics/ListComment", method = RequestMethod.GET)
    public ModelAndView viewCommentsTopics(@RequestParam("topic_id") String topic_id,
            @RequestParam("cat_id") String cat_id, @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "comment_id", required = false) String comment_id
    ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("cat_id", cat_id);
        mav.addObject("topic_id", topic_id);
        //On récupere la descritpion du topic ainsi que l'auteur en fonction de l'id 
        List<Topics> ListTop = topic.findByTopicId(Integer.parseInt(topic_id));
        String username = "";
        //On recupere la liste des commentaries en fonction de l'id du topic
        List<Commentaire> ListComms = com.findAllByIdTopics(Integer.parseInt(topic_id));
        for (Topics t : ListTop) {
            mav.addObject("typeTopic", t.getType_topic());
            username = t.getUsername();
        }

        List<Users> lu = usersM.findAllByUsername(username);
        String picture = "";
        for (Users u : lu) {
            picture = u.getPicture();
        }
        
        System.out.println("Picture = " + picture);
        mav.addObject("pictureP", picture);
        //On récupere le contenu du topic
        mav.addObject("ListTop", ListTop);
        //On recuper la liste des commentaire liés sujet du topics
        System.out.println("topic_id");
        if ("newCom".equals(action)) {
            mav.addObject("success", "Votre commentaire à été ajouté avec succès et est en attente de modération");
        }
        if ("add".equals(action)) {
            mav.addObject("topic_id", topic_id);
            mav.addObject("cat_id", cat_id);
            com.updateCommentaire(Integer.parseInt(comment_id));
            mav.setViewName("redirect:/Topics/ListComment");
            return mav;

        }
        mav.addObject("ListComms", ListComms);
        mav.setViewName("ListComment");
        return mav;

    }
    /**
     * Affiche tous les topics sans distinction
     * @return 
     */
    @RequestMapping(value = "/ListeTopicsAll", method = RequestMethod.GET)
    public ModelAndView viewTopicsAll() {
        List<Topics> to = topic.findAll();

        ModelAndView mav = new ModelAndView();
        mav.addObject("ListTopics", to);
        mav.setViewName("FindAllTopics");
        return mav;
    }

    @RequestMapping(value = "/TopicsCommentTest", method = RequestMethod.GET)
    public ModelAndView viewTopicsCommentTest() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("TopicsCommentTest");
        return mav;
    }
    /**
     * Mapping de l'url de la page de connexion et d 'inscription
     * @param action
     * @return 
     */
    @RequestMapping(value = "/connexion_login", method = RequestMethod.GET)
    public ModelAndView loginAndSigninView(@RequestParam(value = "action", required = false) String action) {
        ModelAndView mav = new ModelAndView();
        if (action != null) {
            mav.addObject("erreur", "Vous devez être connecté ou etre inscrit pour pouvoir accéder aux forums privés");
        }
        mav.setViewName("connexion_login");

        return mav;

    }
    /**
     * Mapping de l'action de déconnexion
     * @return la page login
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logoutUser() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("connexion_login");

        return mav;
    }

}
