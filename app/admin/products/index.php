<?php require_once "../../../db/mysql.php"; ?>
<?php require_once "../../check-login.php"; ?>
<!DOCTYPE html>
<html>
<head>
  <title>Danh sach nguoi dung</title>
   <link rel="stylesheet" type="text/css" href="../../../public/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../public/css/custom.css">
</head>
<body>
  <?php include "../../menucon.php"; ?>
  <div class="container">
  <h2>Danh Sách Sản Phẩm</h2>
  <table class="table">
    <thead>
      <tr>
        <th>User ID</th>
        <th>Catalog ID</th>
        <th>Name</th>
        <th>Image</th>
        <th>Description</th>
        <th>QTY</th>
        <th>Price</th>
        <th>:D</th>
        <th>:D</th>
      </tr>
    </thead>
    <tbody>
    <?php
    $sql = "select * from products";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) { ?>
        <tr>
          <td><?php echo $row['user_id']; ?></td>
          <td><?php echo $row['catalog_id']; ?></td>
          <td><?php echo $row['name']; ?></td>
          <td><?php echo $row['image']; ?></td>
          <td><?php echo $row['description']; ?></td>
          <td><?php echo $row['qty']; ?></td>
          <td><?php echo $row['price']; ?></td>
          <td><a href="Edit.php?id=<?php echo $row["id"];?>">Edit</a></td>
          <td><a href="delete.php?id=<?php echo $row["id"];?>">Delete</a></td>
        </tr>
    <?php  }
    }
     ?>       
    </tbody>
  </table>
</div>
<script src="../../../public/js/jquery.min.js"></script>
<script src="../../../public/js/bootstrap.min.js"></script>
<script src="../../../public/js/bootstrap.bundle.min.js"></script>
</body>
</html>