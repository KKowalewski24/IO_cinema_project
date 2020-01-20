package Controller;

import DBO.TimeTableDAO;
import Model.Performance;
import Model.TimeTable;
import Model.TimeTableExceptions.Performance.TimeTableCreationException;

import java.sql.Timestamp;

public class TimeTableController {

    /* Singletone */
    private static TimeTableController instance = null;

    public static TimeTableController getInstance() {
        if (instance == null) {
            instance = new TimeTableController();
        }
        return instance;
    }

    private TimeTableController() {
    }

    /* Fields */

    private TimeTable currentTimeTable;
    private Boolean isEditable = false;

    /* Methods */

    public void addPerformanceToTimeTable(String title, long hallId, String performanceType,
                                          Timestamp performanceDate) throws TimeTableCreationException {
        Performance performance = new Performance(title, hallId, performanceType);
        TimeTable timetable = new TimeTable(performance, performanceDate);
        TimeTableDAO.add(timetable);
    }

    public void modifyTimeTable(String title, long hallId, String performanceType,
                                Timestamp performanceDate) throws TimeTableCreationException {
        Performance performance = new Performance(title, hallId, performanceType,
                currentTimeTable.getPerformance().getId());
        TimeTable timetable = new TimeTable(performance, performanceDate, currentTimeTable.getId());
        TimeTableDAO.merge(timetable);
    }

    public void deleteTimeTable(TimeTable timeTable) {
        TimeTableDAO.delete(timeTable);
    }

    public TimeTable getCurrentTimeTable() {
        return currentTimeTable;
    }

    public void setCurrentTimeTable(TimeTable currentTimeTable) {
        if (currentTimeTable != null) {
            this.currentTimeTable = currentTimeTable;
        }
    }

    public Boolean getIsEditable() {
        return isEditable;
    }

    public void setIsEditable(Boolean isEditable) {
        if (isEditable != null) {
            this.isEditable = isEditable;
        }
    }
}
