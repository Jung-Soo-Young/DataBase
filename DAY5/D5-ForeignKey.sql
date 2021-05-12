CREATE TABLE T_ORDER (
	o_no INT,
	cus_no INT,
	o_date DATE DEFAULT NOW(),
	o_price INT,
	PRIMARY KEY (o_no, cus_no),
	FOREIGN KEY (cus_no) REFERENCES T_CUSTOMER(cus_no)	-- 외래키 및 관계 설정 --
);

CREATE TABLE T_CUSTOMER (
	cus_no INT PRIMARY KEY,
	nm VARCHAR(10) NOT null
);

INSERT INTO T_ORDER (o_no, cus_no, o_price)	-- T_ORDER 테이블 값 추가 --
VALUES
(1, 3, 55000),
(2, 5, 70000),
(3, 3, 60000);

INSERT INTO T_CUSTOMER (cus_no, nm)		-- T_CUSTOMER 테이블 값 추가 --
VALUES
(3, '홍길동'),
(5, '이순신');

UPDATE t_customer		-- 수정 --
SET nm = '장보고'
WHERE cus_no = 5;

DELETE from t_order	-- 삭제 --
WHERE o_no = 2;

SELECT * FROM t_order	-- 조회 --
WHERE cus_no = 3;

SELECT A.o_no, A.o_date, A.o_price, B.nm FROM T_ORDER A
inner JOIN T_CUSTOMER B
ON A.cus_no = B.cus_no;

SELECT * FROM T_ORDER;
-- SELECT * FROM T_CUSTOMER; --

CREATE INDEX idx_customer_nm ON T_CUSTOMER(nm);
DROP INDEX idx_customer_nm ON t_customer;

CREATE VIEW view_order_info AS 
SELECT * FROM T_ORDER;

alter VIEW view_order_info AS
SELECT * FROM T_ORDER;

