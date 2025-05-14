DROP DATABASE IF EXISTS Yoga;
CREATE DATABASE Yoga;
USE Yoga;

-- 1. Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Members (MemberID, Name, Email) VALUES
(1, 'Alice Johnson', 'alice.j@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Carla Lee', 'carla.lee@example.com'),
(4, 'Daniel Perez', 'daniel.p@example.com'),
(5, 'Emma Davis', 'emma.davis@example.com');

-- 2. Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100)
);

INSERT INTO Instructors (InstructorID, Name, Specialty) VALUES
(1, 'Sarah Thompson', 'Yoga'),
(2, 'Mike Reynolds', 'Kids Yoga'),
(3, 'Linda Gomez', 'Zumba'),
(4, 'James Wong', 'Weightlifting'),
(5, 'Tara King', 'Stretching');

-- 3. Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Classes (ClassID, ClassName, InstructorID) VALUES
(1, 'Beginner Yoga', 1),
(2, 'Zumba Basics', 3),
(3, 'Kids Yoga', 2),
(4, 'Strength 101', 4),
(5, 'Flex and Flow', 5);

-- 4. Schedule table
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    ClassID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Schedule (ScheduleID, ClassID, Date, Time) VALUES
(1, 1, '2025-05-15', '10:00:00'),
(2, 2, '2025-05-16', '18:00:00'),
(3, 3, '2025-05-17', '12:00:00'),
(4, 4, '2025-05-18', '08:00:00'),
(5, 5, '2025-05-19', '19:00:00');

-- 5. Rooms table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(100),
    Capacity INT
);

INSERT INTO Rooms (RoomID, RoomName, Capacity) VALUES
(1, 'Yoga Studio A', 25),
(2, 'Yoga Studio B', 15),
(3, 'Meditation Room', 10),
(4, 'Private Session Room', 2),
(5, 'Flexibility Room', 12);

-- 6. Memberships table
CREATE TABLE Memberships (
    MembershipID INT PRIMARY KEY,
    MemberID INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Memberships (MembershipID, MemberID, StartDate, EndDate, Status) VALUES
(1, 1, '2025-01-01', '2025-03-31', 'Active'),
(2, 2, '2025-02-15', '2025-05-15', 'Active'),
(3, 3, '2024-12-01', '2025-02-28', 'Inactive'),
(4, 4, '2025-03-01', '2025-06-01', 'Active'),
(5, 1, '2025-04-01', '2025-06-30', 'Active');