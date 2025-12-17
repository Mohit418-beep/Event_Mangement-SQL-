Create Database sqll;
use sqll;

#1 Venue Table
CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    capacity INT NOT NULL
);

# Insert in Venue
INSERT INTO Venues
(venue_id, venue_name, location, capacity)
VALUES
(1, 'Grand Convention Hall', 'Mumbai', 1000),
(2, 'Open Air Arena', 'Delhi', 2000),
(3, 'Tech Park Auditorium', 'Bengaluru', 500),
(4, 'City Conference Center', 'Pune', 800),
(5, 'Expo Exhibition Hall', 'Hyderabad', 1500),
(6, 'Royal Banquet Hall', 'Jaipur', 600),
(7, 'Lakeview Conference Hall', 'Udaipur', 400),
(8, 'International Expo Center', 'Noida', 3000),
(9, 'Cultural Arts Theatre', 'Kolkata', 900),
(10, 'Heritage Convention Hall', 'Chennai', 1200);

# Retrive table
select * from Venues;

#2 Organizers
CREATE TABLE Organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

# Insert into Organizers
INSERT INTO Organizers
(organizer_id, organizer_name, contact_email, phone_number)
VALUES
(1, 'TechWorld Events', 'contact@techworld.com', '9876543210'),
(2, 'MusicMania Pvt Ltd', 'info@musicmania.com', '9123456780'),
(3, 'AI Innovations', 'support@aiinnovations.com', '9988776655'),
(4, 'Business Leaders Group', 'hello@businessleaders.com', '9090909090'),
(5, 'EventPro Solutions', 'events@eventpro.com', '9812345678'),
(6, 'Digital Minds', 'team@digitalminds.com', '9765432109'),
(7, 'Startup Hub', 'connect@startuphub.com', '9654321098'),
(8, 'HealthCare Events', 'care@healthcareevents.com', '9543210987'),
(9, 'EduNext Conferences', 'info@edunext.com', '9432109876'),
(10, 'Creative Sparks', 'hello@creativesparks.com', '9321098765');
# Retrive Data
Select * from organizers;

#3 Attendees
CREATE TABLE Attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

# Insert into Attendees
INSERT INTO Attendees
(attendee_id, name, email, phone_number)
VALUES
(1, 'Rahul Sharma', 'rahul.sharma@email.com', '9876543210'),
(2, 'Anita Verma', 'anita.verma@email.com', '9123456789'),
(3, 'Amit Kumar', 'amit.kumar@email.com', '9988776655'),
(4, 'Priya Singh', 'priya.singh@email.com', '9090909090'),
(5, 'Suresh Patel', 'suresh.patel@email.com', '9812345678'),
(6, 'Neha Gupta', 'neha.gupta@email.com', '9765432109'),
(7, 'Rohit Mehta', 'rohit.mehta@email.com', '9654321098'),
(8, 'Kavita Iyer', 'kavita.iyer@email.com', '9543210987'),
(9, 'Vikas Rao', 'vikas.rao@email.com', '9432109876'),
(10, 'Pooja Nair', 'pooja.nair@email.com', '9321098765');
# Retrive Attendees
Select * from Attendees;

#4 Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT,
    organizer_id INT,
    ticket_price DECIMAL(10,2),
    total_seats INT,
    available_seats INT,
    
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES Organizers(organizer_id)
);

# Insert into events
INSERT INTO Events
(event_id, event_name, event_date, venue_id, organizer_id, ticket_price, total_seats, available_seats)
VALUES
(1, 'Tech Conference 2025', '2025-03-15', 1, 1, 1500.00, 500, 500),
(2, 'Music Festival', '2025-04-10', 2, 2, 2500.00, 1000, 850),
(3, 'Startup Meetup', '2025-02-20', 3, 1, 500.00, 200, 120),
(4, 'AI Workshop', '2025-05-05', 1, 3, 2000.00, 300, 300),
(5, 'Business Summit', '2025-06-18', 4, 2, 3000.00, 600, 600),
(6, 'Digital Marketing Seminar', '2025-07-08', 5, 4, 1200.00, 400, 400),
(7, 'Data Science Bootcamp', '2025-08-12', 3, 3, 3500.00, 250, 200),
(8, 'Food Carnival', '2025-09-25', 6, 5, 800.00, 700, 650),
(9, 'Healthcare Conference', '2025-10-14', 7, 4, 2200.00, 450, 450),
(10, 'Entrepreneurship Forum', '2025-11-30', 8, 2, 1800.00, 900, 900);
# Retrive Data'
Select * from events;

