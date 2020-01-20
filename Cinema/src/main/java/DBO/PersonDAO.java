package DBO;

import Model.Person;
import Tools.BaseDB;
import Tools.Filter;

import java.util.List;

public class PersonDAO {
    public static List getAll() {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        List result = so.createQuery("from Person").list();
        so.getTransaction().commit();
        so.close();
        return result;
    }

    public static List getAllById(long Id) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        List result = so.createQuery("from Person where Id = " + String.valueOf(Id)).list();
        so.getTransaction().commit();
        so.close();
        return result;
    }

    public static List getAllByFilter(Filter filter) {
        StringBuilder sql = new StringBuilder("from Person ");
        int size = filter.getFilters().size();
        if (size > 0) {
            int count = 0;
            sql.append("where ");
            for (var item : filter.getFilters().entrySet()) {
                sql.append(item.getKey()).append(" = \'").append(item.getValue().toString()).append("\'");
                count++;
                if (count < size) {
                    sql.append(" and ");
                }
            }
        }
        return execSQL(sql.toString());
    }

    public static void insertUpdate(Person object) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        so.saveOrUpdate(object);
        so.getTransaction()
                .commit();
        so.close();
    }

    public static void delete(Person object) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        so.delete(object);
        so.getTransaction()
                .commit();
        so.close();
    }

    public static List execSQL(String sql) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        List result = so.createQuery(sql).list();
        so.getTransaction().commit();
        so.close();
        return result;
    }
}
