import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmpleadoDAO {
    private Connection conexion;

    //constructor:

    public EmpleadoDAO(Connection conexion) {
        this.conexion = conexion;
    }

    //insertar un nuevo almacén:
    public void insertarEmpleado(Empleado empleado) {
        String insertSql = "INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (?,?,?,?)";
        try (PreparedStatement stmt = conexion.prepareStatement(insertSql)) {
            stmt.setInt(1, empleado.getId());
            stmt.setString(2, empleado.getCategoria());
            stmt.setString(3, empleado.getPuesto());
            stmt.setInt(4, empleado.getIdAlmacen());
            stmt.executeUpdate();
            System.out.println("Empleado insertado con éxito");

        } catch (SQLException e) {
            System.out.println("Error al insertar empleado en la base de datos " + e.getMessage());
        }
    }

    public void eliminarEmpleado(int idEmpleado) {
        String deleteSql = "DELETE FROM empleados WHERE id = ?";

        try (PreparedStatement stmt = conexion.prepareStatement(deleteSql)) {
            stmt.setInt(1, idEmpleado);

            int filasAfectadas = stmt.executeUpdate();

            if (filasAfectadas > 0) {
                System.out.println("Empleado con ID: " + idEmpleado + " dado de baja con éxito");
            }





        } catch (SQLException e) {
            System.out.println("No se ha podido dar de baja al empleado " + e.getMessage() );
        }
    }


}
