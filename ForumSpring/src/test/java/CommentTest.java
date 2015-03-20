/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.anthony.forumspring.bean.Commentaire;
import com.anthony.forumspring.dao.ICommentaireDao;
import com.anthony.forumspring.metier.ICommentaireMetier;
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
public class CommentTest {

    public CommentTest() {
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
    @Test
    public void findAllCommentTest() {
        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ICommentaireDao m = (ICommentaireDao) bf.getBean("commentaireDao");
        System.out.print("Je suis ici");
        List<Commentaire> u = m.findAll();
        System.out.print("Je suis ici");

        for (Commentaire p : u) {
            System.out.println("nom=" + p.getComment_text());
        }

    }

    @Test
    public void findAllCommentTestByTopicId() {
        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ICommentaireMetier m = (ICommentaireMetier) bf.getBean("commentaireMetier");
        List<Commentaire> u = m.findAllByIdTopics(38);
        System.out.print("Je suis ici");

        for (Commentaire p : u) {
            System.out.println("nom=" + p.getComment_text());
        }
        if(u.isEmpty()){
            System.out.println("LA LISTE EST  VIDE !");
        }

    }

    @Test
    public void InsertCommentTest() {

        ListableBeanFactory bf = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
        ICommentaireDao m = (ICommentaireDao) bf.getBean("commentaireDao");
        Commentaire co = new Commentaire();
        co.setUsername("users");
        co.setComment_text("TESTE DESZDZ L'ATTRIBUT VALIDATION ! ");
        co.setCat_id(1);
        co.setTopic_id(2);

        m.InsertNewCommentaire(co);

    }

    @Test
    public void ValidationCommentTest() {

        ListableBeanFactory bf = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
        ICommentaireDao m = (ICommentaireDao) bf.getBean("commentaireDao");
        Commentaire co = new Commentaire();
        m.updateCommentaire(2);

    }
}
