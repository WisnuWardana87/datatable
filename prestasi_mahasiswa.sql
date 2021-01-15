-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2021 at 01:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prestasi_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bidang`
--

CREATE TABLE `tb_bidang` (
  `id_bidang` int(11) NOT NULL,
  `nama_bidang` varchar(128) NOT NULL,
  `ket_bidang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_bidang`
--

INSERT INTO `tb_bidang` (`id_bidang`, `nama_bidang`, `ket_bidang`) VALUES
(1, 'Olahraga', 'Lomba sepak bola'),
(2, 'Bahasa Inggris', 'Lomba Debat Bahasa Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fakultas`
--

CREATE TABLE `tb_fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama_fakultas` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_fakultas`
--

INSERT INTO `tb_fakultas` (`id_fakultas`, `nama_fakultas`) VALUES
(1, 'Fakultas Teknik dan Kejuruan (FTK)'),
(2, 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)'),
(3, 'Fakultas Ekonomi (FE)'),
(4, 'Fakultas Ilmu Pendidikan (FIP)'),
(5, 'Fakultas Bahasa dan Seni (FBS)'),
(6, 'Fakultas Olahraga dan Kesehatan (FOK)'),
(7, 'Fakultas Hukum dan Ilmu Sosial (FHIS)'),
(8, 'Fakultas Kedokteran (FK)');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_juara`
--

