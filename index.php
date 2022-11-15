<?php
// include database connection file
require_once'connection_index.php';
?>
<!DOCTYPE html>
<html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


<?php
if(isset($_POST['login']))
{
// Posted Values  
$s_l_id=$_POST['id'];
$pass=$_POST['p'];
// Call the store procedure for insertion
$sql=mysqli_query($con,"call login('$s_l_id','$pass')");
$row=mysqli_num_rows($sql);
if($row==1)
{
// Message for successfull insertion
echo "<script>alert('login successfull');</script>";
echo "<script>window.location.href='admin.php'</script>"; 
}
else 
{
// Message for unsuccessfull insertion
echo "<script>alert('log in unsuccesfull');</script>";
echo "<script>window.location.href='login.php'</script>"; 
}
}
?>

<!DOCTYPE html>
<html lang="en">




<body>





<hr />


<h3 style="color:red;"><b><FONT size='12px'>      School    Report    System  </font></b></h3>
<hr />
<hr />
<?php
echo "<img src='R.jpg' >"
?> 

<h4> <b>Login as Admin :</b></h4>





<div class="container">
<div class="row">
<div class="col-md-12">

</div>
</div>

<form name="insertrecord" method="post">
<div class="row">
<div class="col-md-4"><b>Staff Login ID</b>
<input type="text" name="id" class="form-control" required>
</div>
</div> 
<div class="row">
<div class="col-md-4"><b>Password</b>
<input type="text" name="p" class="form-control" required>
</div> 
</div> 

<div class="row" style="margin-top:1%">
<div class="col-md-8">
<input type="submit" name="login" value="Submit">
</div>
</div> 
</form>
     
</div>
</div>

     
</div>
</div>
























<hr />

<h3> <b><u>Results</u></b></h3> 
<div class="table-responsive">
<table id="mytable" class="table table-bordred table-striped">

<thead>
<th>NO.</th>
<th>serialNo </th>
<th>studentID </th>
<th>subjectID </th>
<th>mark</th>
</thead>


<tbody>

<?php
$sql =mysqli_query($con, "call show_result()");
$cnt=1;
$row=mysqli_num_rows($sql);
if($row>0){
while ($result=mysqli_fetch_array($sql)) {
?>

<tr>
<td><?php echo htmlentities($cnt);?></td>
<td><?php echo htmlentities($result['serialNo']);?></td>
<td><?php echo htmlentities($result['studentID']);?></td>
<td><?php echo htmlentities($result['subjectID']);?></td>
<td><?php echo htmlentities($result['mark']);?></td>
</tr>

<?php 
// for serial number increment
$cnt++;
} } else { ?> 
<tr> 
<td colspan="9" style="color:red; font-weight:bold;text-align:center;"> No Record found</td>
</tr>
<?php } ?>

</tbody> 

</body>
</html>