-- Kelompok 6 --
-- 12S21009_Mikhael Pakpahan --
-- 12S21046_Ruth Marelisa--
-- 12S21052_Griselda--
-- Sistem Informasi Akademik --

-- CREATE DATABASE --
CREATE DATABASE Akademik;

-- DROP DATABASE--
DROP DATABASE Akademik

-- CREATE TABLE --
CREATE TABLE BAAK (
ID_BAAK CHAR (10) NOT NULL,
Nama_Pegawai CHAR (30),
PRIMARY KEY (ID_BAAK));

CREATE TABLE Dosen(
NIP CHAR (10) NOT NULL,
Nama_Dosen VARCHAR (40) NOT NULL,
No_Telp CHAR(12) NOT NULL,
PRIMARY KEY (NIP));

CREATE TABLE  Form_KRS(
Kode_KRS VARCHAR (15) NOT NULL,
NIP CHAR (10) NOT NULL,
Semester INT,
T_A INT,
Total_KRS INT,
PRIMARY KEY (Kode_KRS),
FOREIGN KEY (NIP) 
references DOSEN (NIP));

CREATE TABLE Form (
ID_BAAK CHAR (10) NOT NULL,
Kode_KRS VARCHAR (15) NOT NULL,
FOREIGN KEY (ID_BAAK) 
references BAAK (ID_BAAK),
FOREIGN KEY (Kode_KRS) 
references Form_KRS (Kode_KRS));

CREATE TABLE Dosen_Details (
NIP CHAR (10) NOT NULL, 
Matkul_Diampu CHAR (30) NOT NULL,
Kelas CHAR (5),
FOREIGN KEY (NIP) 
references Dosen (NIP));

CREATE TABLE Sarjana_Diploma(
ID_Prodi CHAR (10) NOT NULL,
Nama_Prodi CHAR (20),
PRIMARY KEY (ID_Prodi));

CREATE TABLE Mahasiswa (
NIM VARCHAR (10) NOT NULL,
Kode_KRS VARCHAR (15),
ID_Prodi CHAR (10),
Nama_Depan CHAR (30),
Nama_Belakang CHAR (30),
Jenis_Kelamin CHAR (10),
Tgl_Lahir SMALLINT,
PRIMARY KEY (NIM),
FOREIGN KEY (Kode_KRS) 
references Form_KRS (Kode_KRS),
FOREIGN KEY (ID_Prodi) 
references Sarjana_Diploma (ID_Prodi));

CREATE TABLE Ajaran (
NIP CHAR (10) NOT NULL,
NIM VARCHAR (10) NOT NULL,
FOREIGN KEY (NIP) 
references Dosen (NIP),
FOREIGN KEY (NIM)
REFERENCES Mahasiswa (NIM));

CREATE TABLE No_Telp (
NIM VARCHAR (10) NOT NULL,
No_Telp VARCHAR (15),
FOREIGN KEY (NIM)
REFERENCES Mahasiswa (NIM));

CREATE TABLE Matkul (
Kode_Matkul VARCHAR (10) NOT NULL,
Nama_Matkul CHAR (30),
SKS INT,
PRIMARY KEY (Kode_Matkul));

CREATE TABLE Kuliah (
NIM VARCHAR (10),
Kode_Matkul VARCHAR (10),
FOREIGN KEY (NIM)
REFERENCES Mahasiswa (NIM),
FOREIGN KEY (Kode_Matkul)
REFERENCES Matkul (Kode_Matkul));

CREATE TABLE Jadwal (
Kode_Matkul VARCHAR (10) NOT NULL,
WaktuMulai TIME ,
Ruangan VARCHAR (5), 
FOREIGN KEY (Kode_Matkul)
REFERENCES Matkul (Kode_Matkul));

-- SELECT --
SELECT * FROM BAAK
SELECT * FROM Dosen
SELECT * FROM Form_KRS
SELECT * FROM Form
SELECT * FROM Dosen_Details
SELECT * FROM Sarjana_Diploma
SELECT * FROM Mahasiswa
SELECT * FROM Ajaran
SELECT * FROM No_Telp
SELECT * FROM Matkul
SELECT * FROM Kuliah
SELECT * FROM Jadwal

-- INSERT --
INSERT INTO BAAK(ID_BAAK, Nama_Pegawai)
VALUES ('B1120', 'Alexa'),
('B1123', 'Ronald'),
('B1125', 'Nessi'),
('B1122', 'Star'),
('B1121', 'Andy');