#5 Tickets
CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    attendee_id INT NOT NULL,
    booking_date DATE NOT NULL,
    status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL,

    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id)
);

# Insert into Tickets
INSERT INTO Tickets
(ticket_id, event_id, attendee_id, booking_date, status)
VALUES
(1, 1, 1, '2025-01-10', 'Confirmed'),
(2, 2, 2, '2025-01-12', 'Confirmed'),
(3, 3, 3, '2025-01-15', 'Pending'),
(4, 4, 4, '2025-01-18', 'Confirmed'),
(5, 5, 5, '2025-01-20', 'Cancelled'),
(6, 6, 6, '2025-01-22', 'Confirmed'),
(7, 7, 7, '2025-01-25', 'Pending'),
(8, 8, 8, '2025-01-27', 'Confirmed'),
(9, 9, 9, '2025-01-29', 'Confirmed'),
(10, 10, 10, '2025-01-30', 'Confirmed');

# Retrive data
select * from tickets;

#6 Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    ticket_id INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) CHECK (payment_status IN ('Success', 'Failed', 'Pending')),
    payment_date DATE NOT NULL,

    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);

# Insert into Payments
INSERT INTO Payments
(payment_id, ticket_id, amount_paid, payment_status, payment_date)
VALUES
(1, 1, 1500.00, 'Success', '2025-01-11'),
(2, 2, 2500.00, 'Success', '2025-01-13'),
(3, 3, 500.00, 'Pending', '2025-01-16'),
(4, 4, 2000.00, 'Success', '2025-01-19'),
(5, 5, 3000.00, 'Failed', '2025-01-21'),
(6, 6, 1200.00, 'Success', '2025-01-23'),
(7, 7, 3500.00, 'Pending', '2025-01-26'),
(8, 8, 800.00, 'Success', '2025-01-28'),
(9, 9, 2200.00, 'Success', '2025-01-30'),
(10, 10, 1800.00, 'Success', '2025-01-31');

# Retrive data
select * from payments;

#1. Implement CRUD Operations (Low Weightage)
#Add, update, delete, and search for events, venues, organizers, attendees, and ticket bookings.
# Events(CRUD)
INSERT INTO Events
VALUES (11, 'Cloud Computing Seminar', '2025-12-10', 2, 4, 1600, 400, 400);

UPDATE Events
SET ticket_price = 1800
WHERE event_id = 11;

DELETE FROM Events
WHERE event_id = 11;

SELECT * FROM Events
WHERE event_name LIKE '%Conference%';

# Venue(CRUD)
INSERT INTO Venues
VALUES (11, 'Skyline Hall', 'Ahmedabad', 700);

UPDATE Venues
SET capacity = 900
WHERE venue_id = 11;

DELETE FROM Venues
WHERE venue_id = 11;

SELECT * FROM Venues
WHERE location = 'Mumbai';

# Organizers
INSERT INTO Organizers
VALUES (11, 'NextGen Events', 'info@nextgenevents.com', '9887766554');

UPDATE Organizers
SET phone_number = '9998887776'
WHERE organizer_id = 11;

DELETE FROM Organizers
WHERE organizer_id = 11;

SELECT * FROM Organizers
WHERE organizer_name LIKE '%Events%';

# Attendees
INSERT INTO Attendees
VALUES (11, 'Arjun Malhotra', 'arjun@email.com', '9876123456');

UPDATE Attendees
SET phone_number = '9999999999'
WHERE attendee_id = 11;

DELETE FROM Attendees
WHERE attendee_id = 11;

SELECT * FROM Attendees
WHERE name LIKE '%Rahul%';

# Tickets
INSERT INTO Tickets
VALUES (11, 2, 3, '2025-02-01', 'Confirmed');

UPDATE Tickets
SET status = 'Cancelled'
WHERE ticket_id = 11;

DELETE FROM Tickets
WHERE ticket_id = 11;

SELECT * FROM Tickets
WHERE status = 'Confirmed';

