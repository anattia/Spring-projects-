/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.anthony.forumspring.bean.Categorie;
import com.anthony.forumspring.dao.ICategorieDao;
import com.anthony.forumspring.metier.ICategorieMetier;
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
public class CategorieTest {

    public CategorieTest() {
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
    public void testJDBCTemplate() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ICategorieDao m = (ICategorieDao) bf.getBean("categorieDao");
        System.out.print("Je suis ici");
        List<Categorie> u = m.findAllC();
        System.out.print("Je suis ici");

        for (Categorie p : u) {
            System.out.println("nom=" + p.getCat_id());
        }

    }

    @Test
    public void testJDBCFindAllById() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ICategorieMetier m = (ICategorieMetier) bf.getBean("categorieMetier");
        System.out.print("Je suis ici");
        List<Categorie> u = m.findAllC();
        System.out.print("Je suis ici");

        for (Categorie p : u) {
            System.out.println("nom=" + p.getCat_id());
        }

    }

    @Test
    public void testJDBCInsertCategorie() {

        ListableBeanFactory bf;
        bf = new XmlBeanFactory(
                new ClassPathResource("applicationContext.xml"));
        ICategorieDao m = (ICategorieDao) bf.getBean("categorieDao");
        if(m.existeCategorie("musique")){
            System.out.println("Existe déjà");
        }else{
            m.InsertCategorie("musique");
            System.out.println("Existe pas");
        }

    }
}
