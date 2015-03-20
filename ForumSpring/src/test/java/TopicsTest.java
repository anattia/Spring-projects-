/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.anthony.forumspring.bean.Topics;
import com.anthony.forumspring.dao.ITopics;
import com.anthony.forumspring.metier.ITopicsMetier;
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
public class TopicsTest {

    public TopicsTest() {
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
        ITopics m = (ITopics) bf.getBean("topicsDao");
        System.out.print("Je suis ici");
        List<Topics> u = m.findAllById(1);
        System.out.print("Je suis ici");
        for (Topics p : u) {
            System.out.println("nom=" + p.getUsername());
        }

    }

    @Test
    public void testJDBCTemplaFindById() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopicsMetier m = (ITopicsMetier) bf.getBean("topicsMetier");
        System.out.print("Je suis ici");
        List<Topics> to = m.findAllById(1);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }

    @Test
    public void testJDBCTemplaInsertTopics() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopicsMetier m = (ITopicsMetier) bf.getBean("topicsMetier");
        
        Topics tor = new Topics();
        tor.setCat_id(1);
        tor.setUsername("users");
        tor.setTopic_description("het salut ca va");
        tor.setTopic_nom("Test ! ");
        tor.setType_topic("Privé");

        m.InsertTopics(tor);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }

    @Test
    public void testJDBCTemplaUpdateNbCommentaire() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopicsMetier m = (ITopicsMetier) bf.getBean("topicsMetier");
        System.out.print("Je suis ici");
        m.UpdateNumberTopics(1);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }

    @Test
    public void testJDBCTemplaUpdateNbCommentairse() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopics m = (ITopics) bf.getBean("topicsDao");
        System.out.print("Je suis ici");
        List<Topics> to = m.findByTopicId(4);
        for (Topics t : to) {
            System.out.println(t.getTopic_description());
        }
        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());

    }

    @Test
    public void testJDBCUpdateDateDerComment() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopics m = (ITopics) bf.getBean("topicsDao");
        System.out.print("Je suis ici");
        m.UpdateDateLastComment(36);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }

    @Test
    public void testJDBCUpdateUsernameDerComment() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopics m = (ITopics) bf.getBean("topicsDao");
        System.out.print("Je suis ici");
        m.UpdateUsernameLastComment(36, "anthony");

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }
     @Test
    public void testJDBCUpdateNumberCommentByTopics() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopics m = (ITopics) bf.getBean("topicsDao");
        System.out.print("Je suis ici");
        m.UpdateNumberComment(36);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }
    
    
    @Test
    public void testJDBCTemplaTchangeType() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ITopicsMetier m = (ITopicsMetier) bf.getBean("topicsMetier");
        
       
        m.change_prive_topic(6);
        m.change_public_topics(6);

        //System.out.print(to.getTopic_desc() + "" + to.getCat_id());
    }
}
