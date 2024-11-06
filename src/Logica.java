import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class Logica {

    public void menu() {
        Scanner teclado = new Scanner(System.in);

        String url = "jdbc:mysql://localhost:3306/gestion_almacen";
        String user = "root";
        String password = "";

        try (Connection conexion = DriverManager.getConnection(url, user, password)) {
            EmpleadoDAO empleadoDAO = new EmpleadoDAO(conexion);
            ProductoDAO productoDAO = new ProductoDAO(conexion);

            int opcion;

            do {
                System.out.println("======================\nGESTIÓN DE ALMACEN\n======================");
                System.out.println("0. SALIR DEL PROGRAMA");
                System.out.println("1. DAR DE ALTA EMPLEADO");
                System.out.println("2. DAR DE BAJA EMPLEADO");
                System.out.println("3. AGREGAR PRODUCTO");
                System.out.println("4. ELIMINAR PRODUCTO");

                opcion = teclado.nextInt();
                switch (opcion) {
                    case 1:
                        System.out.println("Introduce id empleado:");
                        int id = teclado.nextInt();teclado.nextLine();
                        System.out.println("Introduce categoría del empleado:");
                        String categoria = teclado.nextLine();
                        System.out.println("Introduce el puesto del empleado:");
                        String puesto = teclado.nextLine();
                        System.out.println("Introduce código de almacén del empleado:");
                        int almacen = teclado.nextInt();teclado.nextLine();
                        empleadoDAO.insertarEmpleado(new Empleado(id, categoria, puesto, almacen));
                        break;

                    case 2:
                        System.out.println("Introduce el id del empleado que quieres dar de baja: ");
                        id = teclado.nextInt();teclado.nextLine();
                        empleadoDAO.eliminarEmpleado(id);
                        break;

                    case 3:
                        System.out.println("Introduce id del producto:");
                        int idProducto = teclado.nextInt();teclado.nextLine();
                        System.out.println("Introduce fabricante:");
                        String fabricante = teclado.nextLine();
                        System.out.println("Introduce cantidad:");
                        int cantidad = teclado.nextInt();teclado.nextLine();
                        System.out.println("Introduce id empleado:");
                        int idEmpleado = teclado.nextInt();teclado.nextLine();
                        productoDAO.agregarProducto(new Producto(idProducto, fabricante, cantidad, idEmpleado));
                        break;

                    case 4:
                        System.out.println("Introduce id del producto que quieras eliminar:");
                        idProducto = teclado.nextInt();teclado.nextLine();
                        productoDAO.eliminarProducto(idProducto);

                    default:
                        if (opcion == 0) {
                            System.out.println("Hasta pronto");
                        }
                }
            } while (opcion != 0);

        } catch (SQLException e) {
            System.out.println("Error de conexión a la base de datos " + e.getMessage());
        }




    }
}
