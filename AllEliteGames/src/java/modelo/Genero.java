package modelo;

public class Genero {
    private int codigoGenero;
    private String genero;
    private String edadRecomendable;
    private String popularidad;
    private String publicoObjetivo;
    private String estado;

    public Genero() {
    }

    public Genero(int codigoGenero, String genero, String edadRecomendable, String popularidad, String publicoObjetivo, String estado) {
        this.codigoGenero = codigoGenero;
        this.genero = genero;
        this.edadRecomendable = edadRecomendable;
        this.popularidad = popularidad;
        this.publicoObjetivo = publicoObjetivo;
        this.estado = estado;
    }

    public int getCodigoGenero() {
        return codigoGenero;
    }

    public void setCodigoGenero(int codigoGenero) {
        this.codigoGenero = codigoGenero;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEdadRecomendable() {
        return edadRecomendable;
    }

    public void setEdadRecomendable(String edadRecomendable) {
        this.edadRecomendable = edadRecomendable;
    }

    public String getPopularidad() {
        return popularidad;
    }

    public void setPopularidad(String popularidad) {
        this.popularidad = popularidad;
    }

    public String getPublicoObjetivo() {
        return publicoObjetivo;
    }

    public void setPublicoObjetivo(String publicoObjetivo) {
        this.publicoObjetivo = publicoObjetivo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}