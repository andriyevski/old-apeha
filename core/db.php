<?php
/**
 * Created by PhpStorm.
 * User: Andriyevski
 * Date: 17.03.15
 * Time: 0:14
 */
   class Connection{
        public function connect(){
            // подключаемся к базе
            $db = mysql_connect("localhost","root",""); //соединение с базой данных при помощи функции mysql_connect()
            mysql_select_db("old-apeha.ru",$db);// Выбираем БД для коннекта!
            return;
        }


    }