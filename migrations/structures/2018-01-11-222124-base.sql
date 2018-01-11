CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
