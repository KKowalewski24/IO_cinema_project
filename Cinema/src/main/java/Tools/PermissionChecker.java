package Tools;

import Controller.LPermissionController;
import Model.DICT.Permissions;
import Model.User;

import java.util.List;

/**
 * Klasa odpowiedzialna za sprawdzanie zezwolen
 * Uzywanie bez gui
 * Najpierw sie zalogowac za pomoca kontrolera
 * <p>
 * LPermissionController.getInstance().login(login,password);
 * <p>
 * Nastepnie korzystac tylko z tej klasy do sprawdzania permitow
 */
public class PermissionChecker {
    private LPermissionController lm;

    /**
     * Tworzy obiekt pozwalajacy na sprawdzanie zezwolen
     */
    public PermissionChecker() {
        lm = LPermissionController.getInstance();
    }

    /**
     * Sprawdza czy uzytkownik posiada permita z pomoca inta
     *
     * @param PermissionCode kod zezwolenia jako int
     * @return Zwraca true jezeli uzytkownik ma przypisane zezwolenie o kodzie PermissionCode
     * @see LPermissionController#checkPermission(int)
     */
    public boolean checkPermission(int PermissionCode) {
        return lm.checkPermission(PermissionCode);
    }

    /**
     * Sprawdza czy uzytkownik posiada permita z pomoca stringa
     *
     * @param PermissionName nazwa zezwolenia jako string
     * @return Zwraca true jezeli uzytkownik ma przypisane zezwolenie o nazwie PermissionName
     * @see LPermissionController#checkPermission(String)
     */
    public boolean checkPermission(String PermissionName) {
        return lm.checkPermission(PermissionName);
    }

    /**
     * Lista permitow dla aktualnego uzytkownika
     *
     * @return Zwraca liste wszystkich zezwolen jakie ma uzytkownik
     * @see LPermissionController#getPermissionsList()
     */
    public List getPermissionsList() {
        return lm.getPermissionsList();
    }

    public User getCurrentUser() {
        return lm.getCurrentUser();
    }

    public String prettyPermissions() {
        StringBuilder t = new StringBuilder("");
        for (Object p : lm.getPermissionsList()) {
            t.append(((Permissions) p).getName()).append("\n");
        }
        return t.toString();
    }
}