#2. Use SQL Clauses (WHERE, HAVING, LIMIT) (Low Weightage)
#. Get upcoming events happening in a specific city.
SELECT e.event_name, e.event_date, v.location
FROM Events e
JOIN Venues v ON e.venue_id = v.venue_id
WHERE v.location = 'Mumbai'
AND e.event_date > CURRENT_DATE;

#. Retrieve the top 5 highest revenue-generating events.
SELECT e.event_name, SUM(p.amount_paid) AS total_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_name
HAVING SUM(p.amount_paid) > 0
ORDER BY total_revenue DESC
LIMIT 5;

#. Find attendees who booked tickets in the last 7 days.
SELECT a.name, a.email, t.booking_date
FROM Attendees a
JOIN Tickets t ON a.attendee_id = t.attendee_id
WHERE t.booking_date >= CURRENT_DATE - INTERVAL 7 DAY;

#3. Apply SQL Operators (AND, OR, NOT) (Medium Weightage)
#. Retrieve events scheduled in December AND have more than 50% available seats.
SELECT event_name, event_date, total_seats, available_seats
FROM Events
WHERE MONTH(event_date) = 12
AND available_seats > total_seats / 2;

#. List attendees who have booked a ticket OR have a pending payment.
SELECT DISTINCT a.name, a.email
FROM Attendees a
LEFT JOIN Tickets t ON a.attendee_id = t.attendee_id
LEFT JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE t.ticket_id IS NOT NULL
OR (p.payment_status = 'Pending');

#. Identify events that are NOT fully booked.
SELECT event_name, total_seats, available_seats
FROM Events
WHERE NOT (available_seats = 0);

#4. Sorting & Grouping Data (ORDER BY, GROUP BY) (Medium Weightage)
#. Sort events by date in ascending order.
SELECT event_name, event_date, venue_id
FROM Events
ORDER BY event_date ASC;

#. Count the number of attendees per event.
SELECT e.event_name, COUNT(t.attendee_id) AS total_attendees
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
WHERE t.status = 'Confirmed'
GROUP BY e.event_name;

#. Show the total revenue generated per event.
SELECT e.event_name, SUM(p.amount_paid) AS total_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_name
ORDER BY total_revenue DESC;

#5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT) (High Weightage)
#. Calculate the total revenue generated from all events.
SELECT SUM(p.amount_paid) AS total_revenue
FROM Payments p
WHERE p.payment_status = 'Success';

#. Find the event with the highest number of attendees.
SELECT e.event_name, COUNT(t.attendee_id) AS total_attendees
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
WHERE t.status = 'Confirmed'
GROUP BY e.event_name
ORDER BY total_attendees DESC
LIMIT 1;

#· Compute the average ticket price across all events.
SELECT AVG(ticket_price) AS average_ticket_price
FROM Events;

#6. Establish Primary & Foreign Key Relationships (High Weightage)
#. Ensure that attendees cannot book the same event multiple times.
ALTER TABLE Tickets
ADD CONSTRAINT unique_event_attendee
UNIQUE (event_id, attendee_id);
Select * from Tickets;

#. Link payments to tickets, ensuring a valid foreign key relationship.
ALTER TABLE Payments
ADD CONSTRAINT fk_ticket
FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
select * from Payments;

#7. Implement Joins (High Weightage)
#. Retrieve event details along with venue information using INNER JOIN.
SELECT e.event_name, e.event_date, v.venue_name, v.location, v.capacity
FROM Events e
INNER JOIN Venues v ON e.venue_id = v.venue_id;

#. Get a list of attendees who booked a ticket but did not complete payment using LEFT JOIN.
SELECT a.name, a.email, t.ticket_id, p.payment_status
FROM Attendees a
JOIN Tickets t ON a.attendee_id = t.attendee_id
LEFT JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status IS NULL OR p.payment_status != 'Success';

#. Identify events without any attendees using RIGHT JOIN.
SELECT e.event_name, t.ticket_id
FROM Events e
RIGHT JOIN Tickets t ON e.event_id = t.event_id
WHERE t.attendee_id IS NULL;

#. Show attendees who have not booked any ticket using FULL OUTER JOIN.
SELECT a.name, a.email
FROM Attendees a
LEFT JOIN Tickets t ON a.attendee_id = t.attendee_id
WHERE t.ticket_id IS NULL
UNION
SELECT a.name, a.email
FROM Tickets t
RIGHT JOIN Attendees a ON t.attendee_id = a.attendee_id
WHERE t.ticket_id IS NULL;

