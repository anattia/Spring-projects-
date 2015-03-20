/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.anthony.forumspring.bean.Users;
import com.anthony.forumspring.dao.IusersDao;
import com.anthony.forumspring.metier.IusersMetier;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

/**
 *
 * @author anthony
 */
public class test {

    public test() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void testJDBCTemplateInsertPersonne() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersDao m = (IusersDao) bf.getBean("dao");
        System.out.print("Je suis ici");
        List<Users> u = m.findAll();
        System.out.print("Je suis ici");
        for (Users p : u) {
            System.out.println("nom=" + p.getUsername());
        }

    }

    @Test
    public void InsertPersonneAdd() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersDao m = (IusersDao) bf.getBean("dao");
        System.out.println("Je suis ici");
        Users u = new Users();
        u.setUsername("anthkkosnfjjoooiprlmy");
        u.setPassword("anthony");
        u.setEmail("anthony95lp3vjijijiijprr56@gmail.com");
        // u.setPicture("http://www.allocine.fr/personne/fichepersonne-19142/filmographie/");
        try {
            m.InsertPersonne(u);
        } catch (Exception e) {
            System.out.println(" " + e.getMessage());
        }
    }

    @Test
    public void testJDBCTemplateInsertAuthority() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersDao m = (IusersDao) bf.getBean("dao");
        m.InsertAuthorities("anthony", "ROLE_USER");

    }

    @Test
    public void testFindAllByUsername() {
        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersMetier m = (IusersMetier) bf.getBean("userMetier");

        List<Users> ma = m.findAll();
        for (Users u : ma) {
            System.out.println("Email = " + u.getEmail());
        }
    }

    @Test
    public void testFindAllByUsernames() {
        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersDao m = (IusersDao) bf.getBean("dao");

        int nb = m.nbCommentPost("Lolita");
        int nbT = m.nbCreateTopics("Lolita");
        System.out.println("Nombre de commentaire = " + nb + "\n" + nbT);
    }
     @Test
    public void testExisteEmail() {
        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        IusersDao m = (IusersDao) bf.getBean("dao");
        if(m.existeUsers("julie@gmail.com")){
            System.out.println("jexiste déja");
        }
        
    }
    
}
