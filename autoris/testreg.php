<?php
session_start();// вся процедура работает на сессиях. Именно в ней хранятся данные пользователя, пока он находится на сайте. Очень важно запустить их в самом начале странички!!!


//если значение в БД 1 тогда скрипт выполняеться и время будет писаться в БД
//используетьсядля тестирования переодического
//============Записываем скорость роботы скрипта в БД для статистики!!!!!=========//
$start = microtime(true);//запуск функции отсчета времени с какого то там года...
$sum = 0;//Наша переменна я в милисекундах!
for ($i = 0; $i < 100000; $i++) $sum += $i;//запускаем цикл для определения скорости выполнения скрипта
//============Записываем скорость роботы скрипта в БД для статистики!!!!!=========//

//============Пищем модуль запуска и отключенияфункций на сайте===================//

// подключаемся к базе
require_once('../core/db.php');

$db = mysql_connect("localhost","root",""); //соединение с базой данных при помощи функции mysql_connect()
mysql_select_db("old-apeha.ru",$db);// Выбираем БД для коннекта!



if (isset($_POST['login'])) { $login = $_POST['login']; if ($login == '') { unset($login);} } //заносим введенный пользователем логин в переменную $login, если он пустой, то уничтожаем переменную
if (isset($_POST['password'])) { $password=$_POST['password']; if ($password =='') { unset($password);} }
//заносим введенный пользователем пароль в переменную $password, если он пустой, то уничтожаем переменную

if (empty($login) or empty($password)) //если пользователь не ввел логин или пароль, то выдаем ошибку и останавливаем скрипт
{
exit ("Вы ввели не всю информацию, венитесь назад и заполните все поля!");
}
//если логин и пароль введены,то обрабатываем их, чтобы теги и скрипты не работали, мало ли что люди могут ввести
$login = stripslashes($login);
$login = htmlspecialchars($login);
$login = mysql_real_escape_string($login);

$password = stripslashes($password);
$password = htmlspecialchars($password);
$password = mysql_real_escape_string($password);
//удаляем лишние пробелы
$login = trim($login);
$password = trim($password);
 //MD5 hashing!

/* Более сложный генератор паролей с любыми символами */
$sec_key="s1m2tx5g1l"; //секретный код который добавляеться к обычному паролю который потом хешируеться
$passwor=$password.$sec_key; // добавляем к паролю который ввел пользователь пароль о котором он не знает(смешиваем)

$md_pass=md5(md5(md5($password))); // хешируем все это добро 3 раза!
//Венегрет готов!!!

$result = mysql_query("SELECT * FROM Players WHERE login='$login'",$db); //извлекаем из базы все данные о пользователе с введенным логином
$myrow = mysql_fetch_array($result);
if ($md_pass != ($myrow['password']))
{
//если пользователя с введенным логином не существует
exit ("Извините, введённый вами логин или пароль неверный.");
}
else {
//если существует, то сверяем пароли
          if ($md_pass == $myrow['password']) {
          //если пароли совпадают, то запускаем пользователю сессию! Можете его поздравить, он вошел!
          $_SESSION['login']=$myrow['login']; 
          $_SESSION['id']=$myrow['id'];//эти данные очень часто используются, вот их и будет "носить с собой" вошедший пользователь
          //echo "Вы успешно вошли на сайт! <a href='../../../index.php'>Главная страница</a>";
              $URL="http://old-apeha.ru";
              header ("Location: $URL");//Переадресация...

             }

       else {
       //если пароли не сошлись
       exit ("Извините, введённый вами логин или пароль неверный.");
	   }
}




//============Записываем скорость роботы скрипта в БД для статистики!!!!!=========//

//$db = mysql_connect("localhost","root",""); //соединение с базой данных при помощи функции mysql_connect()
//mysql_select_db("neverworld",$db);// Выбираем БД для коннекта!
$id=5;//присваеваю значение айди статистики
$start=microtime(true) - $start;//минусую время запуска скрипта от начала до теперь что б узнать время в мл.сек
$start=round($start,2);//Округляем число после запятой до двух цыфр
$query = "UPDATE site_time SET time='$start'  WHERE id ='$id'";//Обновляю запись в БД
$result = mysql_query($query) or die("Query failed");//Выполняем скрипт или выводим ошибку!
//============Записываем скорость роботы скрипта ве БД для статистики!!!!!=========//

?>