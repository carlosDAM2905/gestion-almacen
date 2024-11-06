import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductoDAO {

    private Connection conexion;

    public ProductoDAO(Connection conexion) {
        this.conexion = conexion;
    }

    public void agregarProducto(Producto producto) {
        String query = "INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (?,?,?,?)";


        try (PreparedStatement stmt = conexion.prepareStatement(query)) {
            stmt.setInt(1, producto.getId());
            stmt.setString(2, producto.getFabricante());
            stmt.setInt(3, producto.getCantidad());
            stmt.setInt(4, producto.getIdEmpleado());
            stmt.executeUpdate();
            System.out.println("Producto añadido con éxito");
        } catch (SQLException e) {
            System.out.println("Error al agregar el producto " + e.getMessage());
        }
    }

    public void eliminarProducto(int idProducto) {
        String query = "DELETE FROM productos WHERE id = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(query)) {
            stmt.setInt(1, idProducto);

            int filasAfectadas = stmt.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("Producto eliminado con éxito");
            }

        } catch (SQLException e) {
            System.out.println("Error al eliminar el producto " + e.getMessage());
        }

    }
}
