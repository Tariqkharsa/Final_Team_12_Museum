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

<?php
//initialize var that will hold ticket ID from form
$ticketID = "";
?>

<DOCTYPE html>
  <html>
  <link rel="stylesheet" href="../tFormat2.css?v=<?php echo time(); ?>">
  <body>
    <div class="main">
    <h1>Gifts: PURCHASED GIFTS</h1>
    <h2>Enter Gift ID:</h2>

    <!--Form to take in ticket id-->
    <div class="TicketSearch">
      <!--action="/ViewTicket-Retrieval.php"-->
      <form action="giftshop-Retrieval.php" method="GET">
      <label for="itemName">Item Name</label>
        <input type="search" name="item-lookup" value="<?php if(isset($_GET['item-lookup'])){echo $_GET['item-lookup'];} ?>"> 
        <label for="itemID">Item ID:</label>
        <input type="search" name="id-lookup" value="<?php if(isset($_GET['id-lookup'])){echo $_GET['id-lookup'];} ?>"> 
        <label for="price">Price:</label>
        <input type="search" name="price-lookup" value="<?php if(isset($_GET['price-lookup'])){echo $_GET['price-lookup'];} ?>"> 
        <label for="quantity">Quantity:</label>
        <input type="search" name="quantity-lookup" value="<?php if(isset($_GET['quantity-lookup'])){echo $_GET['quantity-lookup'];} ?>">  
        <link rel="stylesheet" href="../Collections/Coll2.css">
        <p></p>
        <style>
          .button-51 {
            right:0px;
         }
        </style>
        <input type="submit" name=submit class="button-51" role="button" value="Search" /><br>  
    </form>
    </div>
    
    <link rel="stylesheet" href="../Collections/Coll.css">
    <style>
         .button-56 {
            right:0px;
         }
    </style>
    <nav class="nav-item"><a href="../front.php"><button class="button-56" role="button">Return</button></a></nav>
    <p></p>
  <p></p>
 
  </div>
  </body>
  </html>


  <?php
    mysqli_close($conn);
  ?>