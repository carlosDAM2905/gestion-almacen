public class Producto {
    private int id;
    private String fabricante;
    private int cantidad;
    private int idEmpleado;

    public Producto(int id, String fabricante, int cantidad, int idEmpleado) {
        this.id = id;
        this.fabricante = fabricante;
        this.cantidad = cantidad;
        this.idEmpleado = idEmpleado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }



}
