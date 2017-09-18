--1)Concat 

Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
concat_f_l_name = FOREACH Student GENERATE CONCAT (stuFirstName ,stuLastName);
DUMP concat_f_l_name;

--2)Tokenize

Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
student_tokenize_namee = FOREACH Student GENERATE TOKENIZE(stuFirstName);
DUMP student_tokenize_namee ;

--3)Sum
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
group_city = GROUP Student BY city ;
marks_sum_city = FOREACH group_city GENERATE group , SUM(Student.marks) as sum ; 
DUMP marks_sum_city;  

--4)Min
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
group_city = GROUP Student ALL ;
min_marks = FOREACH group_city GENERATE group ,MIN(Student.marks) as min ; 
DUMP min_marks;

--5)Max
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
group_city = GROUP Student ALL ;
min_marks = FOREACH group_city GENERATE group ,MAX(Student.marks) as min ; 
DUMP min_marks;

--6)LIMIT
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
limit_student_5 = LIMIT Student 5;
DUMP limit_student_5;

--7)STORE
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
STORE Student INTO '/home/cloudera/Desktop/Acadgild/Assignment_4_2/Student_store.txt' Using PigStorage(',') ;

--8)DISTINCT
Student = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray ,stuLastName : chararray,age : int,phoneNum : int,city : chararray,marks : int);
city = FOREACH Student GENERATE city ;
distinct_city = DISTINCT city;
DUMP distinct_city;

--9)Flatten
Student1 = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray,stuLastName : chararray);
Student2 = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray,stuLastName : chararray);
co_group = cogroup Student1 by stuId , Student2 by stuId ;
grouped_students = FOREACH co_group GENERATE group ,flatten(Student1),flatten(Student2) ;
DUMP grouped_students;

--10)isEmpty 
Student1 = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray,stuLastName : chararray);
Student2 = LOAD '/home/cloudera/Desktop/Acadgild/Assignment_4_2/students.txt' Using PigStorage(',') AS (stuId : chararray ,stuFirstName : chararray,stuLastName : chararray);
cogroup_data = COGROUP Student1 by stuId, Student2 by stuId;
isempty_data = filter cogroup_data by IsEmpty(Student1);
DUMP isempty_data









