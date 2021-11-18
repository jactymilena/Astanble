package ca.usherbrooke.gegi.server.business;

public class ReponseUsager extends Reponse {
    private Usager usager;
    private int id_reponse;
    private int id_question;
    private int id_reponse_usager_question;

    public Usager getUsager() {
        return usager;
    }

    public void setUsager(Usager usager) {
        this.usager = usager;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public int getId_reponse() {
        return id_reponse;
    }

    public void setId_reponse(int id_reponse) {
        this.id_reponse = id_reponse;
    }

    public void setId_reponse_usager_question(int id_reponse_usager_question){this.id_reponse_usager_question = id_reponse_usager_question;}

    public int getId_reponse_usager_question(){return id_reponse_usager_question;}
}
