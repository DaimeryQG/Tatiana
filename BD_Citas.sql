-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CURP VARCHAR(18),
    RFC VARCHAR(13),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    INDEX idx_email (email) -- Índice para mejorar la búsqueda por email
);

-- Creación de la tabla Pacientes
CREATE TABLE Pacientes (
    paciente_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

-- Creación de la tabla Doctores
CREATE TABLE Doctores (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

-- Creación de la tabla Citas
CREATE TABLE Citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    doctor_id INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    notificado BOOLEAN DEFAULT FALSE,
    motivo TEXT,
    notas TEXT,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id),
    INDEX idx_fecha_cita (fecha_cita) -- Índice para mejorar la búsqueda por fecha
);

-- Creación de la tabla HistorialCitas
CREATE TABLE HistorialCitas (
    historial_id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT NOT NULL,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    FOREIGN KEY (cita_id) REFERENCES Citas(cita_id)
);

-- Creación de la tabla Recordatorios
CREATE TABLE Recordatorios (
    recordatorio_id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT NOT NULL,
    fecha_recordatorio DATETIME,
    mensaje TEXT,
    FOREIGN KEY (cita_id) REFERENCES Citas(cita_id)
);

-- Creación de la tabla DisponibilidadDoctores
CREATE TABLE DisponibilidadDoctores (
    disponibilidad_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    dia ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id)
);
