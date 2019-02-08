/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GestionUsuarios.JPA.Entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author CMaya
 */
@Entity
@Table(name = "ACCIONPERMITIDAPLANTILLA", catalog = "", schema = "GESTIONUSUARIOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accionpermitidaplantilla.findAll", query = "SELECT a FROM Accionpermitidaplantilla a"),
    @NamedQuery(name = "Accionpermitidaplantilla.findByPkAccionpermitidaplantilla", query = "SELECT a FROM Accionpermitidaplantilla a WHERE a.pkAccionpermitidaplantilla = :pkAccionpermitidaplantilla")})
public class Accionpermitidaplantilla implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PK_ACCIONPERMITIDAPLANTILLA", nullable = false)
    private Integer pkAccionpermitidaplantilla;
    @JoinColumn(name = "FK_ACCIONPERMITIDA", referencedColumnName = "PK_ACCIONPERMITIDA", nullable = false)
    @ManyToOne(optional = false)
    private Accionpermitida fkAccionpermitida;
    @JoinColumn(name = "FK_PLANTILLAACCIONPERMITIDA", referencedColumnName = "PK_PLANTILLAACCIONPERMITIDA", nullable = false)
    @ManyToOne(optional = false)
    private Plantillaaccionpermitida fkPlantillaaccionpermitida;

    public Accionpermitidaplantilla() {
    }

    public Accionpermitidaplantilla(Integer pkAccionpermitidaplantilla) {
        this.pkAccionpermitidaplantilla = pkAccionpermitidaplantilla;
    }

    public Integer getPkAccionpermitidaplantilla() {
        return pkAccionpermitidaplantilla;
    }

    public void setPkAccionpermitidaplantilla(Integer pkAccionpermitidaplantilla) {
        this.pkAccionpermitidaplantilla = pkAccionpermitidaplantilla;
    }

    public Accionpermitida getFkAccionpermitida() {
        return fkAccionpermitida;
    }

    public void setFkAccionpermitida(Accionpermitida fkAccionpermitida) {
        this.fkAccionpermitida = fkAccionpermitida;
    }

    public Plantillaaccionpermitida getFkPlantillaaccionpermitida() {
        return fkPlantillaaccionpermitida;
    }

    public void setFkPlantillaaccionpermitida(Plantillaaccionpermitida fkPlantillaaccionpermitida) {
        this.fkPlantillaaccionpermitida = fkPlantillaaccionpermitida;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pkAccionpermitidaplantilla != null ? pkAccionpermitidaplantilla.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accionpermitidaplantilla)) {
            return false;
        }
        Accionpermitidaplantilla other = (Accionpermitidaplantilla) object;
        if ((this.pkAccionpermitidaplantilla == null && other.pkAccionpermitidaplantilla != null) || (this.pkAccionpermitidaplantilla != null && !this.pkAccionpermitidaplantilla.equals(other.pkAccionpermitidaplantilla))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "GestionUsuarios.JPA.Entidades.Accionpermitidaplantilla[ pkAccionpermitidaplantilla=" + pkAccionpermitidaplantilla + " ]";
    }
    
}
