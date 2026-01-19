-- Lab 2: --

DROP TABLE IF EXISTS Loan CASCADE;
DROP TABLE IF EXISTS Copy CASCADE;
DROP TABLE IF EXISTS BookAuthor CASCADE;
DROP TABLE IF EXISTS Member CASCADE;
DROP TABLE IF EXISTS Book CASCADE;
DROP TABLE IF EXISTS Author CASCADE;
DROP TABLE IF EXISTS Publisher CASCADE;

CREATE TABLE Publisher (
    publisher_id SERIAL PRIMARY KEY,
    name_and_surname VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(150),
    CONSTRAINT uk_publisher_name UNIQUE(name_and_surname),
    CONSTRAINT chk_phone_format CHECK (phone ~ '^\+?[0-9\-\s]+$')
);

CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    death_date DATE,
    nationality VARCHAR(50),
    biography TEXT,
    CONSTRAINT chk_birth_before_death CHECK (death_date IS NULL OR birth_date < death_date),
    CONSTRAINT chk_birth_date_reasonable CHECK (birth_date > '1800-01-01')
);

CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(150) NOT NULL,
    year_published INT,
    genre VARCHAR(50),
    pages INT,
    language VARCHAR(30) DEFAULT 'English',
    publisher_id INT REFERENCES Publisher(publisher_id) ON DELETE SET NULL,
    CONSTRAINT chk_year_valid CHECK (year_published BETWEEN 1000 AND EXTRACT(YEAR FROM CURRENT_DATE)),
    CONSTRAINT chk_pages_positive CHECK (pages > 0),
    CONSTRAINT chk_isbn_format CHECK (isbn ~ '^[0-9\-]+$')
);

CREATE TABLE BookAuthor (
    book_id INT REFERENCES Book(book_id) ON DELETE CASCADE,
    author_id INT REFERENCES Author(author_id) ON DELETE CASCADE,
    author_role VARCHAR(50) DEFAULT 'Author',
    PRIMARY KEY (book_id, author_id)
);
CREATE TABLE Copy (
    copy_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES Book(book_id) ON DELETE CASCADE,
    condition VARCHAR(50) DEFAULT 'Good',
    is_available BOOLEAN DEFAULT TRUE,
    acquisition_date DATE DEFAULT CURRENT_DATE,
    location VARCHAR(100),
    CONSTRAINT chk_condition_valid CHECK (condition IN ('New', 'Excellent', 'Good', 'Used', 'Worn', 'Damaged'))
);

CREATE TABLE Member (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    member_type VARCHAR(20) DEFAULT 'Regular',
    join_date DATE DEFAULT CURRENT_DATE,
    expiry_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_member_type CHECK (member_type IN ('Student', 'Teacher', 'Regular', 'Premium')),
    CONSTRAINT chk_email_format CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'),
    CONSTRAINT chk_expiry_after_join CHECK (expiry_date IS NULL OR expiry_date > join_date)
);

CREATE TABLE Loan (
    loan_id SERIAL PRIMARY KEY,
    copy_id INT NOT NULL REFERENCES Copy(copy_id) ON DELETE CASCADE,
    member_id INT NOT NULL REFERENCES Member(member_id) ON DELETE CASCADE,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount NUMERIC(10,2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'Active',
    CONSTRAINT chk_due_after_loan CHECK (due_date > loan_date),
    CONSTRAINT chk_return_after_loan CHECK (return_date IS NULL OR return_date >= loan_date),
    CONSTRAINT chk_fine_non_negative CHECK (fine_amount >= 0),
    CONSTRAINT chk_status_valid CHECK (status IN ('Active', 'Returned', 'Overdue', 'Lost'))
);

CREATE INDEX idx_book_title ON Book(title);
CREATE INDEX idx_book_genre ON Book(genre);
CREATE INDEX idx_book_publisher ON Book(publisher_id);
CREATE INDEX idx_copy_book ON Copy(book_id);
CREATE INDEX idx_copy_available ON Copy(is_available);
CREATE INDEX idx_loan_member ON Loan(member_id);
CREATE INDEX idx_loan_copy ON Loan(copy_id);
CREATE INDEX idx_loan_status ON Loan(status);
CREATE INDEX idx_member_email ON Member(email);

COMMENT ON TABLE Publisher IS 'Інформація про видавництва';
COMMENT ON TABLE Author IS 'Інформація про авторів книг';
COMMENT ON TABLE Book IS 'Каталог книг бібліотеки';
COMMENT ON TABLE BookAuthor IS 'Зв''язок між книгами та авторами (багато-до-багатьох)';
COMMENT ON TABLE Copy IS 'Фізичні примірники книг';
COMMENT ON TABLE Member IS 'Члени бібліотеки';
COMMENT ON TABLE Loan IS 'Історія видачі книг';
