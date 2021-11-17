package ca.usherbrooke.gegi.server.business;

public class Reponse {
    private int id_reponse;
    private String reponse_content;
    private boolean bonne_mauvaise;
    private int id_question;
    private int num_question;

    public int getId_reponse() {
        return id_reponse;
    }

    public void setId_reponse(int id_reponse) {
        this.id_reponse = id_reponse;
    }

    public String getReponse_content() {
        return reponse_content;
    }

    public void setReponse_content(String reponse_content) {
        this.reponse_content = reponse_content;
    }

    public boolean isBonne_mauvaise() {
        return bonne_mauvaise;
    }

    public void setBonne_mauvaise(boolean bonne_mauvaise) {
        this.bonne_mauvaise = bonne_mauvaise;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public int getNum_question() {
        return num_question;
    }

    public void setNum_question(int num_question) {
        this.num_question = num_question;
    }
}
