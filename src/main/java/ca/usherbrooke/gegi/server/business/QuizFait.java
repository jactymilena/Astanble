package ca.usherbrooke.gegi.server.business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class QuizFait extends Quiz{
    public int nombre_question;
    public int nombre_bonne_reponse;
    private String date_time_response;

    public String getDate_time_response() {
        return date_time_response;
    }

    public void setDate_time_response(String date_time_response) {
        this.date_time_response = date_time_response;
    }
}
