-- Lab 2 --

INSERT INTO Publisher (name_and_surname, address, phone, email, website) VALUES
('Penguin Random House', 'New York, USA', '+1-212-782-9000', 'info@penguinrandomhouse.com', 'www.penguinrandomhouse.com'),
('HarperCollins Publishers', 'London, UK', '+44-20-8741-7070', 'info@harpercollins.co.uk', 'www.harpercollins.com'),
('Simon & Schuster', 'New York, USA', '+1-212-698-7000', 'contact@simonandschuster.com', 'www.simonandschuster.com'),
('Macmillan Publishers', 'London, UK', '+44-20-7833-4000', 'info@macmillan.com', 'www.macmillan.com'),
('Hachette Book Group', 'New York, USA', '+1-212-364-1100', 'customer.service@hbgusa.com', 'www.hachettebookgroup.com');

INSERT INTO Author (full_name, birth_date, death_date, nationality, biography) VALUES
('George Orwell', '1903-06-25', '1950-01-21', 'British', 'English novelist, essayist, journalist and critic'),
('Harper Lee', '1926-04-28', '2016-02-19', 'American', 'American novelist best known for To Kill a Mockingbird'),
('J.K. Rowling', '1965-07-31', NULL, 'British', 'British author, best known for the Harry Potter series'),
('Agatha Christie', '1890-09-15', '1976-01-12', 'British', 'English writer known for detective novels'),
('Stephen King', '1947-09-21', NULL, 'American', 'American author of horror, supernatural fiction'),
('Gabriel García Márquez', '1927-03-06', '2014-04-17', 'Colombian', 'Colombian novelist and Nobel Prize winner'),
('Jane Austen', '1775-12-16', '1817-07-18', 'British', 'English novelist known for her six major novels');

INSERT INTO Book (isbn, title, year_published, genre, pages, language, publisher_id) VALUES
('978-0-452-28423-4', '1984', 1949, 'Dystopian', 328, 'English', 1),
('978-0-061-12008-4', 'To Kill a Mockingbird', 1960, 'Fiction', 324, 'English', 2),
('978-0-439-70818-8', 'Harry Potter and the Philosopher''s Stone', 1997, 'Fantasy', 223, 'English', 3),
('978-0-062-07348-8', 'Murder on the Orient Express', 1934, 'Mystery', 256, 'English', 2),
('978-1-501-17565-2', 'The Shining', 1977, 'Horror', 447, 'English', 4),
('978-0-060-88328-8', 'One Hundred Years of Solitude', 1967, 'Magical Realism', 417, 'Spanish', 2),
('978-0-141-43951-8', 'Pride and Prejudice', 1813, 'Romance', 279, 'English', 1);

INSERT INTO BookAuthor (book_id, author_id, author_role) VALUES
(1, 1, 'Author'),
(2, 2, 'Author'),
(3, 3, 'Author'),
(4, 4, 'Author'),
(5, 5, 'Author'),
(6, 6, 'Author'),
(7, 7, 'Author');

INSERT INTO Copy (book_id, condition, is_available, location) VALUES

(1, 'Excellent', TRUE, 'Shelf A-12'),
(1, 'Good', TRUE, 'Shelf A-12'),
(1, 'Used', FALSE, 'Shelf A-12'),
(2, 'Good', TRUE, 'Shelf B-05'),
(2, 'Worn', TRUE, 'Shelf B-05'),
(3, 'New', TRUE, 'Shelf C-18'),
(3, 'Excellent', FALSE, 'Shelf C-18'),
(3, 'Good', TRUE, 'Shelf C-18'),
(3, 'Good', TRUE, 'Shelf C-18'),
(4, 'Good', TRUE, 'Shelf D-22'),
(4, 'Used', FALSE, 'Shelf D-22'),
(5, 'Excellent', TRUE, 'Shelf E-07'),
(5, 'Good', TRUE, 'Shelf E-07'),
(6, 'Good', TRUE, 'Shelf F-14'),
(7, 'Excellent', TRUE, 'Shelf G-03'),
(7, 'Good', TRUE, 'Shelf G-03'),
(7, 'Worn', TRUE, 'Shelf G-03');

INSERT INTO Member (full_name, email, phone, address, member_type, join_date, expiry_date, is_active) VALUES
('Anna Leus', 'anna.leus@example.com', '+380-97-485-7618', 'Kyiv, Mykhaila Braichevskoho St. 8', 'Student', '2024-09-01', '2025-09-01', TRUE),
('Alice Johnson', 'alice.johnson@example.com', '+380-67-123-4567', 'Kyiv, Khreshchatyk St. 22', 'Premium', '2024-01-15', '2025-01-15', TRUE),
('Bob Smith', 'bob.smith@example.com', '+380-50-987-6543', 'Lviv, Svobody Ave. 15', 'Regular', '2024-03-20', '2025-03-20', TRUE),
('Carol Davis', 'carol.davis@example.com', '+380-63-456-7890', 'Odesa, Deribasivska St. 10', 'Teacher', '2023-11-10', '2024-11-10', TRUE),
('David Wilson', 'david.wilson@example.com', '+380-95-234-5678', 'Kharkiv, Sumska St. 45', 'Student', '2024-09-01', '2025-09-01', TRUE);

INSERT INTO Loan (copy_id, member_id, loan_date, due_date, return_date, fine_amount, status) VALUES

(3, 1, '2025-01-10', '2025-01-24', NULL, 0.00, 'Active'),
(7, 2, '2025-01-15', '2025-01-29', NULL, 0.00, 'Active'),
(11, 5, '2025-01-08', '2025-01-22', NULL, 0.00, 'Active'),
(1, 1, '2024-12-01', '2024-12-15', '2024-12-14', 0.00, 'Returned'),
(5, 3, '2024-12-05', '2024-12-19', '2024-12-18', 0.00, 'Returned'),
(2, 4, '2024-12-20', '2025-01-03', '2025-01-10', 15.00, 'Returned'),
(10, 2, '2024-12-28', '2025-01-11', NULL, 5.00, 'Overdue'),
(4, 5, '2024-11-15', '2024-11-29', '2024-11-28', 0.00, 'Returned'),
(8, 3, '2024-11-20', '2024-12-04', '2024-12-03', 0.00, 'Returned'),
(14, 1, '2024-10-10', '2024-10-24', '2024-10-22', 0.00, 'Returned');

SELECT 'Publishers:', COUNT(*) FROM Publisher
UNION ALL
SELECT 'Authors:', COUNT(*) FROM Author
UNION ALL
SELECT 'Books:', COUNT(*) FROM Book
UNION ALL
SELECT 'BookAuthors:', COUNT(*) FROM BookAuthor
UNION ALL
SELECT 'Copies:', COUNT(*) FROM Copy
UNION ALL
SELECT 'Members:', COUNT(*) FROM Member
UNION ALL
SELECT 'Loans:', COUNT(*) FROM Loan;
