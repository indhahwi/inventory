-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Agu 2021 pada 04.24
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `KD_Barang` varchar(30) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Tanggal_Masuk` varchar(50) NOT NULL,
  `Tanggal_keluar` varchar(20) NOT NULL,
  `Jumlah_Barang` varchar(100) NOT NULL,
  `Kondisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barangkeluar`
--

INSERT INTO `barangkeluar` (`KD_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Tanggal_keluar`, `Jumlah_Barang`, `Kondisi`) VALUES
('KB0004', 'jahe merah', '', '2021-08-06', '10', 'baik');

--
-- Trigger `barangkeluar`
--
DELIMITER $$
CREATE TRIGGER `keluar` AFTER INSERT ON `barangkeluar` FOR EACH ROW BEGIN
UPDATE barangmasuk set Jumlah_Barang=Jumlah_Barang-NEW.Jumlah_Barang
WHERE KD_Barang=NEW.KD_Barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangmasuk`
--

CREATE TABLE `barangmasuk` (
  `KD_Barang` varchar(20) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Tanggal_Masuk` varchar(50) NOT NULL,
  `Jumlah_Barang` varchar(100) NOT NULL,
  `Kondisi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barangmasuk`
--

INSERT INTO `barangmasuk` (`KD_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Jumlah_Barang`, `Kondisi`) VALUES
('KB0005', 'permen jahe', '2021-08-06', '2', 'baik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `from_bayar`
--

CREATE TABLE `from_bayar` (
  `KD_Barang` varchar(50) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Id_Supplier` varchar(50) NOT NULL,
  `Nama_Supplier` varchar(50) NOT NULL,
  `Tanggal_Invoice` varchar(50) NOT NULL,
  `Jumlah_Barang` varchar(50) NOT NULL,
  `Harga_Beli` varchar(50) NOT NULL,
  `Total_Bayar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `from_bayar`
--

INSERT INTO `from_bayar` (`KD_Barang`, `Nama_Barang`, `Id_Supplier`, `Nama_Supplier`, `Tanggal_Invoice`, `Jumlah_Barang`, `Harga_Beli`, `Total_Bayar`) VALUES
('KB0001', 'Jahe Merah', 'SP0001', 'wildan', '2021-07-01', '2', '128000', '256000'),
('KB0002', 'Permen Jahe', 'SP0002', 'anwar', '2021-08-07', '13', '132000', '1716000'),
('KB0006', 'Permen Jahe', 'SP0006', 'Aris Munandar', '2021-08-07', '3', '132000', '396000'),
('KB0007', 'Krupuk', 'SP0007', 'irfan kurniawan', '2021-08-06', '12', '32500', '390000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `password`, `Divisi`) VALUES
('gudang', 'gudang', 'Gudang'),
('keuangan', 'keuangan', 'Keuangan'),
('manager', 'manager', 'Manager');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_barang`
--

CREATE TABLE `permintaan_barang` (
  `KD_Barang` varchar(20) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `jumlah_barang` varchar(50) NOT NULL,
  `Tanggal_permintaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `permintaan_barang`
--

INSERT INTO `permintaan_barang` (`KD_Barang`, `Nama_Barang`, `jumlah_barang`, `Tanggal_permintaan`) VALUES
('KB0001', 'Permen Jahe', '12', '2021-08-11'),
('KB0003', 'Permen Jahe', '15', '2021-08-06'),
('KB0004', 'Gula', '16', '2021-08-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_barang`
--

CREATE TABLE `stok_barang` (
  `KD_Barang` varchar(30) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Jumlah_barang` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok_barang`
--

INSERT INTO `stok_barang` (`KD_Barang`, `Nama_Barang`, `Jumlah_barang`, `kondisi`) VALUES
('KB0001', '', '-11109', ''),
('KB0002', '', '-12', ''),
('KB0003', '', '125', ''),
('KB0004', '', '12', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `Id_Supplier` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `No_Tlpn` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`Id_Supplier`, `Nama`, `Email`, `No_Tlpn`, `Alamat`) VALUES
('SP0001', 'Aris Munandar', 'Armod12@gmail.com', '081981321', 'Perumahan Rivera Hill'),
('SP0003', 'irfan kurniawan', 'ifankur@gmail.com', '0821998213', 'Perumahan citra indah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_keluar_barang`
--

CREATE TABLE `transaksi_keluar_barang` (
  `Tanggal` varchar(50) NOT NULL,
  `KD_Barang` varchar(50) NOT NULL,
  `Nama_Barang` varchar(100) NOT NULL,
  `Jenis` varchar(50) NOT NULL,
  `Jumlah_Barang` varchar(100) NOT NULL,
  `Harga` varchar(50) NOT NULL,
  `Total` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_keluar_barang`
--

INSERT INTO `transaksi_keluar_barang` (`Tanggal`, `KD_Barang`, `Nama_Barang`, `Jenis`, `Jumlah_Barang`, `Harga`, `Total`) VALUES
('2021-07-02', 'BK0001', 'Jahe Merah', 'Karton', '4', '128000', '512000'),
('2021-07-03', 'BK0002', 'Permen Jahe', 'Karton', '3', '132000', '396000'),
('2021-08-07', 'BK0006', 'Jahe Merah', 'Rencengan', '12', '6400', '76800'),
('2021-08-06', 'BK0007', 'Kerupuk', 'Karton', '13', '52500', '682500'),
('2021-08-06', 'BK0008', 'Permen Jahe', 'Karton', '16', '132000', '2112000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_pembelian`
--

CREATE TABLE `transaksi_pembelian` (
  `KD_Barang` varchar(100) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Jenis_Barang` varchar(50) NOT NULL,
  `Jumlah_Barang` varchar(50) NOT NULL,
  `Harga` varchar(50) NOT NULL,
  `Total_Harga` varchar(50) NOT NULL,
  `Tanggal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_pembelian`
--

INSERT INTO `transaksi_pembelian` (`KD_Barang`, `Nama_Barang`, `Jenis_Barang`, `Jumlah_Barang`, `Harga`, `Total_Harga`, `Tanggal`) VALUES
('PB0004', 'Gula', 'Karton', '16', '56500', '904000', '2021-08-04'),
('PB0006', 'Permen Jahe', 'Karton', '3', '132000', '396000', '2021-08-06'),
('PB0007', 'Permen Jahe', 'Karton', '12', '132000', '1584000', '2021-08-06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `from_bayar`
--
ALTER TABLE `from_bayar`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id_Supplier`);

--
-- Indeks untuk tabel `transaksi_keluar_barang`
--
ALTER TABLE `transaksi_keluar_barang`
  ADD PRIMARY KEY (`KD_Barang`);

--
-- Indeks untuk tabel `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD PRIMARY KEY (`KD_Barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
