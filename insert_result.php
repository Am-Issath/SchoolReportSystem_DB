

<?php
// include database connection file
require_once'connection_index.php';
if(isset($_POST['insert']))
{
// Posted Values  
$l_no=$_POST['no'];
$l_sid=$_POST['sid'];
$l_suid=$_POST['suid'];
$l_ma=$_POST['ma'];


// Call the store procedure for insertion
$sql=mysqli_query($con,"call insert_result('$l_no','$l_sid','$l_suid','$l_ma')");
if($sql)
{
// Message for successfull insertion
echo "<script>alert('Record inserted successfully');</script>";
echo "<script>window.location.href='Result.php'</script>"; 
}
else 
{
// Message for unsuccessfull insertion
echo "<script>alert('Something went wrong. Please try again');</script>";
echo "<script>window.location.href='Result.php'</script>"; 
}
}
?>



<!DOCTYPE html>
<html lang="en">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

<body>
    
<div class="container">
<div class="row">
<div class="col-md-12">
<h3> Details</h3><hr />
<a href="Result.php"><button >Back</button></a>
<hr />
</div>
</div>

<form name="insertrecord" method="post">
<div class="row">
<div class="col-md-4"><b>serialNo </b>
<input type="text" name="no" class="form-control" required>
</div>
<div class="col-md-4"><b>studentID</b>
<input type="text" name="sid" class="form-control" required>
</div>
<div class="col-md-4"><b>subjectID</b>
<input type="text" name="suid" class="form-control" required>
</div>
<div class="col-md-4"><b>mark</b>
<input type="text" name="ma" class="form-control" required>
</div>
</div>  

<div class="row" style="margin-top:1%">
<div class="col-md-8">
<input type="submit" name="insert" value="Submit">
</div>
</div> 
</form>
     
</div>
</div>
</body>
</html>