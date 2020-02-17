--
-- Database: `tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kodeadmin` int(11) NOT NULL,
  `namaadmin` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kodeadmin`, `namaadmin`, `username`, `password`, `level`) VALUES
(1, 'vaniarfiansah', 'vani', 'vani', 'admin'),
(2, 'istipsaroh', 'mama', 'mama', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kodebuku` int(11) NOT NULL,
  `judulbuku` varchar(50) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `kodekategori` int(11) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `fotocover` varchar(100) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kodebuku`, `judulbuku`, `tahun`, `kodekategori`, `harga`, `fotocover`, `penerbit`, `penulis`, `stok`) VALUES
(7, 'mjn', 'yhkj', 1, 'jh', '12.png', 'ukj', 'u', 0);

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaksi`
--

CREATE TABLE `detailtransaksi` (
  `kodetransaksi` int(11) NOT NULL,
  `kodebuku` int(11) NOT NULL,
  `jumlah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kodekategori` int(11) NOT NULL,
  `namakategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kodekategori`, `namakategori`) VALUES
(1, 'Novel'),
(2, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kodetransaksi` int(11) NOT NULL,
  `namapembeli` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `tanggalbeli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kodeadmin`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kodebuku`),
  ADD KEY `kodekategori` (`kodekategori`);

--
-- Indexes for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD KEY `kodetransaksi` (`kodetransaksi`),
  ADD KEY `kodebuku` (`kodebuku`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kodekategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kodetransaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `kodeadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `kodebuku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kodekategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kodetransaksi` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kodekategori`) REFERENCES `kategori` (`kodekategori`);

--
-- Constraints for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD CONSTRAINT `detailtransaksi_ibfk_1` FOREIGN KEY (`kodebuku`) REFERENCES `buku` (`kodebuku`),
  ADD CONSTRAINT `detailtransaksi_ibfk_2` FOREIGN KEY (`kodetransaksi`) REFERENCES `transaksi` (`kodetransaksi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
