CREATE TABLE Positions (
    position_id SERIAL PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    position_id INT NOT NULL,
    FOREIGN KEY (position_id) REFERENCES Positions(position_id) ON DELETE RESTRICT
);

CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    duration_min INT NOT NULL
);

CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    employee_id INT NOT NULL,
    appointment_datetime TIMESTAMP NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Ожидается' NOT NULL,
    payment_method VARCHAR(30),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE RESTRICT
);

CREATE TABLE Appointment_Details (
    appointment_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    actual_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Services(service_id) ON DELETE RESTRICT
);
