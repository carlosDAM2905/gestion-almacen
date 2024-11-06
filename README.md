
# 🏢 Sistema de Gestión de Almacén

Este proyecto es una aplicación de consola desarrollada en **Java** que permite gestionar empleados y productos en un almacén, almacenando los datos en una base de datos MySQL. Utiliza el patrón de diseño DAO (Data Access Object) para organizar las operaciones de acceso a datos y transacciones en la base de datos, lo que facilita su mantenimiento y escalabilidad.

## 📋 Descripción del Proyecto

El sistema de gestión de almacén permite realizar las siguientes operaciones esenciales:
- **Alta y baja de empleados y productos** en la base de datos.
- **Gestión de inventario**: control de cantidad y ubicación de productos en distintos almacenes.
- **Consultas específicas**: opciones para verificar detalles del inventario, buscar productos específicos, y consultar información de empleados.

Este proyecto es ideal para aprender los fundamentos de conexión a bases de datos, el uso de JDBC en Java, y la implementación de patrones de diseño orientados a objetos.

## 🚀 Funcionalidades

- **Gestión de empleados**: Registrar, actualizar y eliminar empleados, vinculando cada uno con un almacén específico.
- **Gestión de productos**: Agregar, actualizar y eliminar productos, asignando un responsable para cada producto.
- **Consulta de inventario**: Opciones para verificar los productos y consultar su ubicación, cantidad, y detalles específicos.
- **Lógica de negocio avanzada**: Incluye triggers, vistas y procedimientos almacenados en la base de datos para automatizar operaciones y mantener la integridad de los datos.

## 🛠️ Tecnologías y Conceptos Usados

- **Java**: Lenguaje de programación principal.
- **JDBC (Java Database Connectivity)**: Para conectar y realizar operaciones en la base de datos MySQL.
- **MySQL**: Base de datos utilizada para almacenar información de empleados, productos, y ubicaciones.
- **Patrón DAO**: Implementado en las clases `EmpleadoDAO` y `ProductoDAO` para encapsular las operaciones de acceso a datos.
- **POO (Programación Orientada a Objetos)**: Clases como `Empleado`, `Producto`, `Almacen`, y `Ubicacion` representan entidades del sistema y encapsulan la lógica relacionada.
- **SQL Avanzado**: Uso de procedimientos almacenados, triggers y vistas para una lógica de negocio robusta en el lado de la base de datos.

## 🧩 Estructura del Proyecto

### Clases Principales

- **Clase `Almacen`**: Representa un almacén, con atributos para ID, responsable, ubicación y capacidad.
- **Clase `Empleado`**: Representa un empleado con atributos de ID, categoría, puesto y almacén asignado.
- **Clase `Producto`**: Representa un producto con atributos de ID, fabricante, cantidad, y el empleado responsable.
- **Clase `EmpleadoDAO`**: Gestiona operaciones CRUD para empleados.
- **Clase `ProductoDAO`**: Gestiona operaciones CRUD para productos.
- **Clase `Logica`**: Contiene el menú de la consola, permitiendo al usuario interactuar con el sistema.
- **Clase `Main`**: Punto de entrada de la aplicación.

## 📖 Ejemplo de Uso

1. **Alta de Empleado**:
    - Selecciona la opción "1. DAR DE ALTA EMPLEADO" en el menú de la consola.
    - Ingresa los datos del empleado (ID, categoría, puesto, ID del almacén).
    - El sistema confirma que el empleado ha sido agregado a la base de datos.

2. **Alta de Producto**:
    - Selecciona "3. AGREGAR PRODUCTO" en el menú.
    - Ingresa los datos del producto (ID, fabricante, cantidad, ID del empleado responsable).
    - El sistema muestra un mensaje de confirmación después de almacenar el producto en la base de datos.

## ⚙️ Configuración y Ejecución

1. **Configura la Base de Datos**:
   - Este proyecto ya incluye el driver MySQL en la carpeta lib/, por lo que no es necesario descargarlo aparte. 
     Aunque ya está configurado por defecto, en caso de error, 
     asegúrate de que tu entorno de desarrollo (como IntelliJ IDEA) lo tenga configurado en las dependencias 
     para poder ejecutar la conexión con la base de datos.
   - Abre tu cliente de MySQL (como **MySQL Workbench** o **DataGrip**).
   - Ejecuta el archivo `sql/database_creation.sql` para crear la base de datos y las tablas necesarias.
   - Luego, ejecuta `sql/database_operations.sql` para configurar los procedimientos almacenados, triggers y vistas.

2. **Clona este Repositorio**:
   ```bash
   git clone https://github.com/tu-usuario/gestion-almacen.git
   ```

3. **Configura la Conexión a la Base de Datos en el Código**:
   - En la clase `Logica.java`, configura las credenciales de conexión a MySQL:
     ```java
     String url = "jdbc:mysql://localhost:3306/gestion_almacen";
     String user = "tu_usuario";
     String password = "tu_contraseña";
     ```

4. **Ejecuta la Aplicación**:
   - Abre el proyecto en IntelliJ IDEA y ejecuta la clase `Main` para iniciar la aplicación.
   - Usa el menú interactivo de la consola para probar las funcionalidades de gestión de empleados y productos.

## 📂 Estructura de Carpetas del Proyecto

```
gestion-almacen/
├── sql/
│   ├── database_creation.sql      # Script para crear la base de datos y las tablas
│   └── database_operations.sql    # Script para configurar procedimientos, triggers y vistas
├── src/
│   └── manejodeconectores/
│       └── gestionalmacen/
│           ├── Almacen.java
│           ├── Empleado.java
│           ├── EmpleadoDAO.java
│           ├── Producto.java
│           ├── ProductoDAO.java
│           ├── Logica.java
│           ├── Main.java
│           └── Ubicacion.java
├── README.md
└── .gitignore
```

## 🌟 Próximos Pasos y Posibles Mejoras

- **Añadir Interfaz Gráfica**: Implementar una interfaz gráfica (GUI) usando JavaFX para mejorar la usabilidad.
- **Expansión de Funcionalidades**: Agregar opciones avanzadas de filtrado, reportes, o estadísticas de inventario.
- **Validaciones Avanzadas**: Asegurar que los datos ingresados sean válidos y estén completos, con mensajes de error descriptivos para los usuarios.

## 📬 Contacto

Si tienes alguna pregunta o sugerencia sobre el proyecto, no dudes en contactarme en [LinkedIn](https://linkedin.com/tu-perfil) o abrir un **issue** en GitHub.
