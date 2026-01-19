# lab2_bd

Lab 2: Створення схеми БД
Опис: Створення реляційної схеми бази даних для системи управління бібліотекою.

Файли:
lab2.sql - DDL скрипт створення таблиць
lab2_data.sql - Тестові дані

Структура бази даних

Таблиці:

1 Publisher (Видавництво)

publisher_id - первинний ключ (SERIAL)
name_and_surname - назва видавництва (UNIQUE, NOT NULL)
address, phone, email, website
Обмеження: перевірка формату телефону

2 Author (Автор)

author_id - первинний ключ
full_name, birth_date, death_date, nationality, biography
Обмеження: дата смерті після дати народження, народження після 1800 року

3 Book (Книга)

book_id - первинний ключ
isbn - унікальний ідентифікатор (UNIQUE, NOT NULL)
title, year_published, genre, pages, language
publisher_id - зовнішній ключ до Publisher
Обмеження: рік публікації в межах 1000-поточний рік, кількість сторінок > 0

4 BookAuthor (Зв'язок Книга-Автор)

Таблиця зв'язку багато-до-багатьох
book_id, author_id - складений первинний ключ
author_role - роль автора

5 Copy (Примірник)

copy_id - первинний ключ
book_id - зовнішній ключ до Book
condition - стан примірника
is_available - чи доступний для позики
acquisition_date, location
Обмеження: стан має бути одним з дозволених значень

6 Member (Член бібліотеки)

member_id - первинний ключ
full_name, email (UNIQUE), phone, address
member_type - тип членства
join_date, expiry_date, is_active
Обмеження: формат email, тип членства з списку, термін дії після дати приєднання

7 Loan (Позика)

loan_id - первинний ключ
copy_id, member_id - зовнішні ключі
loan_date, due_date, return_date
fine_amount, status
Обмеження: термін повернення після дати позики, штраф >= 0
