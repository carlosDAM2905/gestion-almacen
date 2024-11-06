import java.util.Date;

public class Ubicacion {
    private int idProducto;
    private int idAlmacen;
    private Date fecha;

    public Ubicacion(int idProducto, int idAlmacen, Date fecha) {
        this.idProducto = idProducto;
        this.idAlmacen = idAlmacen;
        this.fecha = fecha;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Ubicacion{" +
                "idProducto=" + idProducto +
                ", idAlmacen=" + idAlmacen +
                ", fecha=" + fecha +
                '}';
    }
}
