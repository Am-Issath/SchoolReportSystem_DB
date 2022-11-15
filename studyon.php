<?php
// include database connection file
require_once'connection_index.php';
?>
<!DOCTYPE html>
<html lang="en">


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<body>
<div class="container">
<div class="row">
<div class="col-md-12">
<h3><b><FONT size='50px'> ResultS </font></b></h3> <hr />

<div class="table-responsive">
<table id="mytable" class="table table-bordred table-striped">
<thead>
<th>NO.</th>
<th>studentID</th>
<th>sCurrentYear </th>
<th>sGrade </th>
<th>term</th>
</thead>


<tbody>

<?php
$sql =mysqli_query($con, "call show_studyon()");
$cnt=1;
$row=mysqli_num_rows($sql);
if($row>0){
while ($result=mysqli_fetch_array($sql)) {
?>

<tr>
<td><?php echo htmlentities($cnt);?></td>
<td><?php echo htmlentities($result['studentID']);?></td>
<td><?php echo htmlentities($result['sCurrentYear']);?></td>
<td><?php echo htmlentities($result['sGrade']);?></td>
<td><?php echo htmlentities($result['term']);?></td>
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
</table>
</div>
</div>
<a href="admin.php"><button >Back</button></a>
<a href="insert_result.php"><button >Add </button></a><hr />
</div>
</div>
</body>
</html>