CREATE TABLE `tb_jenis_juara` (
  `id_jenis_juara` int(11) NOT NULL,
  `nama_jenis_juara` varchar(128) NOT NULL,
  `ket_jenis_juara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jenis_juara`
--

INSERT INTO `tb_jenis_juara` (`id_jenis_juara`, `nama_jenis_juara`, `ket_jenis_juara`) VALUES
(1, 'Juara 2', 'juara 2 sepak bola'),
(2, 'juara 3', 'juara 3 debat bahasa inggris');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_prestasi`
--

CREATE TABLE `tb_jenis_prestasi` (
  `id_jenis` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL,
  `nama_jenis` varchar(128) NOT NULL,
  `ket_jenis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jenis_prestasi`
--

INSERT INTO `tb_jenis_prestasi` (`id_jenis`, `id_bidang`, `nama_jenis`, `ket_jenis`) VALUES
(4, 1, 'FA CUP', 'Juara 1 Fa Cup');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `nama_jurusan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jurusan`, `id_fakultas`, `nama_jurusan`) VALUES
(1, 1, 'Teknik Industri'),
(2, 1, 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `id_prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`id`, `nim`, `nama`, `id_prodi`) VALUES
(1, 1805021025, 'Nyoman Wisnu Wardana', 1),
(2, 1805021024, 'Kadek Hendra Sudarmawan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembimbing`
--

CREATE TABLE `tb_pembimbing` (
  `id_pembimbing` int(11) NOT NULL,
  `nip_pembimbing` varchar(128) NOT NULL,
  `nama_pembimbing` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pembimbing`
--

INSERT INTO `tb_pembimbing` (`id_pembimbing`, `nip_pembimbing`, `nama_pembimbing`) VALUES
(2, '197603152001121002', 'Dr. Komang Setemen, S.Si., M.T.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_prestasi`
--

CREATE TABLE `tb_prestasi` (
  `id_prestasi` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_tingkat` int(11) NOT NULL,
  `id_jenis_juara` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `nama_kegiatan` varchar(128) NOT NULL,
  `kota` varchar(128) NOT NULL,
  `jml_dana` decimal(10,0) NOT NULL,
  `name` varchar(128) NOT NULL,
  `nama_fakultas` varchar(128) NOT NULL,
  `ket_prestasi` varchar(256) NOT NULL,
  `file_prestasi` varchar(128) NOT NULL,
  `id_pembimbing` int(11) NOT NULL,
  `tahun` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_prestasi`
--

INSERT INTO `tb_prestasi` (`id_prestasi`, `id_jenis`, `id_tingkat`, `id_jenis_juara`, `tgl_mulai`, `tgl_selesai`, `nama_kegiatan`, `kota`, `jml_dana`, `name`, `nama_fakultas`, `ket_prestasi`, `file_prestasi`, `id_pembimbing`, `tahun`) VALUES
(14, 4, 1, 1, '2021-01-07', '2021-01-07', 'aaa', 'a', '122222', 'Sudarma Puja', 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)', 'aaa', '', 2, '2020'),
(15, 4, 1, 2, '2021-01-28', '2021-01-01', 'aa', 'aa', '1222', 'Sudarma Puja', 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)', 'qqq', '', 2, '2019'),
(16, 4, 2, 1, '2021-01-12', '2021-01-15', 'bbbb', 'adas', '122222', 'Sudarma Puja', 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)', '11111', '', 2, '2020'),
(17, 4, 2, 2, '2021-01-08', '2021-01-16', 'a', 'l', '211', 'Wisnu Wardana', 'Fakultas Teknik dan Kejuruan (FTK)', 'ccc', '', 2, '2019'),
(18, 4, 1, 1, '2021-01-20', '2021-01-22', 'aa', '1', '211', 'Wisnu Wardana', 'Fakultas Teknik dan Kejuruan (FTK)', 'qqq', '', 2, '2020'),
(19, 4, 1, 2, '2021-01-13', '2021-01-15', 'aaa', '1', '0', 'Wisnu Wardana', 'Fakultas Teknik dan Kejuruan (FTK)', '11111', '', 2, '2020');

-- --------------------------------------------------------

--
-- Table structure for table `tb_prodi`
--

CREATE TABLE `tb_prodi` (
  `id_prodi` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `nama_prodi` varchar(128) NOT NULL,
  `jenjang` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_prodi`
--

INSERT INTO `tb_prodi` (`id_prodi`, `id_jurusan`, `nama_prodi`, `jenjang`) VALUES
(1, 2, 'Manajemen Informatika', 'D3'),
(2, 2, 'Pendidikan Teknik Informatika', 'S1'),
(3, 2, 'Sistem Informasi', 'S1'),
(5, 2, 'Ilmu Komputer', 'S1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkat`
--

CREATE TABLE `tb_tingkat` (
  `id_tingkat` int(11) NOT NULL,
  `nama_tingkat` varchar(128) NOT NULL,
  `ket_tingkat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tingkat`
--

INSERT INTO `tb_tingkat` (`id_tingkat`, `nama_tingkat`, `ket_tingkat`) VALUES
(1, 'Universitas Udayana', 'Lomba Debat Bahasa Inggris di Undiksha'),
(2, 'Kecamatan', 'Lomba sepak bola di kecamatan banjar');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `image`, `password`, `id_fakultas`, `role_id`, `is_active`, `date_created`) VALUES
(5, 'Sipresma', 'sipresma@gmail.com', 'Undiksha1.png', '$2y$10$QJ3e1VIsfqM3buZPLVSMEeSLRsOgeNoiP/SFz2qtIYXIvu6WDNK5W', 0, 1, 1, 1607587383),
(6, 'Wisnu Wardana', 'wisnumario87@gmail.com', 'default.jpg', '$2y$10$iomkTzb6jHI75wGZDBenzuRv90VF/Eew2M8OXdW9y4t41nCUgsY32', 1, 2, 1, 1607587688),
(7, 'AdminFTK', 'adminftk@gmail.com', 'Wisnu.jpg', '$2y$10$6z0srkpCMfZacBNXVaIejucZLUCnd1oC/beb.0AGg2nMl/ZvWStG6', 1, 3, 1, 1608218163),
(11, 'Sudarma Puja', 'sudarmapujayasa97@gmail.com', 'IMG-20200905-WA00021.jpg', '$2y$10$OC380MvCatzv7b9fY9BSsu5Lgb2N9K8HpoIr3LFOj5Faj.BqP5Swq', 2, 2, 1, 1608368004),
(13, 'Admin FMIPA', 'adminfmipa@gmail.com', 'WIN_20201220_19_47_09_Pro.jpg', '$2y$10$906n3CnLm/w1RPD/.d605./H7OsJsMNLySyAw7iklzFHujDDau.m2', 2, 4, 1, 1608728716),
(14, 'Admin FE', 'adminfe@gmail.com', 'Wisnu.jpg', '$2y$10$RQz.GUjzqE6gj7AVWlkEWOkFCyLJCuss385t1MDIzBSONQ5BDYUL.', 3, 5, 1, 1608986448),
(15, 'Admin FIP', 'adminfip@gmail.com', 'default.jpg', '$2y$10$Zin7UY2bxKLuiQRNxROYKuRHsqpYgY.mWzSJGfVh2UAmAtzu2IBhq', 4, 6, 1, 1608989670),
(16, 'Admin FBS', 'adminfbs@gmail.com', 'IMG-20200905-WA0007.jpg', '$2y$10$k.ZFGgGuz1I0xMl8PSJ8fOjCyeJbKxM5VxKxEAmfxvsoU8gzkdl..', 5, 7, 1, 1608991420);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2),
(5, 1, 4),
(6, 1, 5),
(8, 1, 3),
(11, 1, 2),
(12, 1, 7),
(14, 2, 6),
(15, 3, 8),
(16, 3, 2),
(18, 4, 9),
(19, 4, 2),
(20, 5, 10),
(21, 5, 2),
(22, 6, 2),
(23, 6, 11),
(24, 7, 2),
(25, 7, 12),
(26, 8, 13),
(27, 8, 2),
(28, 9, 14),
(29, 9, 2),
(30, 10, 15),
(31, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'MasterData'),
(4, 'Prestasi'),
(6, 'Mahasiswa'),
(7, 'Menu'),
(8, 'PrestasiFTK'),
(9, 'PrestasiFMIPA'),
(10, 'PrestasiFE'),
(11, 'PrestasiFIP'),
(12, 'PrestasiFBS'),
(13, 'PrestasiFOK'),
(14, 'PrestasiFHIS'),
(15, 'PrestasiFK');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member'),
(3, 'Admin FTK'),
(4, 'Admin FMIPA'),
(5, 'Admin FE'),
(6, 'Admin FIP\r\n'),
(7, 'Admin FBS'),
(8, 'Admin FOK'),
(9, 'Admin FHIS'),
(10, 'Admin FK');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'Admin', 'nav-icon fas fa-fw fa-tachometer-alt', 1),
(2, 1, 'Role', 'Admin/role', 'nav-icon fas fa-fw fa-user-tie', 1),
(3, 2, 'My Profile', 'user', 'nav-icon fas fa-fw fa-user', 1),
(4, 2, 'Edit Profile', 'user/edit', 'nav-icon fas fa-fw fa-user-edit', 1),
(5, 2, 'Change Password', 'user/change_password', 'nav-icon fas fa-fw fa-key', 1),
(6, 3, 'Data Fakultas', 'MasterData/daftar_fakultas', 'nav-icon fas fa-fw fa-university', 1),
(7, 3, 'Data Jurusan', 'MasterData/daftar_jurusan', 'nav-icon fas fa-fw fa-chalkboard-teacher', 1),
(8, 3, 'Data Prodi', 'MasterData/daftar_prodi', 'nav-icon fas fa-fw fa-edit', 1),
(9, 3, 'Data Pembimbing', 'MasterData/daftar_pembimbing', 'nav-icon fas fa-fw fa-user', 1),
(11, 4, 'Data Bidang Prestasi', 'Prestasi/daftar_bidang', 'nav-icon fas fa-fw fa-copy', 1),
(12, 4, 'Data Jenis Prestasi', 'Prestasi/daftar_jenis', 'nav-icon fas fa-fw fa-file', 1),
(13, 4, 'Data Tingkat Prestasi', 'Prestasi/daftar_tingkat', 'nav-icon fas fa-fw fa-award', 1),
(14, 4, 'Data Jenis Juara', 'Prestasi/daftar_jenis_juara', 'nav-icon fas fa-fw fa-medal', 1),
(15, 4, 'Data Prestasi', 'Prestasi/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(16, 7, 'Menu Management', 'Menu/daftar_menu', 'nav-icon fas fa-fw fa-folder', 1),
(17, 7, 'Submenu Management', 'Menu/submenu', 'nav-icon fas fa-fw fa-folder-open', 1),
(20, 6, 'Data Prestasi', 'Mahasiswa/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(21, 3, 'Data User', 'MasterData/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(22, 8, 'Data User FTK', 'PrestasiFTK/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(23, 8, 'Data Prestasi', 'PrestasiFTK/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(24, 9, 'Data User FMIPA', 'PrestasiFMIPA/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(25, 9, 'Data Prestasi', 'PrestasiFMIPA/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(27, 10, 'Data User FE', 'PrestasiFE/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(28, 10, 'Data Prestasi', 'PrestasiFE/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(29, 11, 'Data User FIP', 'PrestasiFIP/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(30, 11, 'Data Prestasi', 'PrestasiFIP/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(31, 12, 'Data User FBS', 'PrestasiFBS/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(32, 12, 'Data Prestasi', 'PrestasiFBS/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(33, 13, 'Data User FOK', 'PrestasiFOK/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(34, 13, 'Data Prestasi', 'PrestasiFOK/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(35, 14, 'Data User FHIS', 'PrestasiFHIS/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(36, 14, 'Data Prestasi', 'PrestasiFHIS/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1),
(37, 15, 'Data User FK', 'PrestasiFK/daftar_user', 'nav-icon fas fa-fw fa-user-graduate', 1),
(38, 15, 'Data Prestasi', 'PrestasiFK/daftar_prestasi', 'nav-icon fas fa-fw fa-trophy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(1, 'mademahesadharma@gmail.com', 'cE7AggaYwUgSkDano3ZYoI1oWj3wKHWNWK2GZpCe0Rg=', 1603715773),
(2, 'www@gmail.com', 'IJSKJsBD/F0RfkV66XTFnG7vBs2mACaxsx84MR6WKng=', 1603715940),
(3, 'suci@gmail.com', 'n3UJQi6JPtKdnD7O1qy4JwjzQa5UoAO9bUPsZlG6XnI=', 1603716301),
(4, 'agus@gmail.com', 'YlidffyJc3fccAgYRhn6QjHdNjasRfZDxkW86PCwdEA=', 1604661307),
(5, 'adminftk@gmail.com', 'Mbmx/1RBJHwUKYlRaLZP+YQQ4Xb+KyI9rI/GZeiHYKU=', 1606221805),
(6, 'adminftk@gmail.com', 'XlywZhSn1Vot4xHakXlWXaF1ZOV1pW1B4wDVp4i6830=', 1606221966),
(7, 'adminftk@gmail.com', 'mE/l706FSsQKa1cm6QVeIutRk0Lx89Fd8sJOv9pmUbY=', 1606222078),
(8, 'dhama@gmail.com', '90qpRGy3ZdvpkUUTvIc1rHc9e+AV2W1dHoQcpL+2lvc=', 1606964196),
(9, 'adminftk@gmail.com', 'Oq0hmSUDkeWkEvu7YxIbtl9KnNwQ75E7WJCPFKSZD68=', 1607084506),
(10, 'sipresma@gmail.com', 'SI35X5atZcInuQlROaz8Hvn7+QXm73oHHHcwbODVAWM=', 1607587383),
(12, 'wahyu@gmail.com', 'aobIWF1HfdmFeSymgU3+jHWRbWGUsVjIa6ForStt1o4=', 1608216809),
(13, 'sudarma.pujayasa@undiksha.ac.id', 'DfCJYdDGojn8iLTVcMv/0xRipf0dnpY3n49qp2G+hlc=', 1609810905),
(14, 'sudarma.pujayasa@undiksha.ac.id', 'q3liJZcA25WWxm+7ySToYqqoyRkUknPZm3aRDpQB6O0=', 1609811003),
(15, 'sudarmawalet0217@gmail.com', 'LvIgAN7WiIx5ix4cKyjy0Kqse8acSoQTxykA5piz4Y8=', 1609811077),
(16, 'sudarma.pujayasa@undiksha.ac.id', 'ROSB8mRyHHxPdXIREO75RhRKTmW7Z+VICymX5saLqOY=', 1609811188),
(17, 'sudarmapujayasa97@gmail.com', 'szG42We61l0fPMsxNevNbwYf6+ICb1WFbMTzzfTQuD4=', 1609811351),
(18, 'sudarmapujayasa97@gmail.com', 'Ht1S4c0LzF2q3cMjyauMCXx2dET+6666M5r0lZsHCVQ=', 1609811396),
(19, 'sudarmapujayasa97@gmail.com', 'M2HhoLQMSPBZxDcxtKHXHNze4GPyqWDMFTC/GAKzOkA=', 1609811429),
(20, 'sudarmapujayasa97@gmail.com', 'GyxffKtGF0Z0TfroeH8N45O9TnFfyGGcR/ZapMpjwXw=', 1609988857);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bidang`
--
ALTER TABLE `tb_bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indexes for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `tb_jenis_juara`
--
ALTER TABLE `tb_jenis_juara`
  ADD PRIMARY KEY (`id_jenis_juara`);

--
-- Indexes for table `tb_jenis_prestasi`
--
ALTER TABLE `tb_jenis_prestasi`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`);

--
-- Indexes for table `tb_prestasi`
--
ALTER TABLE `tb_prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indexes for table `tb_prodi`
--
ALTER TABLE `tb_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `tb_tingkat`
--
ALTER TABLE `tb_tingkat`
  ADD PRIMARY KEY (`id_tingkat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bidang`
--
ALTER TABLE `tb_bidang`
  MODIFY `id_bidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_jenis_juara`
--
ALTER TABLE `tb_jenis_juara`
  MODIFY `id_jenis_juara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_jenis_prestasi`
--
ALTER TABLE `tb_jenis_prestasi`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  MODIFY `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_prestasi`
--
ALTER TABLE `tb_prestasi`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_prodi`
--
ALTER TABLE `tb_prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_tingkat`
--
ALTER TABLE `tb_tingkat`
  MODIFY `id_tingkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
