-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Apr 2020 pada 18.50
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutorialweb_crud`
--

DELIMITER $$
--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `NIM_Baru` () RETURNS VARCHAR(12) CHARSET utf8mb4 BEGIN
	DECLARE NIM_Baru CHAR(12); 
	DECLARE URUT INT; 
	DECLARE URUT_BARU INT; 
	DECLARE angkatan CHAR(2); 
	DECLARE jumlah INT; 
SELECT SUBSTR(YEAR(CURRENT_DATE),3,2) INTO angkatan;
SELECT COUNT(Nim) INTO jumlah FROM mahasiswa WHERE NIM LIKE CONCAT(angkatan, "%");
IF (jumlah = 0) THEN
	BEGIN
	SET URUT_BARU = 1;
	SET NIM_Baru = CONCAT(angkatan, '0304', LPAD(URUT_BARU, 3, 0));
END;
ELSEIF (jumlah >= 1) THEN
	BEGIN
	SELECT MAX(SUBSTR(Nim,7,3)) INTO URUT FROM mahasiswa WHERE NIM LIKE CONCAT(angkatan, "%");
	SET URUT_BARU = URUT + 1;
	SET NIM_Baru = CONCAT(angkatan, '0304', LPAD(URUT_BARU, 3, 0));
END;
END IF;
RETURN NIM_Baru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nohp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `jurusan`, `alamat`, `nohp`) VALUES
(7, 1803040066, 'arif luqman ', 'LAKI-LAKI', 'TEKNIK KIMIA', 'purbalingga', '0858100****'),
(8, 1803040067, 'FAHRUL', 'LAKI-LAKI', 'TEKNIK INFORMATIKA', 'purbalingga', '41414141'),
(9, 1803040068, 'Al Ghany Mauana', 'LAKI-LAKI', 'TEKNIK ELEKTRO', 'Ajibarang', '0881288****'),
(10, 1803040069, 'Irfan Gustriyo', 'LAKI-LAKI', 'TEKNIK SIPIL', 'Maos', '081221****'),
(11, 1803040070, 'Heri Munawar', 'LAKI-LAKI', 'TEKNIK SIPIL', 'Purbalingga', '08102*****');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
