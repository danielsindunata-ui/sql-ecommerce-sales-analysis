-- =========================
-- SAMPLE DATA
-- =========================

-- Customers
INSERT INTO customers VALUES
(1, 'Andi Pratama', 'Jakarta', '2024-01-15'),
(2, 'Budi Santoso', 'Bandung', '2024-03-10'),
(3, 'Citra Lestari', 'Surabaya', '2024-05-21'),
(4, 'Dewi Anggraini', 'Medan', '2024-07-01'),
(5, 'Eko Saputra', 'Jakarta', '2024-08-12');

-- Products
INSERT INTO products VALUES
(1, 'Wireless Mouse', 'Electronics'),
(2, 'Mechanical Keyboard', 'Electronics'),
(3, 'Office Chair', 'Furniture'),
(4, 'Notebook Set', 'Stationery'),
(5, 'Desk Lamp', 'Furniture');

-- Orders
INSERT INTO orders VALUES
(101, 1, '2024-09-01', 750000),
(102, 2, '2024-09-03', 1200000),
(103, 1, '2024-10-10', 500000),
(104, 3, '2024-11-05', 2000000),
(105, 4, '2024-11-15', 950000),
(106, 2, '2024-12-01', 1500000),
(107, 5, '2024-12-12', 300000);

-- Order Items
INSERT INTO order_items VALUES
(1, 101, 1, 2, 250000),
(2, 101, 4, 1, 250000),
(3, 102, 2, 2, 600000),
(4, 103, 4, 5, 100000),
(5, 104, 3, 1, 2000000),
(6, 105, 5, 2, 475000),
(7, 106, 2, 1, 1500000),
(8, 107, 4, 3, 100000);