INSERT INTO Dosen (NIP, Nama_Dosen, No_Telp)
VALUES ('DS2233', 'Rosni', '08215576894'),
('DS2232', 'Arlinta', '08536098767'),
('D12112', 'Tiur', '08125676801'),
('D12114', 'Tennov', '08536786570'),
('DS2230', 'Bonar', '08216475850');

INSERT INTO Form_KRS (Kode_KRS, NIP, Semester, T_A, Total_KRS)
VALUES ('12SS4','DS2233','1','2022','20'),
('12SS2','DS2232','5','2022','18'),
('11336','D12112','4','2022','19'),
('11332','D12114','3','2022','22'),
('12SS9','DS2230','2','2022','20');

INSERT INTO Form(ID_BAAK, Kode_KRS)
VALUES ('B1120', '12SS4'),
('B1123', '12SS2'),
('B1125', '11336'),
('B1122', '11332'),
('B1121', '12SS9');

INSERT INTO Dosen_Details(NIP, Matkul_Diampu, Kelas)
VALUES ('DS2233', 'PEMVIS ','11SI1'),
('DS2232', ' ALSTRUDAT','11TE1'),
('D12112', 'RPL','11IF2'),
('D12114', 'PRD','11MR2'),
('DS2230', 'Matdis','11TK1');

INSERT INTO Sarjana_Diploma(ID_Prodi,Nama_Prodi)
VALUES ('ISS2105', 'Sistem Informasi'),
('MR2103', 'Manajemen Rekayasa'),
('CE2108', 'Teknik Komputer'),
('IF2106', 'Informatika'),
('ELS2109', 'Teknologi Elektro');

INSERT INTO Mahasiswa(NIM, Kode_KRS, ID_Prodi, Nama_Depan, Nama_Belakang, Jenis_Kelamin, Tgl_Lahir)
VALUES ('12S21048','12SS4','ISS2105','Nessy','Pangaribuan','Perempuan',2003),
('21S21044','11332','MR2103','Jaden','Hutagalung','Laki-laki',2002),
('11321031','12SS9','CE2108','Daniel','Girsang','Laki-laki', 2000),
('11S21020','11336','IF2106','Priskila','Parapat','Perempuan',2003),
('14S21023','12SS2','ELS2109','Bintang','Simanjuntak','Perempuan',2004);

INSERT INTO Ajaran(NIP, NIM)
VALUES ('DS2233', '12S21048'),
('DS2232', '14S21023'),
('D12112', '11S21020'),
('D12114', '21S21044'),
('DS2230', '11321031');

INSERT INTO No_Telp(NIM, No_Telp)
VALUES ('12S21048', '082146587659'),
('14S21023', '085370908546'),
('11S21020', '086254753648'),
('21S21044', '08975375736'),
('11321031', '084375936576');

INSERT INTO Matkul(Kode_Matkul, Nama_Matkul, SKS)
VALUES ('12S2102', 'Basis Data', 4),
('12S2101', 'Organisasi dan Manajemen',3),
('10S2101', 'Algoritma dan Struktur Data',3),
('11S1213', 'Rekaya Perangkat Lunak',3),
('KUSS3022', 'Agama dan Etika',2);

INSERT INTO Kuliah (NIM, Kode_Matkul)
VALUES ('12S21048','12S2102'),
('14S21023','11S1213'),
('11S21020','12S2101'),
('21S21044','12S2101'),
('11321031','KUSS3022');

INSERT INTO Jadwal (Kode_Matkul, WaktuMulai, Ruangan)
VALUES ('12S2102','10:00:00', 'GD721'),
('11S1213', '14:00:00', 'GD943'),
('12S2101', '09:00:00', 'GD934'),
('10S2101', '15:00:00','GD722' ),
('KUSS3022', '13:00:00', 'Audit');

-- UPDATE --
UPDATE Jadwal
SET Ruangan = 'GD515'
WHERE Kode_Matkul = '11S1213'

UPDATE Form_KRS
SET Semester = 8
WHERE Kode_KRS = '12SS4'

UPDATE Dosen_Details
SET Kelas = '12SI1'
WHERE NIP = 'DS2233' OR Matkul_Diampu = 'RPL'

