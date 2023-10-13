import 'dart:math';

import 'package:task_1/models/student_model.dart';

List<String> studentBiography = [
  'Growing up I was always interested in the sciences and technology. In high school, I excelled in math and science classes, which led me to pursue a degree in engineering. I went on to earn my Bachelor’s degree in Engineering and am currently working on my Master’s in Civil Engineering. After I finish my degree, I plan to use my knowledge to help improve infrastructure in developing countries',
  'Since a young age, I have been passionate about helping people in need. During college, I decided to focus my studies on sociology and political science. I used my knowledge to take action and participated in several non-profit organizations to promote social justice. With the help of internships, I have also gained experience in policy development and public relations. I’m currently working on a graduate degree in Social Work and aim to eventually work for the United Nations',
  'As a freshman in high school, I was unsure of what kind of career path I wanted to pursue. After talking with my parents and teachers, I decided to start college as an undeclared major. After two years of exploration, I settled on a double major of business and economics. I’ve been able to take advantage of various opportunities on and off campus and served as an intern in the Human Resources department of a major banking firm. I look forward to earning my degree and using my skills to become a successful business leader',
  'I never thought that I had the ability to become a professional photographer, but my high school photography teacher pushed me to pursue my dreams. I learned how to use a variety of cameras, develop photographs, and post-process my images. I continued my photography studies at college, where I gained additional knowledge in studio lighting and digital editing. I was even able to gain experience in the fashion industry, interning for a well-known photographer. Today, I am working as an event photographer, documenting weddings, reunions, and corporate events',
  'When I was younger I was passionate about art, which prompted me to pursue a bachelor’s degree in Fine Arts. During college, I was able to gain experience as a studio assistant and also learn various digital and traditional art techniques. With the help of a scholarship, I was able to travel to various countries and learn even more about different art styles. After graduation, I started working as a freelance artist and have been able to produce several commissioned artworks and pieces',
  'As a child, I always exhibited an aptitude for mathematics and problem solving. After researching various career paths, I decided to major in Computer Science. I was able to gain valuable experience while interning at a tech startup and also during an internship with the Department of Defense. I am currently working on my master’s degree and plan to focus my studies on artificial intelligence and machine learning',
  'I have been involved in theater since I was a young child. During my high school years, I focused on honing my abilities through various extracurricular activities. I was able to gain valuable experience by participating in multiple productions and I even gained a scholarship for theater. I attended college to study Musical Theater and continued to foster my talent. With help from internships and workshops, I was able to build additional experience and formed a touring theater company with some of my colleagues',
  'From an early age, I was interested in the environment and the outdoors. I spent a lot of time reading environmental books and researching environmental issues. This passion inspired me to major in Environmental Science in college. I’ve gained valuable experience through various internships and part-time jobs. With the help of my degree, I’ve been able to work on several conservation projects and hope to soon work for a non-profit organization focused on sustainability',
  'When I graduated high school I wanted to focus my career on the medical field. After much research, I decided to major in Biomedical Engineering. During my time in college, I was able to gain a valuable experience by interning as a research assistant. I have been able to learn more about medical technology and have been able to contribute to various projects. I’m currently pursuing a master’s degree in Biomedical Engineering and plan to continue my research in the field and eventually work for a healthcare company',
  'I have always had an interest in fashion and design, so when the time came to decide my career path it made sense to pursue design. During college, I was able to study many aspects of fashion and gain experience through various internships. I was also able to travel to other countries to observe trends and learn about different cultures. With my degree, I am currently working as a fashion designer and I plan to continue to use my creative eye to come up with innovative and stylish designs.'
];

List<StudentModel> getStudents() {
  return List<StudentModel>.generate(
      100,
      (index) => StudentModel(
          name: 'Student $index',
          gpa: Random().nextInt(101),
          isActivist: Random().nextBool(),
          biography: studentBiography[Random().nextInt(10)]),
      growable: true);
}
