CREATE TABLE [patient] (
  [patient_id] integer PRIMARY KEY,
  [first_name] nvarchar(64) NOT NULL,
  [last_name] nvarchar(64) NOT NULL,
  [gender] nvarchar(8) NOT NULL,
  [birth_date] date NOT NULL,
  [is_alive] bit NOT NULL DEFAULT (1)
)
GO

CREATE TABLE [test_appointment] (
  [test_appointment_id] integer PRIMARY KEY IDENTITY(1, 1),
  [service_id] integer NOT NULL,
  [patient_id] integer NOT NULL,
  [date] datetime NOT NULL,
  [result] text
)
GO

CREATE TABLE [doctor_appointment] (
  [appointment_id] integer PRIMARY KEY IDENTITY(1, 1),
  [service_id] integer NOT NULL,
  [doctor_id] integer NOT NULL,
  [patient_id] integer NOT NULL,
  [date] datetime NOT NULL,
  [treatment] text
)
GO

CREATE TABLE [department] (
  [department_id] integer PRIMARY KEY,
  [name] nvarchar(64) NOT NULL
)
GO

CREATE TABLE [service] (
  [service_id] integer PRIMARY KEY,
  [name] nvarchar(64) NOT NULL,
  [type] nvarchar(64) NOT NULL,
  [price] integer NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [bill] (
  [bill_id] integer PRIMARY KEY IDENTITY(1, 1),
  [patient_id] integer NOT NULL,
  [total_price] integer NOT NULL DEFAULT 0,
  [open_date] datetime NOT NULL,
  [close_date] datetime
)
GO

CREATE TABLE [bill_details] (
  [bill_id] integer,
  [service_id] integer,
  PRIMARY KEY ([bill_id], [service_id])
)
GO

CREATE TABLE [room] (
  [room_id] integer PRIMARY KEY,
  [department_id] integer NOT NULL,
  [capacity] integer NOT NULL
)
GO

CREATE TABLE [doctor] (
  [doctor_id] integer PRIMARY KEY,
  [first_name] nvarchar(32) NOT NULL,
  [last_name] nvarchar(32) NOT NULL,
  [department_id] integer NOT NULL
)
GO

CREATE TABLE [stay] (
  [stay_id] integer PRIMARY KEY IDENTITY(1, 1),
  [patient_id] integer NOT NULL,
  [start_date] datetime NOT NULL,
  [end_date] datetime,
  [room_id] integer NOT NULL,
  [diagnosis] nvarchar(128) NOT NULL
)
GO

CREATE TABLE [surgery] (
  [surgery_id] integer PRIMARY KEY IDENTITY(1, 1),
  [service_id] integer NOT NULL,
  [date] datetime NOT NULL,
  [description] text NOT NULL,
  [patient_id] integer NOT NULL,
  [doctor_id] integer NOT NULL,
  [is_complicated] bit,
  [is_successful] bit
)
GO

ALTER TABLE [test_appointment] ADD FOREIGN KEY ([service_id]) REFERENCES [service] ([service_id])
GO

ALTER TABLE [test_appointment] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [doctor_appointment] ADD FOREIGN KEY ([service_id]) REFERENCES [service] ([service_id])
GO

ALTER TABLE [doctor_appointment] ADD FOREIGN KEY ([doctor_id]) REFERENCES [doctor] ([doctor_id])
GO

ALTER TABLE [doctor_appointment] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [bill] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [bill_details] ADD FOREIGN KEY ([bill_id]) REFERENCES [bill] ([bill_id])
GO

ALTER TABLE [bill_details] ADD FOREIGN KEY ([service_id]) REFERENCES [service] ([service_id])
GO

ALTER TABLE [room] ADD FOREIGN KEY ([department_id]) REFERENCES [department] ([department_id])
GO

ALTER TABLE [doctor] ADD FOREIGN KEY ([department_id]) REFERENCES [department] ([department_id])
GO

ALTER TABLE [stay] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [stay] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([room_id])
GO

ALTER TABLE [surgery] ADD FOREIGN KEY ([service_id]) REFERENCES [service] ([service_id])
GO

ALTER TABLE [surgery] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [surgery] ADD FOREIGN KEY ([doctor_id]) REFERENCES [doctor] ([doctor_id])
GO
