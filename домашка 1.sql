CREATE TABLE emp (
    TabNo VARCHAR(3),
    DepNo INT,
    Name VARCHAR(40),
    Post VARCHAR(40),
    Salary NUMBER(7,1),
    Born DATE,
    Phone VARCHAR(10)
);

-- Внести данные сотрудников 
INSERT INTO emp VALUES ('988', 1, 'Рюмин В.П.', 'начальник отдела', 48500.0, '01-FEB-1970', '115-26-12');
INSERT INTO emp VALUES ('909', 1, 'Серова Т.В.', 'вед. программист', 48500.0, '20-OCT-1981', '115-91-19');
INSERT INTO emp VALUES ('829', 1, 'Дурова А.В.', 'экономист', 43500.0, '03-OCT-1978', '115-26-12');
INSERT INTO emp VALUES ('819', 1, 'Тамм Л.В.', 'экономист', 43500.0, '13-NOV-1985', '115-91-19');
INSERT INTO emp VALUES ('100', 2, 'Волков Л.Д.', 'программист', 46500.0, '16-OCT-1982', NULL);
INSERT INTO emp VALUES ('110', 2, 'Буров Г.О.', 'бухгалтер', 42880.0, '22-MAY-1975', '115-46-32');
INSERT INTO emp VALUES ('023', 2, 'Малова Л.А.', 'гл. бухгалтер', 59240.0, '24-NOV-1954', '114-24-55');
INSERT INTO emp VALUES ('130', 2, 'Лукина Н.Н.', 'бухгалтер', 42880.0, '12-JUL-1979', '115-46-32');
INSERT INTO emp VALUES ('034', 3, 'Перова К.В.', 'делопроизводитель', 32000.0, '24-APR-1988', NULL);
INSERT INTO emp VALUES ('002', 3, 'Сухова К.А.', 'начальник отдела', 48500.0, '08-JUN-1948', '115-12-69');
INSERT INTO emp VALUES ('056', 5, 'Павлов А.А.', 'директор', 80000.0, '05-MAY-1968', '115-33-44');
INSERT INTO emp VALUES ('087', 5, 'Котова И.М.', 'секретарь', 35000.0, '16-SEP-1990', '115-33-65');
INSERT INTO emp VALUES ('088', 5, 'Кроль А.П.', 'зам. директора', 70000.0, '18-APR-1974', '115-33-01');

-- Описать структуры таблицы
DESC emp;
SELECT * FROM emp;

-- Добавить в таблицу колонку "Количество детей"
ALTER TABLE emp ADD Children INT;

-- Добавить в таблицу колонку "Пол сотрудника"
ALTER TABLE emp ADD Sex VARCHAR(7);

-- Удалить из таблицы колонку "Born"
ALTER TABLE emp DROP COLUMN Born;

-- Добавить в таблицу запись о новом сотруднике, о котором известны все данные (данные придумать) => доделать
INSERT INTO emp VALUES (080, 1, 'Миронкина Ю.Н.', 'отв. актуарий', 100000.0, '01-JAN-1970', '115-31-01');
    
-- Добавить в таблицу данные о новом сотруднике, о котором известно Tabno и Name
INSERT INTO emp (TabNo, Name) VALUES (144, 'Мхитарян В.С.');

-- Удалить сотрудников с должностью "бухгалтер"
DELETE FROM emp WHERE Post = 'бухгалтер';

-- Вместо ЗП расчитать ЗП за вычетом подоходного налога
UPDATE emp SET Salary = Salary * 0.87

-- Назначить Дурову А.В. главбухом
UPDATE emp SET Post = 'гл.бухгалтер' WHERE Name = 'Дурова А.В.';

-- Очистить все записи таблицы emp
DELETE FROM emp

-- Удалить полностью таблицу emp
DROP TABLE emp

-- Придумать 5 новых аналогичных задач и написать код для их решения

-- Вывести ФИО работника и его чистую заработную плату в пределах 40000 и 50000 в порядке возрастания выплат    
SELECT Name, Salary*0.87 AS "Зарплата чистая"
FROM emp
WHERE Salary*0.87 BETWEEN 40000 AND 50000
ORDER BY Salary*0.87 ASC;

-- Увеличить заработную плату всем бухгалтерам на 20%
UPDATE emp SET Salary = Salary*1.2 WHERE Post LIKE '%бухгалтер%';

-- Перевести всех программистов в новый отдел 4
UPDATE emp SET DepNo = 4 WHERE Post LIKE '%программист%'
    
-- Уменьшить заработную плату на 5000 всем сотрудникам, в чьих фамилиях есть буква Ь
UPDATE emp SET Salary = Salary - 5000 WHERE Name LIKE '%ь%'

--Вывести ФИО работника, его номинальную заработную плату по убыванию и день рождения по возрастанию, у которых ненулевое значение телефонного номера
SELECT Name, Salary, Born
FROM emp
WHERE Phone IS NOT Null
ORDER BY Salary DESC, Born ASC
