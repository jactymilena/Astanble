package ca.usherbrooke.gegi.server.business;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Person {

        public String cip;
        public String last_name;
        public String first_name;
        public String email;
        public List roles;

        @Override
        public String toString() {
                return "Person{" +
                        "cip='" + cip + '\'' +
                        ", last_name='" + last_name + '\'' +
                        ", first_name='" + first_name + '\'' +
                        ", email='" + email + '\'' +
                        ", roles=" + roles +
                        '}';
        }
}