<?php
session_start();
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

/* Более сложный генератор паролей с любыми символами */
$sec_key="s1m2tx5g1l";
$passwor=$password.$sec_key;
$md_pass=md5(md5(md5($password))); //MD5 hashing!


// проверка на существование пользователя с таким же логином
$result = mysql_query("SELECT id FROM Players WHERE login='$login'",$db);
$myrow = mysql_fetch_array($result);
if (!empty($myrow['id'])) {
exit ("Извините, введённый вами логин уже зарегистрирован. Введите другой логин.");
}
//
$date=date("j-n-Y");//Беру время в данный момент времени
$time= date("H:i:s");//Беру дату в данный момент времени
$ip=$_SERVER['REMOTE_ADDR'];//Беру глобальный айпи пользователя
// если такого нет, то сохраняем данные
$result2 = mysql_query ("INSERT INTO Players (login,password,reg_ip,reg_time,reg_date) VALUES('$login','$md_pass','$ip','$time','$date')");
// Проверяем, есть ли ошибки
if ($result2=='TRUE')
{
echo "Вы успешно зарегистрированы! Теперь вы можете зайти на сайт. <a href='../index.php'>Главная страница</a>";
}

else {
echo "Ошибка! Вы не зарегистрированы.";
     }





//============Записываем скорость роботы скрипта в БД для статистики!!!!!=========//

//$db = mysql_connect("localhost","root",""); //соединение с базой данных при помощи функции mysql_connect()
//mysql_select_db("neverworld",$db);// Выбираем БД для коннекта!
$id=4;//присваеваю значение айди статистики
$start=microtime(true) - $start;//минусую время запуска скрипта от начала до теперь что б узнать время в мл.сек
$start=round($start,2);//Округляем число после запятой до двух цыфр
$query = "UPDATE site_time SET time='$start'  WHERE id ='$id'";//Обновляю запись в БД
$result = mysql_query($query) or die("Query failed");//Выполняем скрипт или выводим ошибку!
//============Записываем скорость роботы скрипта ве БД для статистики!!!!!=========//

?>