package ca.usherbrooke.gegi.server.business;

public class ReponseUsager extends Reponse {
    private Usager usager;
    private int id_reponse_usager_question;
    private String reponse_usager;
    private boolean bonne_reponse;
    private String date_time_response;

    public String getReponse_usager() {
        return reponse_usager;
    }

    public void setReponse_usager(String reponse_usager) {
        this.reponse_usager = reponse_usager;
    }

    public boolean isBonne_reponse() {
        return bonne_reponse;
    }

    public void setBonne_reponse(boolean bonne_reponse) {
        this.bonne_reponse = bonne_reponse;
    }

    public Usager getUsager() {
        return usager;
    }

    public void setUsager(Usager usager) {
        this.usager = usager;
    }

    public int getId_reponse_usager_question() {
        return id_reponse_usager_question;
    }

    public void setId_reponse_usager_question(int id_reponse_usager_question) {
        this.id_reponse_usager_question = id_reponse_usager_question;
    }

    public String getDate_time_response() {
        return date_time_response;
    }

    public void setDate_time_response(String date_time_response) {
        this.date_time_response = date_time_response;
    }
}
