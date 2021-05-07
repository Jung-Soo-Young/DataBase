-- DROP TABLE t_board; --
CREATE TABLE t_board (
	iboard INT UNSIGNED PRIMARY KEY auto_increment, 
	title VARCHAR(100) NOT NULL,
	ctnt VARCHAR(500) NOT NULL,
	r_dt DATETIME DEFAULT NOW() 
);

-- DROP TABLE t_cmt; --
CREATE TABLE t_cmt (
	icmt INT UNSIGNED PRIMARY KEY auto_increment,
	iboard INT UNSIGNED,
	ctnt VARCHAR(100) NOT NULL,
	r_dt DATETIME DEFAULT NOW()	
);

INSERT INTO t_board (title, ctnt)
VALUES
('안녕하세요','철이 없었죠....'),
('Hello', 'Nice to meet you'),
('MariaDB 사용법', '잘 사용하세요....');

INSERT INTO t_cmt (iboard, ctnt)
VALUES (1, '저도 철이없었어요.');
VALUES (1, '저도 성장하는 중입니다.');

SELECT * FROM t_board;
SELECT * FROM t_cmt;

SELECT A.*, B.*, ifnull(B.ctnt, '댓글 없음') -- B.ctnt에 비어있을 시 '댓글 없음' 삽입 --
FROM t_board A
inner JOIN t_cmt B
ON A.iboard = B.iboard;

SELECT A.iboard
FROM t_board A
LEFT JOIN t_cmt B 			-- t_cmt와 겹치는 부분 추출 --
ON A.iboard = B.iboard		-- t_board 와 t_cmt의 iboard 조인 --
WHERE B.icmt IS NULL;		-- 조건 t_cmt의 icmt 없는 값은 null --