# IF(조건, 해당하는 경우 출력, 아닌 경우 출력)

# 예제) https://programmers.co.kr/learn/courses/30/lessons/59409
# 풀이)
SELECT ANIMAL_ID, NAME, IF(SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%', 'O', 'X') AS 중성화 FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
