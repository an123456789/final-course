<div class="col-lg-3">
  <!-- <h3 class="my-3">Hãng sản xuất</h3> -->
  <div class="list-group pt-4">
    <p href="#" class="list-group-item bg-dark text-primary">Hãng sản xuất</p>
  	<?php
        $sql = "select * from catalogs";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) { ?>            
    		<a href="catalog.php?catalog_id=<?php echo $row["id"];?>" class="list-group-item myli"><?php echo $row["name"]; ?></a>
          <?php   }
        }
      ?>
  </div>
</div>