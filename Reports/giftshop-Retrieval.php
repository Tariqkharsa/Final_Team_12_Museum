<?php

$dbServername = "team12.copftkcel1k2.us-east-1.rds.amazonaws.com";
$dbUser = "admin";
$dbPass = "Group12,museum";
$dbName = "FinalTeam12";

//connect to database
$conn = new mysqli($dbServername, $dbUser, $dbPass, $dbName);

//if connection error occurs
if($conn -> connect_errno){
  echo "Failed to connect to MySQL: " . $conn -> connect_error;
  exit();
}
?>

<DOCTYPE html>
  <html>
  <link rel="stylesheet" href="../tFormat2.css?v=<?php echo time(); ?>">
  <body>
  <link rel="stylesheet" href="../Table.css">
    <div class="main">
    <h1>GiftShop: PURCHASED</h1>
    <h2>Giftshop RETRIEVED:</h2>

    <div class="TicketOutput">
      <?php
        $itemName = $_GET['item-lookup'];
        $giftID = $_GET['id-lookup'];
        $price = $_GET['price-lookup'];
        $quantity = $_GET['quantity-lookup'];
        $totalSales = 0;
        $totalItems = 0;
        $query0 = "SELECT * FROM GiftShop WHERE ";
        $query1 = $query2 = $query3 = $query4 = "GiftID > 0";
        if(!empty($itemName)){
            $query1 = "GiftName LIKE '%{$itemName}%'";
        }
        if($giftID != ''){
            $query2 = "GiftID='$giftID'";
        }
        if(!empty($price)){
            $query3 = "Price= '$price'";
        }
        if(!empty($quantity)){
            $query4 = "quantity= '$quantity'";
        }
        if(empty($itemName) && empty($giftID) && empty($price) && empty($quantity)){
            $query = "SELECT * FROM GiftShop";
        }
        else{
            $query = $query0 . $query1 . ' AND ' . $query2 . ' AND ' . $query3  . ' AND ' . $query4;
        }
        $result = mysqli_query($conn,$query);
        //if ticket id is found
        if(mysqli_num_rows($result) > 0){
          //create table
          echo "<table>";
            echo "<tr>";
              echo "<th>Gift ID</th>";
              echo "<th>Item Name</th>";
              echo "<th>Quantity</th>";
              echo "<th>Price</th>";
            echo "</tr>";

            //loop to add ticket information from database into table
            while($row = mysqli_fetch_array($result)){
              echo "<tr>";
                echo "<td>"  . $row['GiftID']  .  "</td>";
                echo "<td>"  . $row['GiftName']  .  "</td>";
                echo "<td>"  . $row['Price']  .  "</td>";
                echo "<td>"  . $row['quantity']  .  "</td>";
              echo "</tr>";
              $totalSales = $totalSales + ($row['quantity'] * $row['Price']);
              $totalItems = $totalItems + $row['quantity'];
            }

          echo "</table>";
          
        }

        //if ticket id is not found
        else{
          echo "No item is found!";
        }
      ?>
    </div>
        <h3>Total Sales: $<?php  echo $totalSales;?>.00</h3>
        <h3>Total items: <?php  echo $totalItems;?></h3>
    <p></p>
    <p></p>
    <link rel="stylesheet" href="../Collections/Coll.css">
    <style>
         .button-56 {
            right:0px;
         }
    </style>
    <nav class="nav-item"><a href="giftshop-Search.php"><button class="button-56" role="button">Return</button></a></nav>
    <p></p>
  </div>
  </body>
  </html>


  <?php
    mysqli_close($conn);
  ?>