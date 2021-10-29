package ca.usherbrooke.gegi.server.business;

import java.sql.Time;

public class Log {
    private String CIP;
    private Time action_timestamp;
    private int id_type;
    private int id_field;

    public Log(String CIP, Time action_timestamp, int id_type, int id_field) {
        this.CIP = CIP;
        this.action_timestamp = action_timestamp;
        this.id_type = id_type;
        this.id_field = id_field;
    }

    public String getCIP() {
        return CIP;
    }

    public void setCIP(String CIP) {
        this.CIP = CIP;
    }

    public Time getAction_timestamp() {
        return action_timestamp;
    }

    public void setAction_timestamp(Time action_timestamp) {
        this.action_timestamp = action_timestamp;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public int getId_field() {
        return id_field;
    }

    public void setId_field(int id_field) {
        this.id_field = id_field;
    }
}
