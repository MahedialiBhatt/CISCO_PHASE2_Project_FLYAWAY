use flyawaydb;

create table login(
   u_name varchar(255) NOT NULL,
   u_pass varchar(255) NOT NULL,
   PRIMARY KEY(u_name)
);

create table flight_details(
   airline_name varchar(255) NOT NULL,
   price decimal(10,2) NOT NULL,
   flight_no int(13) NOT NULL,
   source varchar(255) NOT NULL,
   destination varchar(255) NOT NULL,
   total_seats int(4) NOT NULL,
   booked_seats int(4) NOT NULL,
   seat_availibility int(4) NOT NULL,
   date_of_travel date NOT NULL,
   class varchar(10) NOT NULL,
   PRIMARY KEY(flight_no)
);

create table register_details(
   full_name varchar(255) NOT NULL,
   address varchar(80) NOT NULL,
   age int(3) NOT NULL,
   mobile varchar(255) NOT NULL,
   email_id varchar(255) NOT NULL,
   personal_identity_id varchar(255) NOT NULL,
   country varchar(25) NOT NULL,
   PRIMARY KEY(email_id)
);

create table booking(
  email_id varchar(255) NOT NULL,
  booking_id varchar(25) NOT NULL,
  flight_no int(13) NOT NULL,
  PRIMARY KEY(email_id),
  CONSTRAINT email_id_fk FOREIGN KEY (email_id) REFERENCES register_details (email_id),
  CONSTRAINT flight_no_fk FOREIGN KEY (flight_no) REFERENCES flight_details (flight_no)
);

create table admin(
  uname varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  PRIMARY KEY(uname)
);
INSERT INTO login(u_name,u_pass)
       values("xyz@xyz","123456");  

INSERT INTO admin(uname,pass)
         values ("admin","admin123");  