[33mcommit 7ca51559929df16f467952704b9e72726800aa58[m[33m ([m[1;36mHEAD -> [m[1;32madmin-user[m[33m)[m
Author: an123456789 <anyeumessi@gmail.com>
Date:   Mon Dec 11 12:28:58 2017 +0700

    xong user

[1mdiff --git a/app/admin/users/create.php b/app/admin/users/create.php[m
[1mnew file mode 100644[m
[1mindex 0000000..feb8d6f[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/create.php[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32m<?php session_start(); ?>[m
[32m+[m[32m<?php require_once "../../../db/mysql.php"; ?>[m
[32m+[m[32m<?php require_once "../../helper/user-helper.php"; ?>[m
[32m+[m[32m<?php[m
[32m+[m[32m  if(isset($_POST["name"]) && isset($_POST["email"])[m
[32m+[m[32m    && isset($_POST["password"]) && isset($_POST["role"])){[m
[32m+[m[32m    $name = $_POST["name"];[m
[32m+[m[32m    $email = $_POST["email"];[m
[32m+[m[32m    $password = $_POST["password"];[m
[32m+[m[32m    $role = $_POST["role"];[m
[32m+[m
[32m+[m[32m    if(validate($email, $password)){[m
[32m+[m[32m      $sql = "insert into users(name,email,password,role) values('$name','$email','$password',$role)";[m
[32m+[m[32m      $result = $conn->query($sql);[m
[32m+[m[32m      if($result){[m
[32m+[m[32m        $_SESSION["flash"] = "New record added success";[m
[32m+[m[32m      }else{[m
[32m+[m[32m        $_SESSION["flash"] = "Error: ".$sql."<br>".$conn->error;[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    header("location: new.php");[m
[32m+[m[32m  }[m
[32m+[m[32m?>[m
\ No newline at end of file[m
[1mdiff --git a/app/admin/users/delete.php b/app/admin/users/delete.php[m
[1mnew file mode 100644[m
[1mindex 0000000..544971a[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/delete.php[m
[36m@@ -0,0 +1,15 @@[m
[32m+[m[32m<?php require_once "../../../db/mysql.php"; ?>[m
[32m+[m[32m<?php[m
[32m+[m[32mif(isset($_GET["id"])){[m
[32m+[m[32m  $id = $_GET["id"];[m
[32m+[m[32m  $sql = "delete from users where id=$id";[m
[32m+[m[32m  $result= $conn->query($sql);[m
[32m+[m[32m  if($result){[m
[32m+[m[32m    $_SESSION["flash"] = "Delete success";[m
[32m+[m
[32m+[m[32m  }else{[m
[32m+[m[32m    $_SESSION["flash"] = "Failed delete";[m
[32m+[m[32m  }[m
[32m+[m[32m  header("location: index.php");[m
[32m+[m[32m}[m
[32m+[m[32m?>[m
\ No newline at end of file[m
[1mdiff --git a/app/admin/users/edit.php b/app/admin/users/edit.php[m
[1mnew file mode 100644[m
[1mindex 0000000..335153f[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/edit.php[m
[36m@@ -0,0 +1,71 @@[m
[32m+[m[32m<?php session_start(); ?>[m
[32m+[m[32m<?php require_once "../../../db/mysql.php"; ?>[m
[32m+[m[32m<?php require_once "../../check-login.php"; ?>[m
[32m+[m[32m<?php[m
[32m+[m[32m  if(!isset($_GET["id"])){[m
[32m+[m[32m    $_SESSION["flash"] = "Wrong params";[m
[32m+[m[32m    header("location: index.php");[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  $id = $_GET["id"];[m
[32m+[m[32m  $sql = "select * from users where id='$id'";[m
[32m+[m[32m  $result = $conn->query($sql);[m
[32m+[m[32m  $row = $result->fetch_assoc();[m
[32m+[m[32m  $name = $row["name"];[m
[32m+[m[32m  $email = $row["email"];[m
[32m+[m[32m  $role = $row["role"];[m
[32m+[m[32m?>[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m  <head>[m
[32m+[m[32m    <title>Tao moi user</title>[m
[32m+[m[32m    <link rel="stylesheet" type="text/css" href="../../../public/css/bootstrap.min.css">[m
[32m+[m[32m    <link rel="stylesheet" type="text/css" href="../../../public/css/custom.css">[m
[32m+[m[32m  </head>[m
[32m+[m[32m  <body>[m
[32m+[m[32m  <?php include "../../menucon.php"; ?>[m
[32m+[m[32m  <div class="wrapper">[m
[32m+[m[32m    <form method="post" action="update.php">[m
[32m+[m[32m      <input type="hidden" value="<?php echo $id; ?>" name="id">[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <i class="flash"><?php if(isset($_SESSION["flash"])) echo $_SESSION["flash"]; ?></i>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div>[m
[32m+[m[32m        <h1>Tao moi nguoi dung</h1>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Ten nguoi dung:</label>[m
[32m+[m[32m        <input class="form-control" type="text" name="name" value="<?php echo $name; ?>">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Email:</label>[m
[32m+[m[32m        <input class="form-control"  type="email" name="email" value="<?php echo $email; ?>">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Mat khau:</label>[m
[32m+[m[32m        <input class="form-control"  type="password" name="password">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Lap lai mat khau:</label>[m
[32m+[m[32m        <input class="form-control"  type="password" name="repassword">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Quyen:</label>[m
[32m+[m[32m        <select class="form-control" name="role">[m
[32m+[m[32m          <option <?php if($role ==  2) echo "selected='true'"; ?> value="2">User</option>[m
[32m+[m[32m          <option <?php if($role ==  1) echo "selected='true'"; ?> value="1">Editor</option>[m
[32m+[m[32m          <option <?php if($role ==  0) echo "selected='true'"; ?> value="0">Admin</option>[m
[32m+[m[32m        </select>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <br>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <button class="btn btn-primary">Submit</button>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </form>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <script src="../../../public/js/jquery.min.js"></script>[m
[32m+[m[32m  <script src="../../../public/js/bootstrap.min.js"></script>[m
[32m+[m[32m  <script src="../../../public/js/bootstrap.bundle.min.js"></script>[m
[32m+[m[32m  </body>[m
[32m+[m[32m</html>[m
[32m+[m[32m<?php unset($_SESSION["flash"]); ?>[m
\ No newline at end of file[m
[1mdiff --git a/app/admin/users/index.php b/app/admin/users/index.php[m
[1mnew file mode 100644[m
[1mindex 0000000..fe549c9[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/index.php[m
[36m@@ -0,0 +1,58 @@[m
[32m+[m[32m<?php require_once "../../../db/mysql.php"; ?>[m
[32m+[m[32m<?php require_once "../../check-login.php"; ?>[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m<head>[m
[32m+[m[32m  <title>Danh sach nguoi dung</title>[m
[32m+[m[32m   <link rel="stylesheet" type="text/css" href="../../../public/css/bootstrap.min.css">[m
[32m+[m[32m    <link rel="stylesheet" type="text/css" href="../../../public/css/custom.css">[m
[32m+[m[32m</head>[m
[32m+[m[32m<body>[m
[32m+[m[32m  <?php include "../../menucon.php"; ?>[m
[32m+[m[32m  <div class="container">[m
[32m+[m[32m  <h2>Danh sach nguoi dung</h2>[m
[32m+[m[32m  <table class="table">[m
[32m+[m[32m    <thead>[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <th>Name</th>[m
[32m+[m[32m        <th>Email</th>[m
[32m+[m[32m        <th>Role</th>[m
[32m+[m[32m        <th>#</th>[m
[32m+[m[32m        <th>#</th>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </thead>[m
[32m+[m[32m    <tbody>[m
[32m+[m[32m    <?php[m
[32m+[m[32m    $sql = "select * from users";[m
[32m+[m[32m    $result = $conn->query($sql);[m
[32m+[m[32m    if ($result->num_rows > 0) {[m
[32m+[m[32m      while ($row = $result->fetch_assoc()) { ?>[m
[32m+[m[32m        <tr>[m
[32m+[m[32m          <td><?php echo $row['name']; ?></td>[m
[32m+[m[32m          <td><?php echo $row['email']; ?></td>[m
[32m+[m[32m          <td><?php switch ($row['role']) {[m
[32m+[m[32m            case 0:[m
[32m+[m[32m              echo "Admin";[m
[32m+[m[32m              break;[m
[32m+[m[32m            case 1:[m
[32m+[m[32m              echo "Editor";[m
[32m+[m[32m              break;[m
[32m+[m[32m            case 2:[m
[32m+[m[32m              echo "User";[m
[32m+[m[32m              break;[m
[32m+[m[32m          }; ?>[m[41m            [m
[32m+[m[32m          </td>[m
[32m+[m[32m          <td><a href="Edit.php?id=<?php echo $row["id"];?>">Edit</a></td>[m
[32m+[m[32m          <td><a href="delete.php?id=<?php echo $row["id"];?>">Delete</a></td>[m
[32m+[m[32m        </tr>[m
[32m+[m[32m    <?php  }[m
[32m+[m[32m    }[m
[32m+[m[32m     ?>[m[41m       [m
[32m+[m[32m    </tbody>[m
[32m+[m[32m  </table>[m
[32m+[m[32m</div>[m
[32m+[m[32m<script src="../../../public/js/jquery.min.js"></script>[m
[32m+[m[32m<script src="../../../public/js/bootstrap.min.js"></script>[m
[32m+[m[32m<script src="../../../public/js/bootstrap.bundle.min.js"></script>[m
[32m+[m[32m</body>[m
[32m+[m[32m</html>[m
\ No newline at end of file[m
[1mdiff --git a/app/admin/users/new.php b/app/admin/users/new.php[m
[1mnew file mode 100644[m
[1mindex 0000000..1fa55fe[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/new.php[m
[36m@@ -0,0 +1,55 @@[m
[32m+[m[32m<?php session_start(); ?>[m
[32m+[m[32m<?php require_once "../../check-login.php"; ?>[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m[32m  <head>[m
[32m+[m[32m    <title>Tao moi user</title>[m
[32m+[m[32m    <link rel="stylesheet" type="text/css" href="../../../public/css/bootstrap.min.css">[m
[32m+[m[32m    <link rel="stylesheet" type="text/css" href="../../../public/css/custom.css">[m
[32m+[m[32m  </head>[m
[32m+[m[32m  <body>[m
[32m+[m[32m  <?php include "../../menucon.php"; ?>[m
[32m+[m[32m  <div class="wrapper">[m
[32m+[m[32m    <form method="post" action="create.php">[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <i class="flash"><?php if(isset($_SESSION["flash"])) echo $_SESSION["flash"]; ?></i>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div>[m
[32m+[m[32m        <h1>Tao moi nguoi dung</h1>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Ten nguoi dung:</label>[m
[32m+[m[32m        <input class="form-control" type="text" name="name">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Email:</label>[m
[32m+[m[32m        <input class="form-control"  type="email" name="email">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Mat khau:</label>[m
[32m+[m[32m        <input class="form-control"  type="password" name="password">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Lap lai mat khau:</label>[m
[32m+[m[32m        <input class="form-control"  type="password" name="repassword">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <label>Quyen:</label>[m
[32m+[m[32m        <select class="form-control" name="role">[m
[32m+[m[32m          <option value="2">User</option>[m
[32m+[m[32m          <option value="1">Editor</option>[m
[32m+[m[32m          <option value="0">Admin</option>[m
[32m+[m[32m        </select>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <br>[m
[32m+[m[32m      <div class="row">[m
[32m+[m[32m        <button class="btn btn-primary">Submit</button>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </form>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <script src="../../../public/js/jquery.min.js"></script>[m
[32m+[m[32m  <script src="../../../public/js/bootstrap.min.js"></script>[m
[32m+[m[32m  <script src="../../../public/js/bootstrap.bundle.min.js"></script>[m
[32m+[m[32m  </body>[m
[32m+[m[32m</html>[m
[32m+[m[32m<?php unset($_SESSION["flash"]); ?>[m
\ No newline at end of file[m
[1mdiff --git a/app/admin/users/update.php b/app/admin/users/update.php[m
[1mnew file mode 100644[m
[1mindex 0000000..1f76f01[m
[1m--- /dev/null[m
[1m+++ b/app/admin/users/update.php[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m<?php session_start(); ?>[m
[32m+[m[32m<?php require_once "../../../db/mysql.php"; ?>[m
[32m+[m[32m<?php require_once "../../helper/user-helper.php"; ?>[m
[32m+[m[32m<?php[m
[32m+[m[32m  if(isset($_POST["id"]) && isset($_POST["name"]) && isset($_POST["email"])[m
[32m+[m[32m    && isset($_POST["password"]) && isset($_POST["role"])){[m
[32m+[m[32m    $id = $_POST["id"];[m
[32m+[m[32m    $name = $_POST["name"];[m
[32m+[m[32m    $email = $_POST["email"];[m
[32m+[m[32m    $password = $_POST["password"];[m
[32m+[m[32m    $role = $_POST["role"];[m
[32m+[m
[32m+[m[32m    $sql = "update users set name='$name',email ='$email',password='$password',role=$role where id=$id";[m
[32m+[m[32m    $result = $conn->query($sql);[m
[32m+[m[32m    if($result){[m
[32m+[m[32m      $_SESSION["flash"] = "Updated success";[m
[32m+[m[32m    }else{[m
[32m+[m[32m      $_SESSION["flash"] = "Error: ".$sql."<br>".$conn->error;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    header("location: index.php");[m
[32m+[m[32m  }[m
[32m+[m[32m?>[m
\ No newline at end of file[m
[1mdiff --git a/app/helper/user-helper.php b/app/helper/user-helper.php[m
[1mnew file mode 100644[m
[1mindex 0000000..c98ba52[m
[1m--- /dev/null[m
[1m+++ b/app/helper/user-helper.php[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m<?php[m
[32m+[m[32m  function validate($email,$password){[m
[32m+[m[32m    if(trim($email) == "" || trim($password) == ""){[m
[32m+[m[32m      $_SESSION["flash"] = "Email or Password can not empty";[m
[32m+[m[32m      return false;[m
[32m+[m[32m    }[m
[32m+[m[32m    $sql = "select * from users where email='$email'";[m
[32m+[m[32m    GLOBAL $conn;[m
[32m+[m[32m    $result = $conn->query($sql);[m
[32m+[m[32m    if($result->num_rows > 0){[m
[32m+[m[32m      $_SESSION["flash"] = "Email was existed.";[m
[32m+[m[32m      return false;[m
[32m+[m[32m    }[m
[32m+[m[32m    return true;[m
[32m+[m[32m  }[m
[32m+[m[32m?>[m
\ No newline at end of file[m
