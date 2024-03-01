select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (
SELECT GROUP_CONCAT(roomid) AS roomid from booking WHERE (checkin  BETWEEN '2023-12-27' AND '2023-12-28' OR checkout BETWEEN '2023-12-27' AND '2023-12-28')
) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (
1,2,2,5
) GROUP BY rtype,price,roomname




sp qur

/*((sum(bhk1count)+SUM(bhk2count))) , ((SUM(bhk3count)))  from booking where   (checkin  BETWEEN  ',cin ,' AND  ',cout,'  OR checkout BETWEEN ' ,cin,'  AND ', cout,'  )');
 (',@bhk3available,'-(SUM(bhk3count)))
 
 (',@bhk2available,'-(sum(bhk1count)+SUM(bhk2count))) INTO @bhk2roomcount ,
/*
SET @SQL_QUERY1 =CONCAT('SELECT (',@bhk2available,'-(sum(bhk1count)+SUM(bhk2count))) INTO
SET @SQL_QUERY1 =CONCAT('SELECT (',@bhk2available,'-(sum(bhk1count)+SUM(bhk2count)))  (',@bhk3available,'-(SUM(bhk3count)))  from booking where   (checkin  BETWEEN  ',cin ,' AND  ',cout,'  OR checkout BETWEEN ' ,cin,'  AND ', cout,'  )');

	 /*SET @SQL_QUERY1 =CONCAT('select COUNT(roomid) INTO @bhk2roomcount from room where roomid NOT IN (', @bookedIds ,') AND rtype=2');
/* SET @SQL_QUERY2 =CONCAT('select COUNT(roomid) INTO @bhk3roomcount from room where roomid NOT IN (', @bookedIds ,') AND rtype=3');
*/
/*SELECT @SQL_QUERY1;
/*select @SQL_QUERY2;*/


/*
	select group_concat(roomid) INTO @bookedIds from booking WHERE (checkin  BETWEEN  cin AND  cout  OR checkout BETWEEN  cin  AND  cout  );
IF(@bookedIds IS NULL) THEN
        SET @bookedIds := 0;
    END IF;
*/

/*SELECT @bookedIds, @bhk2roomcount,  @bhk3roomcount;
/* 
SET @remarks = '';
/*
select COUNT(roomname) AS roomcount, from room where roomid NOT IN (SELECT group_concat(roomid) FROM booking WHERE checkin  BETWEEN  'cin' AND  'cout'  OR checkout BETWEEN  'cin'  AND  'cout'   ) GROUP BY rtype) and rtype=1;
/*
select COUNT(roomname) AS roomcount,rtype  from room where roomid NOT IN (SELECT group_concat(roomid) FROM booking WHERE checkin  BETWEEN  'cin' AND  'cout'  OR checkout BETWEEN  'cin'  AND  'cout'   ) GROUP BY rtype) and rtype=1;

select COUNT(roomname) AS roomcount,rtype  from room where roomid NOT IN (10,8,1,2,5) and rtype=2;
select COUNT(roomname) AS roomcount,rtype  from room where roomid NOT IN (10,8,1,2,5) and rtype=3;
select COUNT(roomname) AS roomcount,rtype  from room where roomid NOT IN (10,8,1,2,5) group By rtype;
*/
/*
select obs_name into @roomcount from room where roomid NOT IN();
*/