#8. Use Subqueries (High Weightage)
#. Find events that generated revenue above the average ticket sales.
SELECT e.event_name, SUM(p.amount_paid) AS total_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_name
HAVING SUM(p.amount_paid) > (
    SELECT AVG(total) 
    FROM (
        SELECT SUM(p2.amount_paid) AS total
        FROM Events e2
        JOIN Tickets t2 ON e2.event_id = t2.event_id
        JOIN Payments p2 ON t2.ticket_id = p2.ticket_id
        WHERE p2.payment_status = 'Success'
        GROUP BY e2.event_name
    ) AS subquery_avg
);

#. Identify attendees who have booked tickets for multiple events.
SELECT attendee_id, name, COUNT(event_id) AS event_count
FROM Tickets t
JOIN Attendees a ON t.attendee_id = a.attendee_id
GROUP BY attendee_id, name
HAVING COUNT(event_id) > 1;

#. Retrieve organizers who have managed more than 3 events.
SELECT organizer_id, organizer_name, COUNT(event_id) AS total_events
FROM Events e
JOIN Organizers o ON e.organizer_id = o.organizer_id
GROUP BY organizer_id, organizer_name
HAVING COUNT(event_id) > 3;

#9. Implement Date & Time Functions (High Weightage)
#. Extract the month from event_date to analyze event trends.
SELECT event_name, event_date, MONTH(event_date) AS event_month
FROM Events;

#. Calculate the number of days remaining for an upcoming event.
SELECT event_name, event_date, DATEDIFF(event_date, CURRENT_DATE) AS days_remaining
FROM Events
WHERE event_date > CURRENT_DATE;

#. Format payment_date as YYYY-MM-DD HH:MM:SS.
SELECT payment_id, ticket_id, DATE_FORMAT(payment_date, '%Y-%m-%d %H:%i:%s') AS formatted_date
FROM Payments;

#10. Use String Manipulation Functions (High Weightage)
#· Convert all organizer names to uppercase.
SELECT organizer_id, UPPER(organizer_name) AS organizer_name_upper
FROM Organizers;

#· Remove extra spaces from attendee names using TRIMO.
SELECT attendee_id, TRIM(name) AS cleaned_name
FROM Attendees;

#. Replace NULL email fields with "Not Provided".
SELECT attendee_id, COALESCE(email, 'Not Provided') AS email_address
FROM Attendees;

#11. Implement Window Functions (Very High Weightage)
#. Rank events based on total revenue earned.
SELECT 
    e.event_name,
    SUM(p.amount_paid) AS total_revenue,
    RANK() OVER (ORDER BY SUM(p.amount_paid) DESC) AS revenue_rank
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_n_

#. Display the cumulative sum of ticket sales.
SELECT 
    e.event_name,
    SUM(p.amount_paid) AS total_revenue,
    SUM(SUM(p.amount_paid)) OVER (ORDER BY e.event_date) AS cumulative_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_name, e.event_date
ORDER BY e.event_date;

#. Show the running total of attendees registered per event.
SELECT 
    e.event_name,
    COUNT(t.attendee_id) AS attendees_count,
    SUM(COUNT(t.attendee_id)) OVER (ORDER BY e.event_date) AS running_total_attendees
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
WHERE t.status = 'Confirmed'
GROUP BY e.event_name, e.event_date
ORDER BY e.event_date;

#12. Apply SQL CASE Expressions (Very High Weightage).
SELECT 
    event_name,
    total_seats,
    available_seats,
    CASE
        WHEN available_seats < total_seats * 0.2 THEN 'High Demand'
        WHEN available_seats BETWEEN total_seats * 0.2 AND total_seats * 0.5 THEN 'Moderate Demand'
        ELSE 'Low Demand'
    END AS demand_category
FROM Events;

SELECT 
    payment_id,
    ticket_id,
    payment_status,
    CASE
        WHEN payment_status = 'Success' THEN 'Successful'
        WHEN payment_status = 'Failed' THEN 'Failed'
        ELSE 'Pending'
    END AS payment_label
FROM Payments;



















