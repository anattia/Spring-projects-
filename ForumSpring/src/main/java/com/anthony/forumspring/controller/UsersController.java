/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anthony.forumspring.controller;

import com.anthony.forumspring.bean.Users;
import com.anthony.forumspring.dao.IusersDao;
import com.anthony.forumspring.metier.IusersMetier;
import java.util.List;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author anthony
 */
@Controller

public class UsersController {

    ListableBeanFactory bf = new XmlBeanFactory(
            new ClassPathResource("applicationContext.xml"));
    IusersDao m = (IusersDao) bf.getBean("dao");
    IusersMetier metierU = (IusersMetier) bf.getBean("userMetier");

    @RequestMapping(value = "/ListePersonne", method = RequestMethod.GET)
    public String afficherPersonne(final Model pModel) {

        List<Users> u = m.findAll();
        pModel.addAttribute("personne", u);
        return "ListePersonne";
    }

    @RequestMapping(value = "/CreateProfile", method = RequestMethod.GET)
    public ModelAndView createProfile(ModelAndView model) {
        Users users = new Users();
        model.addObject("users", users);
        model.setViewName("InsertPersonne");
        return model;

    }

    @RequestMapping(value = "/InsertPersonneTrue", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public void InsertPersonne(@RequestBody Users user) {
        m.InsertPersonne(user);
    }

    @RequestMapping(value = "/saveContact", method = RequestMethod.POST)
    public ModelAndView saveContact(@ModelAttribute Users users) {
        m.InsertPersonne(users);
        return new ModelAndView("redirect:/Personne/ListePersonne");
    }

    @RequestMapping("/view")
    public @ResponseBody
    Users getPerson() {
        Users person = new Users();
        person.setUsername("antho");
        person.setPassword("hmk");
        return person;
    }

    @RequestMapping(value = "/InsertPersoneHome", method = RequestMethod.GET)
    public ModelAndView newContactPersonne(ModelAndView model) {
        model.setViewName("home");
        return model;
    }

    // handles person form submit
     

// handles person form submit
    @RequestMapping(value = "InsertPersonBdd", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView savePersonBdd(Users person) {
        ModelAndView mav = new ModelAndView();

        System.out.println("Email :" + person.getEmail());

        if (m.existeUsers(person.getEmail())) {
            mav.addObject("erreurEmail", "Il existe déjà un membre avec cet email !");
            
        } else {
            m.InsertPersonne(person);
            m.InsertAuthorities(person.getUsername(), "ROLE_USER");
            mav.addObject("success", "Félécitation vous êtes inscrit ! Connectez vous avec votre pseudo et votre mot de passe");
            
        }
        System.out.println("Email :" + person.getEmail());
        mav.setViewName("connexion_login");
        return mav;
    }

    @RequestMapping(value = "/Profile", method = RequestMethod.GET)
    public ModelAndView viewProfil(@RequestParam("username") String username) {
        ModelAndView mav = new ModelAndView();

        //Recherche des infos en fonction de l'username passé en parametre de l'url
        List<Users> infos = metierU.findAllByUsername(username);
        int nb = metierU.nbCommentPost(username);
        int nbT = metierU.nbCreateTopics(username);

        //On récupere l'image du profil
        for (Users u : infos) {
            mav.addObject("picture", u.getPicture());
        }

        //On envoi à les jsp les infos du membre
        mav.addObject("infos", infos);
        mav.addObject("nbC", nb);
        mav.addObject("nbT", nbT);
        //On retourne la vue associée au controller
        mav.setViewName("profile");
        return mav;
    }

}
