const express = require('express');
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const storage = multer.diskStorage({  //diskStorage permite guardar los archivos en el disco duro del servidor.
	destination: function (req, file, cb){
		cb(null, 'public/imagenes') // indica la carpeta donde se almacenarán los archivos.
	},
	filename: function (req, file, cb){
		const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9); // está generando un nombre único para el archivo utilizando la fecha actual y un número aleatorio.
		const ext = path.extname(file.originalname); 
		cb(null, file.fieldname + '-' + uniqueSuffix + ext);
	}
});
const upload = multer({storage: storage}); 

// Configuración de MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'joselyn2',
  password: '123',
  database: 'veterinaria'
});

// Conexión a MySQL
connection.connect((err) => {
  if (err) {
    console.error('Error de conexión a MySQL: ' + err.stack);
    return;
  }
  console.log('Conexión a MySQL establecida con el ID ' + connection.threadId);
});

// Ruta para procesar el formulario y guardar los datos
app.post('/registrar', upload.single('foto'), (req, res) => {
  const { nombre, direccion, telefono, correo,fecha_registro,tipo_membresia, fecha_inicio, fecha_vencimiento, mascota,fecha_nacimiento, especie, raza, sexo } = req.body;
  
  let foto = '';
  if (req.file) {
    foto = req.file.filename;
  }
  
  
 
   // El precio de la membresía se almacena en la constante opciones_membresia como un objeto con claves premium y basica que corresponden a los valores de precio para los diferentes tipos de membresía.
   const opciones_membresia = {
    premium: 200.00,
    basica: 100.00
  };
  const precio_membresia = opciones_membresia[tipo_membresia]; //se recupera utilizando la notación de corchetes y se almacena en la constante precio_membresia

 // Verificar que el precio de la membresía es un valor válido
 if (isNaN(precio_membresia)) {
  return res.status(400).send('Tipo de membresía inválido');
}
  
  // Insertar datos en la tabla de clientes
  const cliente = {
    nombre: nombre,
    direccion: direccion,
    telefono: telefono,
    correo: correo ,
    fecha_registro: fecha_registro,


  };
  connection.query('INSERT INTO clientes SET ?', cliente, (err, result) => {
    if (err) throw err;
    console.log('Cliente registrado con el ID ' + result.insertId);
    
    // Insertar datos en la tabla de mascotas
    const mascotaData = {
      
      nombre: mascota,
      especie: especie,
      fecha_nacimiento: fecha_nacimiento,
      raza: raza,
      sexo: sexo,
      fotografia: foto,
      id_cliente: result.insertId
    };
    connection.query('INSERT INTO mascotas SET ?', mascotaData, (err, result) => {
      if (err) throw err;
      console.log('Mascota registrada con el ID ' + result.insertId);
      
      // Insertar datos en la tabla de membresia
      const membresia = {
        
        tipo_membresia: tipo_membresia,
        fecha_inicio: fecha_inicio,
        fecha_vencimiento: fecha_vencimiento,
        costo: precio_membresia,
        id_cliente: result.insertId,
        
       
      };
      connection.query('INSERT INTO membresia SET ?', membresia, (err, result) => {
        if (err) throw err;
        console.log('Membresía registrada con el ID ' + result.insertId);
        
        res.redirect('/');
        
      });
    });
  });
});

app.use(express.static(__dirname));


app.get("/",(req,res)=> {
return res.redirect('index.html')});


//El puerto utilizado
app.listen(4000, () => console.log('Servidor iniciado en el puerto 4000'));
