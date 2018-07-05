<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>School</title>
</head>
<body>


<form action="" method="post">
	<input type="submit" value="Список учеников и в каких они классах" name="showPupilsInClasses"></br>
	<input type="submit" value="Список учеников в 8-А классе" name="showPupilsInClass"></br>
	<input type="submit" value="Список оценок Петрова Александра" name="showPupilMarks"></br>
	<input type="submit" value="В каких кабинетах проводят урок математики" name="showSubjectClasses"></br>
	<input type="submit" value="Кто классний руководитель у 2-Б класса" name="showClassTeacher"></br>
	<input type="submit" value="Список оценок по Локтева Игоря по английскому" name="showPupilMarksSubject"></br>
</form>
</br>

<?php
error_reporting(-1);
ini_set('log_errors',1);


try {

    $dbh = new PDO('mysql:host=localhost;dbname=School', 'user_vadim', '123456', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"]);

		// =========================================================================

		// $str = $_GET["name"];
		
		// $insert = $dbh->prepare("INSERT INTO `name` (name) VALUES("$_GET["name"]")");
		// $insert->execute([$str]);

		// $sth = $dbh->prepare("INSERT INTO `users`(name, login,password,email,phone)VALUES(?,?,MD5(?),?,?)");
  //   $sth->execute(array("user1", "user1", "pass1", "mail@mail.com", "39074938475"));

		// =========================================================================

		// $dbh->query("
		// 	INSERT INTO `test` (`name`) VALUES ('NewName')
		// ");

		// =========================================================================

		// $dbh->query("
		// 	DELETE FROM `test`
		// 	WHERE `id` > 3
		// ");

		// =========================================================================

		// $sth = $dbh->prepare("
		// 	UPDATE `test` SET
		// 	`name` = 'Updated Name'
		// 	WHERE `id` = ? OR `id` = ?
		// ");
		// $sth->execute([1, 3]);


    	if(isset($_POST['showPupilsInClasses'])){
    	$res = $dbh->query('SELECT Pupils.Name, Classes.ClassName from Pupils join Classes on  Pupils.ClassID=Classes.ClassID');
			//$res = $dbh->query('SELECT * from `Pupils`');


		while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
			//print_r($row);
			echo $row["Name"] ." -> ". $row["ClassName"];
			echo "</br>";
		}
		$dbh = null;
}

    

} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>


</body>
</html>