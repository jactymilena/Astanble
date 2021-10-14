package ca.usherbrooke.gegi.server.business;

public class Usager {
    private String cip;
    private String nom_usager;
    private String prenom_usager;
    private String courriel1;
    private String courriel2;
    private String nom_complet_usager;

    public String getNom_complet_usager() {
        return nom_complet_usager;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public String getNom_usager() {
        return nom_usager;
    }

    public void setNom_usager(String nom_usager) {
        this.nom_usager = nom_usager;
    }

    public String getPrenom_usager() {
        return prenom_usager;
    }

    public void setPrenom_usager(String prenom_usager) {
        this.prenom_usager = prenom_usager;
    }

    public String getCourriel1() {
        return courriel1;
    }

    public void setCourriel1(String courriel1) {
        this.courriel1 = courriel1;
    }

    public String getCourriel2() {
        return courriel2;
    }

    public void setCourriel2(String courriel2) {
        this.courriel2 = courriel2;
    }
}
