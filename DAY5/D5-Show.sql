-- 자신이 접근할 수 있는 테이블 조회 --
SHOW TABLES;
-- 인덱스 조회 --
SHOW INDEX FROM 테이블명;
-- 전체 뷰 조회 --
SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'view';
SELECT 'a' = 'b';

-- CREATE INDEX 인덱스명 ON 테이블명 (컬럼명); --
CREATE INDEX idx_abcd ON memebertbl(memberName);
-- ALTER TABLE 테이블명 drop index 인덱스명;
ALTER TABLE memebertbl DROP INDEX idx_abcd;
DROP INDEX idx_abcd ON memebertbl;

CREATE VIEW view_abc AS -- view 가상 테이블 (저장하는 곳) --
SELECT * FROM memebertbl -- 조건식 --
WHERE memberName LIKE '%이%';

DROP VIEW view_abc -- view 삭제 --

SELECT * FROM view_abc
WHERE memberID = 'Dang';