# Attendance Management App

### Project Abstract
Attendance management is important to every single organization. There is a need for having a system which can track the attendance of students and keeps everyone informed so that there will be no problems. In the future regarding the attendance. Organizations will have to keep a track of people within the organization such as employees and students to maximize their performance. Managing student attendance during lecture periods has become a difficult challenge. The ability to compute the attendance percentage becomes a major task as manual computation produces errors, and wastes a lot of time. For the stated reason, an efficient Web-based application for attendance management system is designed to track student's activity in the class. Recording absence at a department having a large number of students in a classroom is a difficult task and time-consuming. Moreover, the process takes much time, and many efforts are spent by the staff of the department to complete the attendance rates for each student. So in many institutions and academic organizations, attendance is a very important criterion which is used for various purposes. These purposes include record keeping, assessment of students, and promotion of optimal and consistent attendance in class.

<img src="https://github.com/srinath1412001/teacher_end/blob/experimental/1.jpg" width="30%"> <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/2.jpg" width="30%"> <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/3.jpg" width="30%"> <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/4.png" width="30%">  <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/5.png" width="30%">   





### Design
The attendance app is built using **Flutter software development kit** which is based on android and uses **Firebase Firestore** as its back-end to store the information regarding the absence of student and as well as the details of students. Firebase Auth services are used to manage the authentication of Users. 
           The teacher has user interface to select the semester and section of students which he/she handles and a screen is displayed containing the list of students enrolled to his/her subject. The Student view has an interface to select the list of subjects in which he/she has enrolled in and gets to check what is his/her attendance percentage and also on what dates he/she was absent.
         The app is designed in a user-friendly way, by default in teacher’s view the students are marked present on the day of marking attendance, if a student is absent then the teacher can toggle the switch trailing at the end of USN listed among a list of students. This speeds up the process of taking attendance. When attendance is taken all the values concerning whether a student is present/absent is stored in the NoSQL database in key-value pairs where the key is isPresent inside a document with ID of the date on which the attendance was marked. This in turn updates the key-value pair of totalClasses and ClassesAttended by the student in a document with a documentID of respective subject the student is enrolled in. Each subject is stored as document inside a sub-collection called ‘Subjects’.
        All the details of student are stored in a separate collection with a unique ID and retrieved when the teacher is marking attendance (this helps in locating the student data in the main collection). The information of stored comprises of his/her name, USN, semester, section and phone number. So when a student is absent the teacher can contact him/her concerning the absence. 
         Every teacher is given a unique id which is used, every time the teacher logs in; this makes sure that the user is a teacher and the firebase Auth stream makes sure that the user gets access and privileges down the widget tree.

<img src="https://github.com/srinath1412001/teacher_end/blob/experimental/6.jpg" width="30%"> <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/7.png" width="30%"> <img src="https://github.com/srinath1412001/teacher_end/blob/experimental/9.jpg" width="30%">
         
