package DBO;

import Model.Movie;
import Tools.BaseDB;
import Tools.Filter;

import java.util.List;

public class MovieDAO {
    public static List getAll() {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        List result = so.createQuery("from Movie").list();
        so.getTransaction().commit();
        so.close();
        return result;
    }

    public static List getAllById(long Id) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        List result = so.createQuery("from Movie where Id = " + String.valueOf(Id)).list();
        so.getTransaction().commit();
        so.close();
        return result;
    }

    public static List getAllByFilter(Filter filter) {
        StringBuilder sql = new StringBuilder("from Movie ");
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

    public static void insertUpdate(Movie object) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        so.saveOrUpdate(object);
        so.getTransaction()
                .commit();
        so.close();
    }

    public static void delete(Movie object) {
        var so = BaseDB.openConnection();
        so.beginTransaction();
        String hql = "delete Movie where Id = :id";
        var q_main = so.createQuery(hql).setParameter("id", object.getId());
        q_main.executeUpdate();
        var q_extra = so.createNativeQuery("delete from MoviePersonPersonType where MovieId = " +
                ":Id").setParameter("Id", object.getId());
        q_extra.executeUpdate();
        //so.delete(object);
        so.getTransaction().commit();
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
