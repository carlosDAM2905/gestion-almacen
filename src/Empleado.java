public class Empleado {
    private int id;
    private String categoria;
    private String puesto;
    private int idAlmacen;

    public Empleado(int id, String categoria, String puesto, int idAlmacen) {
        this.id = id;
        this.categoria = categoria;
        this.puesto = puesto;
        this.idAlmacen = idAlmacen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }


}
