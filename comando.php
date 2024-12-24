<?php
$id=$_POST["id"];
$desc=$_POST["desc"];
$id++;
//$a=array($id,$desc);
$obj->id=$id;
$obj->desc=$desc;
$a=$obj;
echo json_encode($a);