UPDATE Mahasiswa
SET Nama_Depan = 'Sandro'
WHERE NIM = '12S21048' AND ID_Prodi = 'ISS2105'

UPDATE Matkul 
SET SKS = 2
WHERE Nama_Matkul = 'Organisasi dan Manajemen'

UPDATE Dosen
SET Nama_Dosen = 'Tuani'
WHERE NIP = 'DS2230'
--delete--
DELETE FROM Dosen WHERE No_Telp='08215576894';
DELETE FROM Dosen WHERE No_Telp='8536098767';
--Aggregate Fungction--
SELECT MIN(NIM) FROM Mahasiswa WHERE NIM='11S21020';
SELECT MAX(NIM) FROM Mahasiswa WHERE NIM='11S21020';
SELECT COUNT(NIM) FROM Mahasiswa WHERE NIM='11S21020';
SELECT AVG(SKS)
FROM Matkul;
SELECT SUM(SKS)
FROM Matkul;

--Set Operators--
--union ALL
SELECT NIM FROM Mahasiswa
UNION ALL
SELECT NIM FROM Mahasiswa
ORDER BY NIM;
--union--
SELECT NIM FROM Mahasiswa 
UNION
SELECT NIM FROM Mahasiswa
ORDER BY NIM;
--intersect--
SELECT Nama_Depan, Nama_Belakang
FROM Mahasiswa
INTERSECT
SELECT Nama_Depan, Nama_Belakang
FROM Mahasiswa
ORDER BY Nama_Depan, Nama_Belakang;

--Minus--
SELECT Nama_Depan, Nama_Belakang
FROM Mahasiswa
MINUS
SELECT Nama_Depan, Nama_Belakang
FROM Mahasiswa;

--Null value--
SELECT NIM
FROM Mahasiswa
WHERE NIM IS NULL;

--join--
SELECT Nama_Depan,Nama_Belakang
FROM Mahasiswa
JOIN Ajaran
ON NIP = NIP;

--right join--
SELECT NIM
FROM Mahasiswa
RIGHT JOIN Form_KRS
ON Mahasiswa.NIM = Form_KRS.Kode_KRS;

--inner join--
SELECT Mahasiswa.NIM, Form_KRS.Kode_KRS
FROM Mahasiswa
INNER JOIN Form_KRS ON Mahasiswa.NIM=Mahasiswa.NIM;


--Nested subqueries--
SELECT *
FROM Mahasiswa
WHERE NIM IN ('12S21048', '11321031')

SELECT *
FROM Mahasiswa
WHERE NIM NOT IN ('12S21048', '11321031')

SELECT DISTINCT SKS
FROM Matkul
WHERE SKS IN ( SELECT Semester FROM Form_KRS)

SELECT DISTINCT SKS
FROM Matkul
WHERE SKS NOT IN ( SELECT Semester FROM Form_KRS)

--view--
CREATE VIEW Mahasiswa_2022 AS
SELECT Jenis_Kelamin,NIM
FROM Mahasiswa 
where Jenis_Kelamin ='perempuan';

CREATE VIEW Form_KRS2022 AS
SELECT Kode_KRS,NIP
FROM Form_KRS 
where Kode_KRS='11332';

CREATE VIEW Matkul2022 AS
SELECT SKS,Kode_Matkul,Nama_Matkul
FROM Matkul 
where Kode_Matkul='11S1213';

CREATE VIEW Dosen_Details2022 AS
SELECT NIP,Matkul_Diampu,Kelas
FROM Dosen_Details 
where NIP='DS2233';

CREATE VIEW Dosen2022 AS
SELECT NIP,Nama_Dosen,No_Telp
FROM Dosen 
where NIP='DS2233';

CREATE VIEW mahasiswa_DEL AS
SELECT NIM,Tgl_Lahir
FROM Mahasiswa
where NIM='14S21023';

--Function--
SELECT NIM, ASCII(NIM) AS jenis_kelamin
FROM Mahasiswa;

SELECT REPLICATE('KAEL', 5);

--Stored Procedured--
CREATE PROCEDURE SelectAllCMahasiswa
AS
SELECT * FROM Mahasiswa
GO;
EXEC SelectAllCMahasiswa;

CREATE PROCEDURE SelectAllCJadwal
AS
SELECT * FROM Jadwal
GO;
EXEC SelectAllCJadwal;
