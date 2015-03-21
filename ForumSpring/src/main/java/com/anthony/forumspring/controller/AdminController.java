/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.controller;

import com.anthony.forumspring.bean.Categorie;
import com.anthony.forumspring.bean.Commentaire;
import com.anthony.forumspring.bean.Topics;
import com.anthony.forumspring.metier.ICategorieMetier;
import com.anthony.forumspring.metier.ICommentaireMetier;
import com.anthony.forumspring.metier.ITopicsMetier;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author anthony
 */
@Controller
//@RequestMapping(value="/admin**")
public class AdminController {

    ListableBeanFactory bf = new XmlBeanFactory(
            new ClassPathResource("applicationContext.xml"));
    ICategorieMetier m = (ICategorieMetier) bf.getBean("categorieMetier");
    ICommentaireMetier com = (ICommentaireMetier) bf.getBean("commentaireMetier");
    ITopicsMetier topic = (ITopicsMetier) bf.getBean("topicsMetier");

    /**
     *
     * @return
     */
    @RequestMapping(value = "/Admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView MaV = new ModelAndView();

        MaV.setViewName("AdminIndex");
        return MaV;
    }

    /**
     * Retourne page d 'erreur de connexion
     *
     * @return
     */
    @RequestMapping(value = "/Admin/FailLog")
    public ModelAndView FailLog() {
        ModelAndView MaV = new ModelAndView();

        MaV.setViewName("FailLog");
        return MaV;
    }

    /**
     * Renvoi la page d'ajout d une catégorie pour le forum
     *
     * @return
     */
    @RequestMapping(value = "/Admin/NewCategory")
    public ModelAndView NewCategory() {
        ModelAndView MaV = new ModelAndView();

        MaV.setViewName("InsertCategorie");
        return MaV;
    }

    /**
     * Method appelée par le formulaire d'ajout d'une catégorie
     *
     *
     */
    @RequestMapping(value = "/Admin/InsertNewCategory", method = RequestMethod.POST)
    public ModelAndView InsertNewCategory(HttpServletRequest req) {
        ModelAndView MaV = new ModelAndView();
        String cat_nom = req.getParameter("categorie");

        //Si la categorie existe, on affiche cette information
        if (m.existeCategorie(cat_nom)) {
            MaV.addObject("erreur", "La categorie existe dÃ©jÃ  dans la base ! ");
        } //Sinon on insère la nouvelle catégorie dans la base
        else {
            m.InsertCategorie(cat_nom);

        }
        MaV.setViewName("InsertCategorie");
        return MaV;
    }

    /**
     *
     * @param error
     * @param logout
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("AdminLogin");

        return model;

    }

    /**
     * Renvoi la page d'acces refusé lorsqu'un utilisateurs n'a pas les droits
     * nécessaires
     *
     * @return
     */
    @RequestMapping(value = "/Admin/AccessDenied", method = RequestMethod.GET)
    public ModelAndView AccessDenied() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("accessDenied");

        return mav;

    }

    /**
     * Retourne la page de validation des commentaires
     *
     * @param comment_id
     * @return
     */
    @RequestMapping(value = "/Admin/ValidationComments", method = RequestMethod.GET)
    public ModelAndView viewCommentsAdmin(@RequestParam(value = "idComment", required = false) String comment_id) {
        ModelAndView mav = new ModelAndView();
        //On recuper la liste des commentaire liés sujet du topics
        List<Commentaire> ListComms = com.findAllByIdValidation();
        mav.addObject("ListComms", ListComms);

        //Affiche message success de validation
        if (comment_id != null) {
            com.updateCommentaire(Integer.parseInt(comment_id));
            mav.addObject("success", "Le commentaire à été validé et sera visible par tous les visiteurs et membres !");
        }
        mav.setViewName("ValidationComments");
        return mav;

    }

    /**
     *
     * @param comment_id
     * @return
     */
    @RequestMapping(value = "/Admin/SupprimerComments", method = RequestMethod.GET)
    public ModelAndView viewDeleteCommentsAdmin(@RequestParam(value = "idCommentS", required = false) String comment_id) {
        ModelAndView mav = new ModelAndView();
        //On recuper la liste des commentaire liés sujet du topics
        List<Commentaire> ListComms = com.findAllByIdValidation();
        mav.addObject("ListComms", ListComms);

        //Affiche message success de validation
        if (comment_id != null) {
            com.deleteCommentaire(Integer.parseInt(comment_id));
            mav.addObject("success", "Le commentaire a été supprimé de la base de données !");
        }
        mav.setViewName("ValidationComments");
        return mav;

    }

    /**
     * Methode appelée lors de la validation des commentaires, le parametre
     * validation de la table commentaire
     *
     * @param comment_id
     * @return
     */
    @RequestMapping(value = "/Admin/ValidateComm", method = RequestMethod.GET)
    public ModelAndView validateComments(@RequestParam("idComment") String comment_id) {
        ModelAndView mav = new ModelAndView();

        com.updateCommentaire(Integer.parseInt(comment_id));
        mav.addObject("success", "Le commentaire à été validé et sera visible par tous les visiteurs et membres !");
        List<Commentaire> ListComms = com.findAllByIdValidation();
        mav.addObject("ListComms", ListComms);
        mav.setViewName("ValidationComments");
        return mav;
    }

    @RequestMapping(value = "/Admin/ListeTopics", method = RequestMethod.GET)
    public ModelAndView viewTopics() {

        List<Topics> to = topic.findAllByValidation();

        ModelAndView mav = new ModelAndView();
        mav.addObject("topics", "");
        mav.addObject("ListTopics", to);
        mav.setViewName("ValidateTopics");
        return mav;
    }

    @RequestMapping(value = "/Admin/ListeAllTopics", method = RequestMethod.GET)
    public ModelAndView viewAllTopics() {

        List<Topics> to = topic.findAll();

        ModelAndView mav = new ModelAndView();
        mav.addObject("topics", "");
        mav.addObject("ListTopics", to);
        mav.setViewName("AdminAllTopics");
        return mav;
    }

    /**
     *
     * @param topic_id
     * @param action
     * @return
     */
    @RequestMapping(value = "/Admin/ListeTopicsValidate", method = RequestMethod.GET)
    public ModelAndView validateTopics(@RequestParam("idTopic") String topic_id,
            @RequestParam("action") String action, @RequestParam(value = "redirect", required = false) String page) {
        ModelAndView mav = new ModelAndView();
        //Integer.parseInt(idTopic); 
        switch (action) {
            case "valider":

                topic.UpdateTopicValidation(Integer.parseInt(topic_id));
                mav.addObject("Success_topics", "Le fils de discussion à été validé et sera affiché sur le site");
                break;
            case "typePrive":
                topic.change_prive_topic(Integer.parseInt(topic_id));
                mav.addObject("Success_prive", "Le fils de discussion à subit un changement de type et est passé en <h2>privé</h2>");
                break;
            case "typePublic":
                topic.change_public_topics(Integer.parseInt(topic_id));
                mav.addObject("Success_public", "Le fils de discussion à subit un changement de type et est passé en public ");
                break;
        }

        if (page != null) {
            mav.setViewName("AdminAllTopics");
            System.err.println("je suis pas null");
            List< Topics> to = topic.findAll();

            mav.addObject("ListTopics", to);
        } else {
            mav.setViewName("ValidateTopics");
            System.err.println("je suis  null");
            List< Topics> to = topic.findAllByValidation();

            mav.addObject("ListTopics", to);
        }
        return mav;
    }

}
