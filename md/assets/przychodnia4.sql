-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 11:53 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `przychodnia2`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `NajczestszyPacjent` (IN `id_lekarza` INT)   BEGIN
    SELECT 
        p.imie, 
        p.nazwisko, 
        COUNT(w.id_wizyty) AS liczba_wizyt
    FROM pacjenci p
    JOIN wizyty w ON p.id_pacjenta = w.id_pacjenta
    WHERE w.id_lekarza = id_lekarza
    GROUP BY p.id_pacjenta
    ORDER BY liczba_wizyt DESC
    LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ZaktualizujStawke` (IN `id_lekarza` INT, IN `nowa_stawka` DECIMAL(5,2))   BEGIN
    UPDATE lekarze
    SET stawka_godzinowa = nowa_stawka
    WHERE id_lekarza = id_lekarza;
    
    SELECT 'Stawka zaktualizowana' AS komunikat;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dziedziny_medycyny`
--

CREATE TABLE `dziedziny_medycyny` (
  `id_dziedziny` int(11) NOT NULL,
  `nazwa_dziedziny` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dziedziny_medycyny`
--

INSERT INTO `dziedziny_medycyny` (`id_dziedziny`, `nazwa_dziedziny`) VALUES
(1, 'Chirurgia'),
(2, 'Kardiologia'),
(3, 'Neurologia'),
(4, 'Ortopedia'),
(5, 'Dermatologia'),
(6, 'Endokrynologia'),
(7, 'Gastroenterologia'),
(8, 'Ginekologia'),
(9, 'Hematologia'),
(10, 'Immunologia'),
(11, 'Nefrologia'),
(12, 'Onkologia'),
(13, 'Pediatria'),
(14, 'Psychiatria'),
(15, 'Pulmonologia'),
(16, 'Reumatologia'),
(17, 'Urologia'),
(18, 'Laryngologia'),
(19, 'Okulistyka'),
(20, 'Radiologia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dziedziny_medycyny_lekarze`
--

CREATE TABLE `dziedziny_medycyny_lekarze` (
  `id_dziedziny` int(11) NOT NULL,
  `id_lekarza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dziedziny_medycyny_lekarze`
--

INSERT INTO `dziedziny_medycyny_lekarze` (`id_dziedziny`, `id_lekarza`) VALUES
(1, 10),
(1, 18),
(1, 22),
(2, 4),
(2, 5),
(2, 13),
(2, 30),
(3, 23),
(3, 29),
(4, 1),
(4, 14),
(7, 10),
(8, 27),
(9, 22),
(10, 14),
(11, 16),
(12, 7),
(12, 25),
(13, 27),
(13, 28),
(14, 12),
(15, 11),
(15, 25),
(15, 29),
(16, 18),
(16, 29),
(17, 10),
(17, 13),
(17, 26),
(18, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `egzaminy`
--

CREATE TABLE `egzaminy` (
  `id_egzaminu` int(11) NOT NULL,
  `data_czas_egzaminu` datetime DEFAULT NULL,
  `ocena_egzaminu` decimal(2,1) DEFAULT NULL,
  `czy_zdal` tinyint(1) DEFAULT NULL,
  `id_studenta` int(11) DEFAULT NULL,
  `id_wykladowcy` int(11) DEFAULT NULL,
  `id_przedmiotu` int(11) DEFAULT NULL,
  `id_osrodka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `egzaminy`
--

INSERT INTO `egzaminy` (`id_egzaminu`, `data_czas_egzaminu`, `ocena_egzaminu`, `czy_zdal`, `id_studenta`, `id_wykladowcy`, `id_przedmiotu`, `id_osrodka`) VALUES
(1, '2020-11-21 09:37:37', 3.0, 1, 6, 8, 5, 2),
(2, '2021-03-31 09:37:37', 4.5, 1, 17, 8, 18, 10),
(3, '2021-08-13 09:37:37', 5.0, 0, 14, 8, 13, 3),
(4, '2023-07-27 09:37:37', 2.0, 1, 3, 1, 1, 1),
(5, '2019-12-30 09:37:37', 5.0, 0, 4, 7, 6, 3),
(6, '2021-09-14 09:37:37', 3.0, 1, 19, 8, 3, 2),
(7, '2021-12-23 09:37:37', 4.5, 0, 1, 2, 3, 1),
(8, '2021-04-09 09:37:37', 4.5, 0, 6, 1, 5, 8),
(9, '2023-09-15 09:37:37', 4.5, 0, 15, 9, 6, 6),
(10, '2019-11-30 09:37:37', 3.0, 1, 1, 6, 5, 3),
(11, '2022-12-25 09:37:37', 5.0, 0, 16, 4, 15, 7),
(12, '2024-11-07 09:37:37', 4.5, 1, 6, 8, 6, 1),
(13, '2023-02-27 09:37:37', 5.0, 1, 12, 1, 14, 10),
(14, '2022-12-21 09:37:37', 3.0, 0, 23, 10, 4, 4),
(15, '2022-09-29 09:37:37', 5.0, 1, 5, 5, 2, 7),
(16, '2020-10-29 09:37:37', 3.5, 1, 30, 4, 17, 8),
(17, '2023-11-10 09:37:37', 4.0, 0, 24, 9, 20, 7),
(18, '2023-06-06 09:37:37', 4.0, 0, 5, 4, 12, 9),
(19, '2022-07-06 09:37:37', 4.5, 1, 28, 7, 17, 2),
(20, '2023-05-05 09:37:37', 5.0, 0, 6, 4, 3, 1),
(21, '2022-12-02 09:37:37', 5.0, 0, 9, 9, 3, 6),
(22, '2024-01-08 09:37:37', 4.5, 0, 22, 4, 19, 2),
(23, '2022-09-18 09:37:37', 4.0, 1, 29, 4, 9, 9),
(24, '2022-11-01 09:37:37', 4.5, 0, 27, 4, 17, 6),
(25, '2021-06-02 09:37:37', 4.5, 0, 13, 6, 8, 9),
(26, '2021-03-30 09:37:37', 3.0, 1, 23, 5, 1, 8),
(27, '2020-02-19 09:37:37', 5.0, 0, 23, 8, 18, 2),
(28, '2020-02-24 09:37:37', 4.0, 1, 14, 1, 17, 10),
(29, '2023-11-19 09:37:37', 4.5, 1, 8, 2, 8, 9),
(30, '2021-10-17 09:37:37', 3.5, 1, 22, 8, 16, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarze`
--

CREATE TABLE `lekarze` (
  `id_lekarza` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `drugie_imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `stopien` varchar(20) DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `stawka_godzinowa` decimal(5,2) DEFAULT NULL,
  `PESEL` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lekarze`
--

INSERT INTO `lekarze` (`id_lekarza`, `imie`, `drugie_imie`, `nazwisko`, `stopien`, `miasto`, `data_urodzenia`, `stawka_godzinowa`, `PESEL`) VALUES
(1, 'Urszula', 'Tymon', 'Soliwoda', 'profesor', 'Augustów', '1954-05-30', 105.53, '80060396170'),
(2, 'Jeremi', 'Piotr', 'Hermanowicz', 'lekarz', 'Kłodzko', '1990-11-14', 133.57, '19291548643'),
(3, 'Sylwia', 'Miłosz', 'Polasik', 'lekarz', 'Jasło', '1986-11-11', 131.24, '85061457453'),
(4, 'Agnieszka', 'Konstanty', 'Kotala', 'rezydent', 'Nowy Dwór Mazowiecki', '1964-09-29', 115.49, '14292496773'),
(5, 'Olaf', 'Franciszek', 'Peda', 'profesor', 'Jaworzno', '1989-12-02', 123.72, '95081399529'),
(6, 'Róża', 'Ewa', 'Manista', 'lekarz', 'Gniezno', '1956-11-27', 132.14, '90101502741'),
(7, 'Jędrzej', 'Roksana', 'Opyrchał', 'profesor', 'Łaziska Górne', '1965-11-20', 109.56, '73061419733'),
(8, 'Julita', 'Wojciech', 'Hołubowicz', 'rezydent', 'Siedlce', '1969-06-15', 131.36, '07232169451'),
(9, 'Marcelina', 'Lidia', 'Mijas', 'lekarz', 'Stalowa Wola', '1976-04-30', 108.14, '16272631752'),
(10, 'Anastazja', 'Daniel', 'Ofiara', 'rezydent', 'Siedlce', '1982-07-28', 126.60, '09260471333'),
(11, 'Kamila', 'Lidia', 'Tekiela', 'rezydent', 'Czerwionka-Leszczyny', '1984-07-26', 128.59, '13210763212'),
(12, 'Elżbieta', 'Oskar', 'Pera', 'profesor', 'Pruszków', '1964-01-21', 123.15, '02271487050'),
(13, 'Marika', 'Lidia', 'Romankiewicz', 'rezydent', 'Sandomierz', '1987-12-22', 129.97, '09240203819'),
(14, 'Nicole', 'Mateusz', 'Kornet', 'profesor', 'Bydgoszcz', '1993-01-19', 100.39, '90102167059'),
(15, 'Antoni', 'Andrzej', 'Petrus', 'lekarz', 'Łaziska Górne', '1956-08-09', 132.06, '22232604081'),
(16, 'Oskar', 'Stefan', 'Tatarczyk', 'rezydent', 'Ząbki', '1992-12-24', 139.14, '83102749783'),
(17, 'Sandra', 'Julita', 'Jessa', 'profesor', 'Bełchatów', '1954-05-28', 119.50, '82041649361'),
(18, 'Sonia', 'Tymoteusz', 'Troka', 'lekarz', 'Śrem', '1977-08-07', 120.10, '89021601580'),
(19, 'Jędrzej', 'Aniela', 'Borzych', 'lekarz', 'Augustów', '1981-05-25', 101.99, '95112797155'),
(20, 'Karina', 'Michał', 'Rajda', 'rezydent', 'Brodnica', '1972-11-07', 129.66, '14292493909'),
(21, 'Hubert', 'Stefan', 'Gołas', 'rezydent', 'Jarosław', '1969-12-27', 122.33, '96071953598'),
(22, 'Natasza', 'Ewa', 'Nowotny', 'lekarz', 'Biłgoraj', '1985-07-07', 122.67, '85072591418'),
(23, 'Sandra', 'Hubert', 'Kotlarek', 'profesor', 'Głogów', '1989-05-29', 106.36, '73061887464'),
(24, 'Mieszko', 'Maks', 'Duchnik', 'lekarz', 'Ostrów Mazowiecka', '1972-05-03', 103.78, '09210626097'),
(25, 'Hubert', 'Grzegorz', 'Wożniak', 'profesor', 'Ciechanów', '1978-11-13', 139.82, '03222847644'),
(26, 'Filip', 'Iwo', 'Biesaga', 'rezydent', 'Starogard Gdański', '1994-10-31', 120.50, '88112568353'),
(27, 'Ksawery', 'Nela', 'Słyk', 'lekarz', 'Leszno', '1959-10-12', 120.50, '09312307542'),
(28, 'Gabriel', 'Radosław', 'Wakuła', 'profesor', 'Szczecinek', '1962-11-11', 120.50, '72070408369'),
(29, 'Ksawery', 'Nicole', 'Ciepłuch', 'rezydent', 'Dzierżoniów', '1962-09-06', 120.50, '01312915976'),
(30, 'Jerzy', 'Adam', 'Nickel', 'rezydent', 'Grudziądz', '1973-09-27', 120.50, '99081203862'),
(31, 'Adam', 'Marian', 'Kowalski', 'lekarz', 'Warszawa', '1978-05-12', 130.00, '80051212345'),
(32, 'Ewa', 'Anna', 'Nowak', 'profesor', 'Kraków', '1982-10-22', 135.50, '82102267890'),
(33, 'Piotr', 'Jan', 'Wiśniewski', 'rezydent', 'Poznań', '1990-06-15', 128.75, '90061534567'),
(34, 'Katarzyna', 'Maria', 'Wójcik', 'lekarz', 'Łódź', '1985-11-03', 126.50, '85110387654'),
(35, 'Michał', 'Tomasz', 'Lis', 'rezydent', 'Gdańsk', '1992-02-28', 129.00, '92022823456'),
(36, 'Joanna', 'Ewelina', 'Kaczmarek', 'profesor', 'Wrocław', '1975-09-09', 140.00, '75090945678'),
(37, 'Grzegorz', 'Łukasz', 'Zając', 'lekarz', 'Szczecin', '1988-08-18', 133.00, '88081856789'),
(38, 'Anna', 'Monika', 'Król', 'rezydent', 'Bydgoszcz', '1993-03-05', 127.50, '93030512345'),
(39, 'Tomasz', 'Piotr', 'Jabłoński', 'profesor', 'Katowice', '1980-07-20', 138.25, '80072067890'),
(40, 'Magdalena', 'Barbara', 'Górska', 'lekarz', 'Lublin', '1984-12-10', 131.75, '84121034567');

--
-- Wyzwalacze `lekarze`
--
DELIMITER $$
CREATE TRIGGER `SprawdzStawke` BEFORE UPDATE ON `lekarze` FOR EACH ROW BEGIN
    IF NEW.stawka_godzinowa < 50 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stawka godzinowa nie może być mniejsza niż 50 zł.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `id_leku` int(11) NOT NULL,
  `nazwa_leku` varchar(100) DEFAULT NULL,
  `cena_za_jednostke` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leki`
--

INSERT INTO `leki` (`id_leku`, `nazwa_leku`, `cena_za_jednostke`) VALUES
(1, 'Ziołowe tabletki', 158.40),
(2, 'Ziołowe maści', 114.44),
(3, 'Ziołowe kropelki', 15.02),
(4, 'Ziołowe kapsułki', 159.55),
(5, 'Miętowe tabletki', 181.25),
(6, 'Miętowe maści', 161.66),
(7, 'Miętowe kropelki', 16.97),
(8, 'Miętowe kapsułki', 91.56),
(9, 'Silne tabletki', 35.15),
(10, 'Silne maści', 162.85),
(11, 'Silne kropelki', 165.33),
(12, 'Silne kapsułki', 123.09),
(13, 'Wesołe tabletki', 48.87),
(14, 'Wesołe maści', 104.18),
(15, 'Wesołe kropelki', 168.07),
(16, 'Wesołe kapsułki', 32.40),
(17, 'Kolorowe tabletki', 151.97),
(18, 'Kolorowe maści', 150.38),
(19, 'Kolorowe kropelki', 89.30),
(20, 'Kolorowe kapsułki', 162.17),
(21, 'Przeciwbólowe tabletki', 197.33),
(22, 'Przeciwbólowe maści', 161.36),
(23, 'Przeciwbólowe kropelki', 185.66),
(24, 'Przeciwbólowe kapsułki', 175.84),
(25, 'Smutne tabletki', 136.37),
(26, 'Smutne maści', 159.29),
(27, 'Smutne kropelki', 184.67),
(28, 'Smutne kapsułki', 82.22),
(29, 'Rozgrzewające tabletki', 183.23),
(30, 'Rozgrzewające maści', 111.43),
(31, 'Rozgrzewające kropelki', 114.15),
(32, 'Rozgrzewające kapsułki', 143.03);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logi_wizyt`
--

CREATE TABLE `logi_wizyt` (
  `id_logu` int(11) NOT NULL,
  `id_wizyty` int(11) NOT NULL,
  `data_wizyty` datetime NOT NULL,
  `id_pacjenta` int(11) NOT NULL,
  `id_lekarza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logi_wizyt`
--

INSERT INTO `logi_wizyt` (`id_logu`, `id_wizyty`, `data_wizyty`, `id_pacjenta`, `id_lekarza`) VALUES
(1, 33, '2024-12-10 14:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oddzialy`
--

CREATE TABLE `oddzialy` (
  `id_oddzialu` int(11) NOT NULL,
  `miasto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oddzialy`
--

INSERT INTO `oddzialy` (`id_oddzialu`, `miasto`) VALUES
(1, 'Włocławek'),
(2, 'Słupsk'),
(3, 'Piastów'),
(4, 'Świecie'),
(5, 'Świnoujście'),
(6, 'Włocławek'),
(7, 'Bielawa'),
(8, 'Łuków'),
(9, 'Zawiercie'),
(10, 'Skierniewice');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `oddzialyceny`
-- (See below for the actual view)
--
CREATE TABLE `oddzialyceny` (
`nazwa_miasta` varchar(50)
,`srednia_cena_wizyt` decimal(10,6)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osrodki`
--

CREATE TABLE `osrodki` (
  `id_osrodka` int(11) NOT NULL,
  `miasto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osrodki`
--

INSERT INTO `osrodki` (`id_osrodka`, `miasto`) VALUES
(1, 'Zgorzelec'),
(2, 'Jelenia Góra'),
(3, 'Skarżysko-Kamienna'),
(4, 'Wołomin'),
(5, 'Olkusz'),
(6, 'Nowa Sól'),
(7, 'Zawiercie'),
(8, 'Mysłowice'),
(9, 'Stalowa Wola'),
(10, 'Tarnobrzeg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `id_pacjenta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `drugie_imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`id_pacjenta`, `imie`, `drugie_imie`, `nazwisko`, `data_urodzenia`, `miasto`, `e_mail`) VALUES
(1, 'Piotr', 'Angelika', 'Wiza', '2009-01-19', 'Mysłowice', 'milczarczykaleks@example.org'),
(2, 'Janina', 'Artur', 'Górkiewicz', '1999-02-22', 'Gorzów Wielkopolski', 'chomiukdaniel@example.org'),
(3, 'Marcelina', 'Leonard', 'Kajstura', '1960-08-02', 'Pruszków', 'konstantydytko@example.net'),
(4, 'Rozalia', 'Ignacy', 'Pacocha', '1965-02-28', 'Jaworzno', 'mikolajbialka@example.net'),
(5, 'Ksawery', 'Marek', 'Swacha', '1994-07-29', 'Pruszków', 'tburchardt@example.com'),
(6, 'Krzysztof', 'Gaja', 'Powązka', '1935-04-09', 'Rybnik', 'makielafabian@example.org'),
(7, 'Konstanty', 'Franciszek', 'Kudełka', '1994-02-06', 'Koszalin', 'dagmara76@example.org'),
(8, 'Jacek', 'Tola', 'Chlebda', '2000-01-26', 'Oleśnica', 'lukszadaniel@example.com'),
(9, 'Malwina', 'Ryszard', 'Szmelter', '1954-02-04', 'Chrzanów', 'ulepek@example.com'),
(10, 'Mikołaj', 'Adrian', 'Salomon', '1937-01-28', 'Tarnów', 'nmaruszczyk@example.com'),
(11, 'Angelika', 'Inga', 'Gill', '1978-03-22', 'Racibórz', 'yros@example.com'),
(12, 'Maciej', 'Józef', 'Zach', '1943-02-28', 'Żagań', 'maksgill@example.net'),
(13, 'Wojciech', 'Nikodem', 'Igras', '1990-05-13', 'Gdańsk', 'aleksanderswacha@example.com'),
(14, 'Julianna', 'Nicole', 'Supeł', '1957-08-30', 'Jasło', 'wsmieszek@example.org'),
(15, 'Anastazja', 'Gustaw', 'Janasz', '1971-07-13', 'Wołomin', 'zachstefan@example.com'),
(16, 'Kamila', 'Sonia', 'Kusio', '1937-07-20', 'Mława', 'szymonsurdel@example.org'),
(17, 'Dominik', 'Aleks', 'Kolek', '1977-11-04', 'Sandomierz', 'llampa@example.net'),
(18, 'Kamila', 'Rafał', 'Lenarcik', '1994-06-14', 'Kwidzyn', 'natasza45@example.com'),
(19, 'Przemysław', 'Tobiasz', 'Zdonek', '1948-11-27', 'Nysa', 'grurarz@example.com'),
(20, 'Igor', 'Norbert', 'Baumgart', '1960-04-09', 'Starogard Gdański', 'eholewa@example.org'),
(21, 'Aleks', 'Jerzy', 'Czochara', '2001-01-21', 'Piaseczno', 'borysowsianka@example.org'),
(22, 'Aurelia', 'Dawid', 'Kolendo', '2009-02-07', 'Lubin', 'dagmaramalecha@example.com'),
(23, 'Julian', 'Ksawery', 'Elwart', '1991-03-27', 'Szczecin', 'mariuszkroll@example.com'),
(24, 'Bianka', 'Sandra', 'Bugiel', '1969-09-02', 'Płońsk', 'janinabaum@example.com'),
(25, 'Blanka', 'Ada', 'Leżoń', '1968-12-06', 'Opole', 'olaf19@example.com'),
(26, 'Ernest', 'Antoni', 'Chołody', '1960-07-30', 'Mielec', 'jeremi36@example.com'),
(27, 'Patryk', 'Mieszko', 'Kajdan', '1964-07-23', 'Tarnobrzeg', 'nela01@example.com'),
(28, 'Gustaw', 'Gustaw', 'Łakota', '1954-11-12', 'Świdnik', 'chlebekhubert@example.org'),
(29, 'Emil', 'Julita', 'Wrześniak', '1942-03-30', 'Śrem', 'karina29@example.net'),
(30, 'Malwina', 'Leon', 'Grabias', '1967-02-13', 'Środa Wielkopolska', 'kazimierz79@example.net'),
(31, 'vik', 'wer', 'Borzych', '2024-11-14', 'Lublin', 'abc@o2.pl');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pacjencilekarze`
-- (See below for the actual view)
--
CREATE TABLE `pacjencilekarze` (
`pacjent_imie` varchar(50)
,`pacjent_nazwisko` varchar(50)
,`lekarz_imie` varchar(50)
,`lekarz_nazwisko` varchar(50)
,`data_wizyty` datetime
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, 'Anatomia'),
(2, 'Biochemia'),
(3, 'Fizjologia'),
(4, 'Patologia'),
(5, 'Farmakologia'),
(6, 'Mikrobiologia'),
(7, 'Genetyka'),
(8, 'Immunologia'),
(9, 'Neurologia Kliniczna'),
(10, 'Radiologia'),
(11, 'Chirurgia Ogólna'),
(12, 'Kardiologia Kliniczna'),
(13, 'Psychiatria'),
(14, 'Dermatologia'),
(15, 'Pediatria'),
(16, 'Ginekologia'),
(17, 'Ortopedia'),
(18, 'Onkologia Kliniczna'),
(19, 'Geriatria'),
(20, 'Endokrynologia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `studenci`
--

CREATE TABLE `studenci` (
  `id_studenta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `drugie_imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studenci`
--

INSERT INTO `studenci` (`id_studenta`, `imie`, `drugie_imie`, `nazwisko`, `data_urodzenia`, `miasto`) VALUES
(1, 'Emil', 'Marcel', 'Putek', '1998-02-11', 'Zakopane'),
(2, 'Sebastian', 'Olaf', 'Golenia', '1998-07-22', 'Włocławek'),
(3, 'Malwina', 'Arkadiusz', 'Glenc', '2005-04-27', 'Biała Podlaska'),
(4, 'Julianna', 'Jędrzej', 'Taczała', '2002-04-03', 'Lubartów'),
(5, 'Aurelia', 'Bianka', 'Dryka', '1998-05-31', 'Gorzów Wielkopolski'),
(6, 'Kacper', 'Mieszko', 'Sobków', '2000-03-24', 'Świecie'),
(7, 'Aleksander', 'Tadeusz', 'Majtyka', '1999-05-05', 'Stargard Szczeciński'),
(8, 'Natasza', 'Ignacy', 'Błażejewicz', '2001-09-22', 'Sopot'),
(9, 'Ernest', 'Arkadiusz', 'Połom', '1999-06-08', 'Wyszków'),
(10, 'Bruno', 'Maurycy', 'Broniarek', '1993-11-20', 'Goleniów'),
(11, 'Jeremi', 'Nikodem', 'Mendyka', '1997-03-05', 'Inowrocław'),
(12, 'Franciszek', 'Kalina', 'Kansy', '1995-11-13', 'Suwałki'),
(13, 'Kamila', 'Sonia', 'Bartman', '2005-06-20', 'Siemianowice Śląskie'),
(14, 'Jan', 'Kacper', 'Konieczek', '2006-04-13', 'Kielce'),
(15, 'Michał', 'Rafał', 'Stranc', '1997-01-15', 'Świnoujście'),
(16, 'Tadeusz', 'Artur', 'Ragan', '1996-01-27', 'Jaworzno'),
(17, 'Piotr', 'Łukasz', 'Świstek', '1998-01-13', 'Oława'),
(18, 'Eryk', 'Grzegorz', 'Raszkiewicz', '1998-12-10', 'Bielawa'),
(19, 'Iwo', 'Kazimierz', 'Jankowicz', '1997-04-11', 'Ostrów Wielkopolski'),
(20, 'Kacper', 'Franciszek', 'Fitrzyk', '2001-12-23', 'Chełm'),
(21, 'Grzegorz', 'Przemysław', 'Fiedorczuk', '1999-05-04', 'Bytom'),
(22, 'Witold', 'Nicole', 'Żabka', '1996-04-26', 'Wałbrzych'),
(23, 'Mariusz', 'Jacek', 'Breś', '1998-02-14', 'Giżycko'),
(24, 'Gaja', 'Konstanty', 'Pazera', '2004-06-06', 'Bochnia'),
(25, 'Ewelina', 'Urszula', 'Kaletka', '1997-04-24', 'Będzin'),
(26, 'Szymon', 'Kornel', 'Drej', '2006-06-30', 'Świebodzice'),
(27, 'Damian', 'Maksymilian', 'Siatka', '2006-07-02', 'Radomsko'),
(28, 'Kacper', 'Ida', 'Sypuła', '2005-11-03', 'Konin'),
(29, 'Bruno', 'Jacek', 'Pazera', '2002-12-02', 'Szczecin'),
(30, 'Marcin', 'Kajetan', 'Kozień', '2006-10-02', 'Zawiercie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyty`
--

CREATE TABLE `wizyty` (
  `id_wizyty` int(11) NOT NULL,
  `data_czas_wizyty` datetime DEFAULT NULL,
  `cena_za_wizyte` decimal(6,2) DEFAULT NULL,
  `id_lekarza` int(11) DEFAULT NULL,
  `id_pacjenta` int(11) DEFAULT NULL,
  `id_oddzialu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wizyty`
--

INSERT INTO `wizyty` (`id_wizyty`, `data_czas_wizyty`, `cena_za_wizyte`, `id_lekarza`, `id_pacjenta`, `id_oddzialu`) VALUES
(1, '2022-04-18 09:37:37', 365.89, 25, 2, 1),
(2, '2020-08-30 09:37:37', 394.52, 25, 11, 10),
(3, '2023-10-14 09:37:37', 309.45, 8, 18, 3),
(4, '2023-01-02 09:37:37', 483.43, 26, 8, 6),
(5, '2020-03-05 09:37:37', 122.01, 19, 28, 8),
(6, '2021-08-02 09:37:37', 167.71, 26, 27, 2),
(7, '2024-01-18 09:37:37', 374.61, 30, 3, 10),
(8, '2024-09-19 09:37:37', 337.32, 30, 24, 2),
(9, '2020-09-12 09:37:37', 393.26, 2, 24, 10),
(10, '2023-04-21 09:37:37', 354.94, 8, 12, 9),
(11, '2023-06-21 09:37:37', 157.19, 18, 29, 8),
(12, '2021-07-10 09:37:37', 160.13, 16, 13, 5),
(13, '2020-06-04 09:37:37', 190.73, 20, 23, 10),
(14, '2020-02-02 09:37:37', 284.77, 11, 15, 1),
(15, '2021-06-28 09:37:37', 188.96, 1, 30, 6),
(16, '2021-12-14 09:37:37', 458.47, 20, 19, 1),
(17, '2020-09-03 09:37:37', 202.72, 5, 29, 1),
(18, '2022-02-09 09:37:37', 464.88, 12, 4, 7),
(19, '2021-07-19 09:37:37', 444.07, 20, 21, 8),
(20, '2021-06-07 09:37:37', 202.33, 20, 27, 8),
(21, '2021-12-04 09:37:37', 414.12, 14, 28, 5),
(22, '2021-07-06 09:37:37', 446.81, 7, 14, 5),
(23, '2022-01-16 09:37:37', 176.16, 25, 10, 2),
(24, '2021-10-15 09:37:37', 380.77, 10, 28, 7),
(25, '2020-10-25 09:37:37', 212.70, 10, 27, 10),
(26, '2022-11-05 09:37:37', 108.34, 24, 24, 6),
(27, '2020-05-16 09:37:37', 180.43, 26, 23, 2),
(28, '2021-06-26 09:37:37', 308.00, 21, 2, 2),
(29, '2023-05-11 09:37:37', 274.07, 12, 20, 10),
(30, '2022-05-02 09:37:37', 382.52, 3, 22, 1),
(31, '2024-12-10 10:30:00', 250.00, 1, 1, 1),
(33, '2024-12-10 14:00:00', 300.00, 1, 1, 1);

--
-- Wyzwalacze `wizyty`
--
DELIMITER $$
CREATE TRIGGER `LogujWizyty` AFTER INSERT ON `wizyty` FOR EACH ROW BEGIN
    INSERT INTO logi_wizyt (id_wizyty, data_wizyty, id_pacjenta, id_lekarza)
    VALUES (NEW.id_wizyty, NEW.data_czas_wizyty, NEW.id_pacjenta, NEW.id_lekarza);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wykladowcy`
--

CREATE TABLE `wykladowcy` (
  `id_wykladowcy` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL,
  `stawka_godzinowa` decimal(5,2) DEFAULT NULL,
  `liczba_godzin_miesiecznie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wykladowcy`
--

INSERT INTO `wykladowcy` (`id_wykladowcy`, `imie`, `nazwisko`, `miasto`, `stawka_godzinowa`, `liczba_godzin_miesiecznie`) VALUES
(1, 'Gaja', 'Danilczuk', 'Inowrocław', 70.52, 11),
(2, 'Mariusz', 'Tomzik', 'Krosno', 102.40, 12),
(3, 'Leonard', 'Kusik', 'Wyszków', 61.26, 13),
(4, 'Sebastian', 'Otremba', 'Goleniów', 110.46, 10),
(5, 'Janina', 'Kempny', 'Dębica', 69.33, 24),
(6, 'Arkadiusz', 'Kuczak', 'Świdnica', 94.95, 35),
(7, 'Aniela', 'Kukieła', 'Brzeg', 83.08, 32),
(8, 'Robert', 'Dymarczyk', 'Brzeg', 49.49, 13),
(9, 'Olgierd', 'Litwa', 'Tarnowskie Góry', 111.04, 17),
(10, 'Aleksander', 'Mainka', 'Grodzisk Mazowiecki', 102.47, 34);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypisane_leki`
--

CREATE TABLE `wypisane_leki` (
  `id_wypisane_leki` int(11) NOT NULL,
  `id_wizyty` int(11) DEFAULT NULL,
  `id_leku` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wypisane_leki`
--

INSERT INTO `wypisane_leki` (`id_wypisane_leki`, `id_wizyty`, `id_leku`) VALUES
(1, 24, 17),
(2, 30, 24),
(3, 7, 18),
(4, 16, 21),
(5, 19, 14),
(6, 12, 17),
(7, 8, 20),
(8, 24, 14),
(9, 16, 18),
(10, 2, 20),
(11, 27, 18),
(12, 25, 24),
(13, 21, 17),
(14, 17, 20),
(15, 30, 32),
(16, 19, 3),
(17, 4, 26),
(18, 17, 4),
(19, 30, 22),
(20, 10, 14),
(21, 22, 11),
(22, 30, 23),
(23, 22, 5),
(24, 21, 14),
(25, 24, 17),
(26, 12, 12),
(27, 12, 4),
(28, 4, 20),
(29, 6, 13),
(30, 16, 13),
(31, 31, 1);

-- --------------------------------------------------------

--
-- Struktura widoku `oddzialyceny`
--
DROP TABLE IF EXISTS `oddzialyceny`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `oddzialyceny`  AS SELECT `o`.`miasto` AS `nazwa_miasta`, avg(`w`.`cena_za_wizyte`) AS `srednia_cena_wizyt` FROM (`oddzialy` `o` join `wizyty` `w` on(`o`.`id_oddzialu` = `w`.`id_oddzialu`)) GROUP BY `o`.`miasto` HAVING avg(`w`.`cena_za_wizyte`) > 200 ;

-- --------------------------------------------------------

--
-- Struktura widoku `pacjencilekarze`
--
DROP TABLE IF EXISTS `pacjencilekarze`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacjencilekarze`  AS SELECT `p`.`imie` AS `pacjent_imie`, `p`.`nazwisko` AS `pacjent_nazwisko`, `l`.`imie` AS `lekarz_imie`, `l`.`nazwisko` AS `lekarz_nazwisko`, `w`.`data_czas_wizyty` AS `data_wizyty` FROM ((`pacjenci` `p` join `wizyty` `w` on(`p`.`id_pacjenta` = `w`.`id_pacjenta`)) join `lekarze` `l` on(`w`.`id_lekarza` = `l`.`id_lekarza`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dziedziny_medycyny`
--
ALTER TABLE `dziedziny_medycyny`
  ADD PRIMARY KEY (`id_dziedziny`);

--
-- Indeksy dla tabeli `dziedziny_medycyny_lekarze`
--
ALTER TABLE `dziedziny_medycyny_lekarze`
  ADD PRIMARY KEY (`id_dziedziny`,`id_lekarza`),
  ADD KEY `id_lekarza` (`id_lekarza`);

--
-- Indeksy dla tabeli `egzaminy`
--
ALTER TABLE `egzaminy`
  ADD PRIMARY KEY (`id_egzaminu`),
  ADD KEY `id_studenta` (`id_studenta`),
  ADD KEY `id_wykladowcy` (`id_wykladowcy`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_osrodka` (`id_osrodka`);

--
-- Indeksy dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD PRIMARY KEY (`id_lekarza`),
  ADD UNIQUE KEY `PESEL` (`PESEL`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`id_leku`);

--
-- Indeksy dla tabeli `logi_wizyt`
--
ALTER TABLE `logi_wizyt`
  ADD PRIMARY KEY (`id_logu`);

--
-- Indeksy dla tabeli `oddzialy`
--
ALTER TABLE `oddzialy`
  ADD PRIMARY KEY (`id_oddzialu`);

--
-- Indeksy dla tabeli `osrodki`
--
ALTER TABLE `osrodki`
  ADD PRIMARY KEY (`id_osrodka`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`id_pacjenta`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id_przedmiotu`);

--
-- Indeksy dla tabeli `studenci`
--
ALTER TABLE `studenci`
  ADD PRIMARY KEY (`id_studenta`);

--
-- Indeksy dla tabeli `wizyty`
--
ALTER TABLE `wizyty`
  ADD PRIMARY KEY (`id_wizyty`),
  ADD KEY `id_lekarza` (`id_lekarza`),
  ADD KEY `id_pacjenta` (`id_pacjenta`),
  ADD KEY `id_oddzialu` (`id_oddzialu`);

--
-- Indeksy dla tabeli `wykladowcy`
--
ALTER TABLE `wykladowcy`
  ADD PRIMARY KEY (`id_wykladowcy`);

--
-- Indeksy dla tabeli `wypisane_leki`
--
ALTER TABLE `wypisane_leki`
  ADD PRIMARY KEY (`id_wypisane_leki`),
  ADD KEY `id_wizyty` (`id_wizyty`),
  ADD KEY `id_leku` (`id_leku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dziedziny_medycyny`
--
ALTER TABLE `dziedziny_medycyny`
  MODIFY `id_dziedziny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `egzaminy`
--
ALTER TABLE `egzaminy`
  MODIFY `id_egzaminu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `lekarze`
--
ALTER TABLE `lekarze`
  MODIFY `id_lekarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `leki`
--
ALTER TABLE `leki`
  MODIFY `id_leku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `logi_wizyt`
--
ALTER TABLE `logi_wizyt`
  MODIFY `id_logu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oddzialy`
--
ALTER TABLE `oddzialy`
  MODIFY `id_oddzialu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `osrodki`
--
ALTER TABLE `osrodki`
  MODIFY `id_osrodka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `id_pacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `studenci`
--
ALTER TABLE `studenci`
  MODIFY `id_studenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wizyty`
--
ALTER TABLE `wizyty`
  MODIFY `id_wizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wykladowcy`
--
ALTER TABLE `wykladowcy`
  MODIFY `id_wykladowcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wypisane_leki`
--
ALTER TABLE `wypisane_leki`
  MODIFY `id_wypisane_leki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dziedziny_medycyny_lekarze`
--
ALTER TABLE `dziedziny_medycyny_lekarze`
  ADD CONSTRAINT `dziedziny_medycyny_lekarze_ibfk_1` FOREIGN KEY (`id_dziedziny`) REFERENCES `dziedziny_medycyny` (`id_dziedziny`),
  ADD CONSTRAINT `dziedziny_medycyny_lekarze_ibfk_2` FOREIGN KEY (`id_lekarza`) REFERENCES `lekarze` (`id_lekarza`);

--
-- Constraints for table `egzaminy`
--
ALTER TABLE `egzaminy`
  ADD CONSTRAINT `egzaminy_ibfk_1` FOREIGN KEY (`id_studenta`) REFERENCES `studenci` (`id_studenta`),
  ADD CONSTRAINT `egzaminy_ibfk_2` FOREIGN KEY (`id_wykladowcy`) REFERENCES `wykladowcy` (`id_wykladowcy`),
  ADD CONSTRAINT `egzaminy_ibfk_3` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmioty` (`id_przedmiotu`),
  ADD CONSTRAINT `egzaminy_ibfk_4` FOREIGN KEY (`id_osrodka`) REFERENCES `oddzialy` (`id_oddzialu`);

--
-- Constraints for table `wizyty`
--
ALTER TABLE `wizyty`
  ADD CONSTRAINT `wizyty_ibfk_1` FOREIGN KEY (`id_lekarza`) REFERENCES `lekarze` (`id_lekarza`),
  ADD CONSTRAINT `wizyty_ibfk_2` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjenci` (`id_pacjenta`),
  ADD CONSTRAINT `wizyty_ibfk_3` FOREIGN KEY (`id_oddzialu`) REFERENCES `oddzialy` (`id_oddzialu`);

--
-- Constraints for table `wypisane_leki`
--
ALTER TABLE `wypisane_leki`
  ADD CONSTRAINT `wypisane_leki_ibfk_1` FOREIGN KEY (`id_wizyty`) REFERENCES `wizyty` (`id_wizyty`),
  ADD CONSTRAINT `wypisane_leki_ibfk_2` FOREIGN KEY (`id_leku`) REFERENCES `leki` (`id_leku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
