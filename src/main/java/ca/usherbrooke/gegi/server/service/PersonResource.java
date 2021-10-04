package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Person;
import ca.usherbrooke.gegi.server.business.Roles;
import io.quarkus.security.identity.SecurityIdentity;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.*;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.util.List;
import java.util.Map;



@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
public class PersonResource {

    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;


    @GET
    @Path("/teacher")
    @RolesAllowed({Roles.TEACHER})
    public Person teacher() {
        Person p = new Person();
        p.cip = securityContext.getUserPrincipal().getName();
        p.last_name = jwt.getClaim("family_name");
        p.first_name = jwt.getClaim("given_name");
        p.email = jwt.getClaim("email");
        Map realmAccess = jwt.getClaim("realm_access");
        if (realmAccess != null && realmAccess.containsKey("roles")) {
            p.roles = (List<String>)realmAccess.get("roles");
        }
        System.out.println(p);
        return p;
    }

    @GET
    @Path("/student")
    @RolesAllowed({Roles.STUDENT})
    public Person student() {
        Person p = new Person();
        p.cip = securityContext.getUserPrincipal().getName();
        p.last_name = jwt.getClaim("family_name");
        p.first_name = jwt.getClaim("given_name");
        p.email = jwt.getClaim("email");
        Map realmAccess = jwt.getClaim("realm_access");
        if (realmAccess != null && realmAccess.containsKey("roles")) {
            p.roles = (List<String>)realmAccess.get("roles");
        }
        System.out.println(p);
        return p;
    }


    @GET
    @Path("/any")
    @PermitAll
    public Person me() {
        Person p = new Person();
        p.cip = securityContext.getUserPrincipal().getName();
        p.last_name = jwt.getClaim("family_name");
        p.first_name = jwt.getClaim("given_name");
        p.email = jwt.getClaim("email");
        Map realmAccess = jwt.getClaim("realm_access");
        if (realmAccess != null && realmAccess.containsKey("roles")) {
            p.roles = (List<String>)realmAccess.get("roles");
        }
        System.out.println(p);
        return p;
    }
}