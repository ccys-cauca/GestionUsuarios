/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GestionUsuarios.JSF.Fachadas;

import GestionUsuarios.JPA.Entidades.Accionpermitidaporusuario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author CMaya
 */
@Stateless
public class AccionpermitidaporusuarioFacade extends AbstractFacade<Accionpermitidaporusuario> {

    @PersistenceContext(unitName = "ccys.sena_GestionUsuarios_war_1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccionpermitidaporusuarioFacade() {
        super(Accionpermitidaporusuario.class);
    }
    
}
