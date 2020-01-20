package DBO;

import Model.TimeTable;
import Tools.BaseDB;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class TimeTableDAO {

    public static List<TimeTable> getAll() {
        Session s = BaseDB.openConnection();

        /* create query */
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<TimeTable> cr = cb.createQuery(TimeTable.class);
        Root<TimeTable> root = cr.from(TimeTable.class);
        cr.select(root);

        /* make query */
        s.beginTransaction();
        List<TimeTable> result = s.createQuery(cr).list();
        s.getTransaction().commit();
        s.close();

        return result;
    }

    public static TimeTable getById(long id) {
        Session s = BaseDB.openConnection();
        s.beginTransaction();
        TimeTable timeTable = s.get(TimeTable.class, id);
        s.getTransaction().commit();

        return timeTable;
    }

    public static void merge(TimeTable timeTable) {
        Session so = BaseDB.openConnection();
        so.beginTransaction();
        so.merge(timeTable);
        so.getTransaction().commit();
        so.close();
    }

    public static void add(TimeTable object) {
        Session so = BaseDB.openConnection();
        so.beginTransaction();
        so.save(object);
        so.getTransaction().commit();
        so.close();
    }

    public static void delete(TimeTable timeTable) {
        Session so = BaseDB.openConnection();
        so.beginTransaction();
        so.delete(timeTable);
        so.getTransaction().commit();
        so.close();
    }
}
