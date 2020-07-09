<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="iconstyle.css">
     <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <style>
    
    
    
       @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@500&display=swap');
        .vyntra{
            font-family: 'Dosis', sans-serif;
            font-size: 100px;
            margin-left: -40%;
                padding-top: 20px;
            margin-top: 60%;
            
        }
        
        .colour{
            width: 200px;
            height: 140px;
            display: flex;
            margin-left: 40;
            margin-top: 100px;
/*            background-color: #00e6e6;*/
            background-color: #00e6e6;
            padding-bottom: 25px;
            align-items: center;
          justify-content: center;
          flex-direction: column;
             border-radius: 5px;
        }
/*
        hr{
            width: 30%;
        }
*/
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap');
        body {
          background-color: #eee;
          margin: 0;
          font-family: Open Sans;
        }
        nav {
          display: flex;
          height: 80px;
          background-color: white;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        nav a {
          flex: 1;
          text-decoration: none;
          display: flex;
            margin-left: 30px;
    margin-right: 30px;
          justify-content: center;
          align-items: center;
          font-size: 1.2rem;
          color: black; 
          transition: all 0.2s;
        }

        nav a:hover{
          background: #2196F3;
          color: white;
          
        }
        .but {
            width: 150px;
            height: 50px;
             background: #e7e7e7;
            font-size: 20px;
            font-family: 'Dosis', sans-serif;
        }
.but:hover{
   color: white;
    background-color: #00e6e6;
    font-family: Open Sans;
}
        .active {
          border-bottom: 5px solid #2196F3;
          padding-top: 10px;
        }

        .main {
          display: flex;
          margin-left: 30%;

}
        
 
        .forms{
            background-color: rgba(0,0,0,0.75);
            width: 320px;
            height: 350px;
            
            margin-left: 900px;
            margin-top: -150%;
            padding-top: 10px;
            padding-left: 20px;

            border-radius: 15px;
            font-family: 'Ubuntu', sans-serif;  
        }
        
        .aa input[type="text"]{
            width: 280px;
            height:35px;
            border-radius: 50px;
            padding-left:  10px;
    
        } 
        .aa input[type="password"]{
            width: 280px;
            height:35px;
            border-radius: 50px;
            padding-left:  10px;
        }      
        .aa input[type="submit"]{
            width: 80px;
            height:35px;
            border-radius: 5px;
            align-content: center;
            font-family: 'Ubuntu', sans-serif;

        }    
        .aa label{
            font-size: 20px;
            font-family: cursive;
        }
        .aa{
            padding-top: 10px;
        }
	        .Login{
	            font-family: 'Ubuntu', sans-serif;
	            font-size: 30px;
	            font-weight: 50;
	            color: whitesmoke;
	        }
        .Text{
            padding-left: 5px;
            font-size: 20px;
            font-weight: 50;
            color: whitesmoke;
        }
        .fa{
            padding-top: 5px;
            border-radius: 5px;
            
        }
        .col {
            width: 50%;
            margin: auto;
            padding: 0 50px;
            margin-top: 6px;
        }
        .fb {
            background-color: #3B5998;
            color: white;
        }
        .btn {
            width: 280px;
            height:3px;
            padding-top: 5px;
            padding-left:  10px;
            border-radius: 4px;
            padding-bottom: 30px;
            margin: 5px 0;
            opacity: 0.85;
            display: inline-block;  
            font-size: 17px;
            line-height: 20px;
        }
    </style>
    <body>
        <nav>
          <a href="#home" >Home</a>
          <a href="#home" >About</a>
          
          <a href="#home">Help</a>
          <a href="loginpage" class="active">Signup/Login</a>
          
        </nav>
        
        <div class="main">
            <div class="colour"><p class="vyntra" style="margin-top: 60%;">Vyntra</p>
                <div class="forms">
            <span class="Login" >Login</span><br><br>
            <span class="Text" >Email</span>
            <form class="aa" method="post" action="login_to_myaccount">
                   
                    <input type="text"  id="name" name="login_id"  required><br><br>
                     <span class="Text" >Password</span>
                    <input type="password" id="password" name="password"  required><br><br>
                    <input style="margin-left: 95px;" type="submit"  placeholder="Enter the username" value="Login"><br>
                <br>
                <a href="signuppage" style="color: dodgerblue">Create a new Account..</a>
                    <a href="#" class="fb btn">
                        <i class="fa fa-facebook fa-fw"></i> Login with Facebook
         </a>
            </form>
        </div>
            </div>
            
        </div>
    </body>
</html>