using System.Data.SqlClient;
using Dapper;

public class DB
{
    private static string _connectionString = @"Server=localhost;DataBase=Uni;Trusted_Connection=True;";
    //private static string _connectionString =  @"Server=BANGHODEMATEO;DataBase=Uni;Trusted_Connection=True;";

    /*public static void RegistroUni(Universidades universidad)
    {
        string sql = "INSERT INTO Universidades (Nombre, Foto, Ubicacion, Tipo, Ubicacion, Descripcion, Valoracion) VALUES (@pnombre, @pfoto, @pubi, @ptipo, @pdescripcion, @pidusuario)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{pnombre = universidad.Nombre, pfoto = universidad.Foto, pubi = universidad.Ubicación, ptipo = universidad.Tipo, pdescripcion = universidad.Descripcion, pidusuario = universidad.IdUsuario});
        }
        
    }
    public static void RegistroProf(Profesores profesor)
    {
        string sql = "INSERT INTO Estudiantes (Nombre, Apellido, Foto, FechaNac, Bio) VALUES (@pnombre, @papellido, @pfoto, @pfnac, @pbio, @pidusuario)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{pnombre = profesor.Nombre, papellido = profesor.Apellido, pfoto = profesor.Foto, pfnac = profesor.FechaNac, pbio = profesor.Bio, pidusuario = profesor.IdUsuario});
        }
        }*/
    public static void RegistroEst(Estudiantes estudiante)
    {
        if (estudiante.IdUsuario == null || estudiante.IdUsuario == 0)
        {
            throw new InvalidOperationException("IdUsuario no puede ser NULL o 0.");
        }

        string sql = "INSERT INTO Estudiantes (Nombre, Apellido, Foto, FechaNac, Carrera, IdUsuario) " +
                    "VALUES (@pnombre, @papellido, @pfoto, @pfnac, @pcarrera, @pidusuario)";
        
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new
            {
                pnombre = estudiante.Nombre,
                papellido = estudiante.Apellido,
                pfoto = estudiante.Foto ?? (object)DBNull.Value,
                pfnac = estudiante.FechaNac,  // No es necesario hacer conversión, ya es DateTime?
                pcarrera = estudiante.Carrera ?? (object)DBNull.Value,
                pidusuario = estudiante.IdUsuario
            });
        }
    }


    public static int RegistroUsuario(Usuarios usuario)
    {
        string sql = "INSERT INTO Usuarios (Tipo, NombreUsuario, Mail ,Contraseña) OUTPUT INSERTED.Id VALUES ( @ptipo, @pnombreUsuario, @pmail, @pcontraseña)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Open();
            // Ejecuta la consulta y obtiene el ID insertado
            int userId = db.ExecuteScalar<int>(sql, new 
            {
                ptipo = usuario.Tipo,
                pnombreUsuario = usuario.NombreUsuario,
                pmail = usuario.Mail,
                pcontraseña = usuario.Contraseña
            });
            return userId;
        }
    }


    public static int ObtenerIdUsuario(string mail)
    {
        int idUsuario = 0;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Id FROM Usuarios WHERE Mail = @pmail";
            idUsuario = db.QueryFirstOrDefault<int>(sql, new { pmail = mail });
        }
        return idUsuario;
    }
    public static Estudiantes MostrarInfoEst(int pId)
    {
        Estudiantes estudiante = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
                SELECT e.Id, e.Nombre, e.Apellido, 
                    e.FechaNac, c.Nombre AS Carrera, e.IdUsuario
                FROM Estudiantes e
                LEFT JOIN Carreras c ON e.Carrera = c.Id
                WHERE e.IdUsuario = @pId";

            // Ejecutar la consulta y obtener el primer registro
            estudiante = db.QueryFirstOrDefault<Estudiantes>(sql, new { pId = pId });
        }
        return estudiante;
    }





    public static void ActualizarInfoEst(Estudiantes estudiante, string pnombre, string pfoto, string papellido, DateOnly pfnac, string pcarrera, string pcursada)
    {
        string sql = "UPDATE Estudiantes SET Nombre = @pnombre, Apellido = @papellido, Foto = @pfoto, FechaNac = @pfnac, Carrera = @pcarrera, Cursada = @pcursada WHERE Id = @pId";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{pnombre = estudiante.Nombre, papellido = estudiante.Apellido, pfoto = estudiante.Foto, pfnac = estudiante.FechaNac, pcarrera = estudiante.Carrera, pcursada = estudiante.Cursada});
        }
    }
    public static Universidades MostrarInfoUni(int pId)
    {
        Universidades universidad = new Universidades();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Universidades WHERE Id = @pId";
            universidad = db.QueryFirstOrDefault<Universidades>(sql, new{pId = pId});
        }
        return universidad;
    }
    public static Carreras MostrarInfoCarrera(int pId)
    {
        Carreras carrera = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Carreras WHERE Id = @pId";
            carrera = db.QueryFirstOrDefault<Carreras>(sql, new { pId = pId });
        }
        return carrera;
    }

    public static List<Becas> BecasXUni(int idUni)
    {
        List<Becas> becas = new List<Becas>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Becas WHERE IdUniversidad = @pIdUni";
            becas = db.Query<Becas>(sql, new{pIdUni = idUni}).ToList();
        }
        return becas;
    }
    public static List<Condiciones> CondicionesXUni(int idUni)
    {
        List<Condiciones> condiciones = new List<Condiciones>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Condiciones WHERE IdUniversidad = @pIdUni";
            condiciones = db.Query<Condiciones>(sql, new{pIdUni = idUni}).ToList();
        }
        return condiciones;
    }
    public static List<Preguntas> ObtenerPreguntasTest()
    {
        List<Preguntas> preguntas = new List<Preguntas>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Preguntas";
            preguntas = db.Query<Preguntas>(sql).ToList();
        }
        return preguntas;
    }

    public static List<Carreras> ObtenerCarreras()
    {
        List<Carreras> carreras = new List<Carreras>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Carreras";
            carreras = db.Query<Carreras>(sql).ToList();
        }
        return carreras;
    }

    
    public static ResultadoBusqueda Busqueda(string datoIng)
    {
        ResultadoBusqueda resultados = new ResultadoBusqueda 
        {
            Universidadesr = new List<Universidades>(),
            Carrerasr = new List<Carreras>()
        };
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Universidades WHERE Nombre LIKE @pDatoIng";
            resultados.Universidadesr = db.Query<Universidades>(sql, new {pDatoIng = "%" + datoIng + "%" }).ToList();
            sql = "SELECT * FROM Carreras WHERE Nombre LIKE @pDatoIng";
            resultados.Carrerasr = db.Query<Carreras>(sql, new {pDatoIng = "%" + datoIng + "%" }).ToList();
            
        }        

        return resultados;        
    }
    public static bool VerificarLogin(string mail, string contra)
    {
        Usuarios usuario = null;
        usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Mail, Contraseña FROM Usuarios WHERE Mail = @pmail AND Contraseña = @pcontraseña";
            usuario = db.QueryFirstOrDefault<Usuarios>(sql, new{pmail = mail, pcontraseña = contra});
        }
        if(usuario != null)
        return true;
        else
        return false;
    }

    public static Usuarios ObtenerUsuarioPorEmail(string mail)
    {
        Usuarios usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuarios WHERE Mail = @pmail";
            usuario = db.QueryFirstOrDefault<Usuarios>(sql, new{pmail = mail});
        }
        return usuario;
    }

    public static Usuarios ObtenerUsuarioPorId(int id)
    {
        Usuarios usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuarios WHERE Id = @pid";
            usuario = db.QueryFirstOrDefault<Usuarios>(sql, new{pid = id});
        }
        return usuario;
    }

    public static List<Carreras> ObtenerCarrerasDeCarrerasXUniversidad()
    {
        List<Carreras> carreras = new List<Carreras>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Carreras WHERE Id IN (SELECT idCarrera FROM CarrerasXUniversidad)";
            carreras = db.Query<Carreras>(sql).ToList();
        }
        return carreras;
    }
    public static List<Universidades>  ObtenerUniversidadesConCarrera(int id)
    {
        List<Universidades> universidades = new List<Universidades>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Universidades WHERE Id IN (SELECT idUniversidad FROM CarrerasXUniversidad WHERE idCarrera = @pId)";
            universidades = db.Query<Universidades>(sql, new{pId = id}).ToList();
        }
        return universidades;
    }

    public static CarreraXUniversidad ObtenerCarreraXUniversidad(int idCarrera, int idUniversidad)
    {
        CarreraXUniversidad carrera = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM CarrerasXUniversidad WHERE idCarrera = @pidCarrera AND idUniversidad = @pidUniversidad";
            carrera = db.QueryFirstOrDefault<CarreraXUniversidad>(sql, new{pidCarrera = idCarrera, pidUniversidad = idUniversidad});
        }
        return carrera;
    }
}

