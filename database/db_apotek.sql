-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 02:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nama_barang`, `harga`, `stok`, `deskripsi`) VALUES
(2, 'Obat Ponstant', 200000, 47, 'Ini obat sakit gigi ya'),
(3, 'Obat Panadol', 100000, 125, 'Ini obat sakit kepala dan demam ya'),
(5, 'Obat Promag', 75000, 38, 'Ini obat maag yang mengobati asam lambung'),
(6, 'Obat Feminax', 135000, 12, 'Ini obat pereda sakit haid ya'),
(7, 'Kalpanax Salep', 150000, 15, 'Salep ini berguna mengatasi infeksi jamur'),
(8, 'Balsem Vicks', 20000, 32, 'Ini balsem untuk meringankan gejala masuk angin, batuk, dan pilek karena flu ya'),
(9, 'Obat Neozep Forte', 10000, 20, 'Ini obat untuk meredakan demam, sakit kepala, dan hidung tersumbat ya.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang_keluar`
--

CREATE TABLE `tbl_barang_keluar` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `stok_keluar` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang_keluar`
--

INSERT INTO `tbl_barang_keluar` (`id`, `id_customer`, `id_barang`, `tgl_keluar`, `stok_keluar`, `total`) VALUES
(11, 2, 2, '2024-06-14', 5, 1000000),
(12, 3, 3, '2024-06-20', 2, 200000),
(13, 3, 2, '2024-06-19', 2, 400000),
(14, 5, 7, '2024-06-19', 5, 750000),
(15, 3, 5, '2024-06-18', 4, 300000),
(16, 6, 5, '2024-06-17', 3, 225000),
(17, 6, 5, '2024-06-18', 1, 75000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang_masuk`
--

CREATE TABLE `tbl_barang_masuk` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `stok_masuk` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang_masuk`
--

INSERT INTO `tbl_barang_masuk` (`id`, `id_supplier`, `id_barang`, `tgl_masuk`, `stok_masuk`, `total`) VALUES
(4, 2, 2, '2024-06-01', 12, 2400000),
(5, 3, 3, '2024-06-05', 10, 1000000),
(6, 4, 3, '2024-06-15', 2, 200000),
(7, 4, 5, '2024-06-16', 6, 450000),
(8, 2, 5, '2024-06-19', 30, 2250000),
(9, 4, 3, '2024-06-21', 20, 2000000),
(10, 2, 3, '2024-06-20', 5, 500000),
(11, 5, 3, '2024-06-30', 50, 5000000),
(12, 4, 8, '2024-06-25', 12, 240000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `nama_customer` varchar(255) DEFAULT NULL,
  `nohp_customer` varchar(20) DEFAULT NULL,
  `email_customer` varchar(255) DEFAULT NULL,
  `alamat_customer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `nama_customer`, `nohp_customer`, `email_customer`, `alamat_customer`) VALUES
(3, 'dr. Ahmad Ali Zainudin', '087652347765', 'ahmad1@gmail.com', 'Samarinda'),
(5, 'Bidan Siti Rahmah ', '087654362278', 'sitirahman1@gmail.com', 'Samarinda'),
(6, 'Bidan Murniati', '085443557689', 'muniartiku5@gmail.com', 'Samarinda'),
(7, 'dr. David Setiyoso', '085362718362', 'david31@gmail.com', 'Samarinda');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `nohp_supplier` varchar(20) DEFAULT NULL,
  `email_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `nama_supplier`, `nohp_supplier`, `email_supplier`, `alamat_supplier`) VALUES
(2, 'PT. Enseval Putera Megatrading', '085427162283', 'enseval1@gmail.com', 'Jl. Pendekat Mahkota2,, Sambutan, Kec. Sambutan, Kota Samarinda, Kalimantan Timur 75253'),
(4, 'PT. Sejahtera mulia farma', '085472647283', 'sejahtera2@gmail.com', 'Samarinda'),
(5, 'PT. Bina Sanprima', '085264738291', 'bina2@gmail.com', 'Samarinda'),
(6, 'PT. Tempo Samarinda', '05416245176', 'pttbm00sir@thetempogroup.net', 'Jl. P. Suryanata, Bukit Pinang, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur 75131');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('pemilik','karyawan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama_user`, `username`, `password`, `role`) VALUES
(10, 'leon', 'leon', '$2b$10$TBpDZsOkDQw/cP0oOqM2Y.3B2VHxT2EI7ZJIDKN2BHKN1.XhfD672', 'pemilik'),
(11, 'antonio', 'anton', '$2b$10$2oAUlox9gMWCvuOBPe28..suGKEqs/AFnsifeBImyk8pWURvvYlMS', 'karyawan'),
(12, 'toni kroos', 'kroos', '$2b$10$9pdlRlpipNUcOR6aSCBF9uhmAHmo0W30/lbydzYAwHK/0BUrQZYF2', 'pemilik'),
(14, 'luminer', 'lumi', '$2b$10$sZfRMwNGkRGXCNZy728L0OiuC9r58qh1n6ePwkM0WJveSRvltz2e6', 'pemilik'),
(17, 'brahim diaz', 'brahim', '$2b$10$pRD9fpIdxrRQkDOccf4.aOfOfe.SQSaGruvBbSSUJBf494t0csmjG', 'karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang_keluar`
--
ALTER TABLE `tbl_barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang_masuk`
--
ALTER TABLE `tbl_barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_barang_keluar`
--
ALTER TABLE `tbl_barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_barang_masuk`
--
ALTER TABLE `tbl_barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
