/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GestionUsuarios.JSF.Fachadas;

import GestionUsuarios.JPA.Entidades.Accionpermitida;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author CMaya
 */
@Stateless
public class AccionpermitidaFacade extends AbstractFacade<Accionpermitida> {

    @PersistenceContext(unitName = "ccys.sena_GestionUsuarios_war_1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccionpermitidaFacade() {
        super(Accionpermitida.class);
    }
    
}
