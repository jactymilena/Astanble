package ca.usherbrooke.gegi.server.service;


import ca.usherbrooke.gegi.server.business.*;
import ca.usherbrooke.gegi.server.persistence.UsagerMapper;
import io.quarkus.security.identity.SecurityIdentity;
import org.apache.ibatis.annotations.Param;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import java.util.List;

@Path("/api")
public class UsagerService {

    @Context
    SecurityContext securityContext;

    @Inject
    SecurityIdentity identity;

    @Inject
    JsonWebToken jwt;

    @Inject
    UsagerMapper usagerMapper;

    @GET
    @Path("usager")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Usager> getUsager(){
        return usagerMapper.select();
    }

    @GET
    @Path("usagerByCip/{cip}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Usager selectByCIP(@Param("cip")String cip){
        return usagerMapper.selectByCIP(cip);
    };

    @GET
    @Path("usagerByCourriel/{courriel1}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Usager selectByEmail(@Param("courriel1")String courriel1){
        return usagerMapper.selectByEmail(courriel1);
    };

    @POST
    @Path("usagerInsert")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public void insert(@Param("usager") Usager usager){
        usagerMapper.insert(usager);
    };

    @PUT
    @Path("usager/update/")
    @PermitAll
    public void update(@Param("usager") Usager usager){
        Person person= new Person();
        usager.setCip(securityContext.getUserPrincipal().getName());
        person.email=usager.getCourriel1();
        person.first_name=usager.getPrenom_usager();
        person.last_name=usager.getNom_usager();

        if(usager.getCip()!=null) {
            usagerMapper.update(usager);

        }else usagerMapper.insert(usager);
    };

    @DELETE
    @Path("usager/delete/{cip}")
    @PermitAll
    public void delete(@Param("cip") String cip){
        usagerMapper.delete(cip);
    };
}
