<?php include('header.php') ?>


<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/main.css" />

    <title>To-Let.com</title>
</head>




<body >
		
		
		<div id = "postad_main_div">
		
			<div class = "container"  >
                
                <div class="row">
					<div class="col-md-12" >
						post your add here	(page headline)
					</div>
					
				</div>
				<div class="row" >
					
					<div class="col-md-6" >
                        <div id = "image_uploader">
                        
                            put the image uploader here with preview
                        
					
                    
                        </div>
                        
					
                    
                    </div>
					<div class="col-md-6" >
                        
                        <div id = "property_information_form">
                            
                            
                            edit the form according to your need
                        
                           <form action = "" method = "post" >


                            <label for="Name">name</label><br>
                          <input id="name"  name = "name"  type="text" placeholder="Enter your Name" required>



                         <label for="phonenumber">Mobile number</label><br>
                          <input id="name"  name = "mobilenumber"  type="text" placeholder="017******" required>


                        <label for="email">E-mail</label><br>
                        <input id="email" name = "email"  type="text" placeholder="example@hotmail.com" required>


                        <label for="password">Password</label><br>
                        <input id="password" name = "userpassword" type="password" placeholder="*****" pattern=".{3,10}" title="Password should be between 3 and 10 characters.">

                         <label for="password">Repeat password</label><br>
                        <input id="password" type="password" placeholder="*****" pattern=".{3,10}" title="Password should be between 3 and 10 characters.">




                        <div>
                            <input type = "submit" class="signup" name = "submit"/> 

                        </div>
                            
                            </form>
					
                    
                        </div>
                        
                        
                        
					
                    
                    </div>
				
			</div>
                
                
				
			</div>
				
			
		
			
		</div>
		
		
		
<?php include('footer.php') ?>
		
		
	



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</body>
</html>