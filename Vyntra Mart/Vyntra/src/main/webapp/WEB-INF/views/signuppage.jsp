<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="iconstyle.css">
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
            height: 125px;
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
/*          margin-left: 30%*/ /*for login page*/
            justify-content: center;
}
        
 
        .myapplication{
            padding: 5px;
            background-color: rgba(0,0,0,0.7);
            width: 400px;
            height: 450px;
            margin-left: 35%;
            border-radius: 50px;;
            margin-top: 70px;
            
            
        }
        .app{
            padding: 10px;
            width: 200px;
            border-radius: 5px;
            color: whitesmoke;
            font-weight: 50px;
        }
    </style>
    <body>
        <nav>
          <a href="#home" class="active">Home</a>
          <a href="#home" >About</a>
          <a href="#home">Contact</a>
          <a href="#home">Help</a>
          
        </nav>
        
        <div class="main myapplication">
            <form method="post" action="#">
                <span class="app">Name</span><br>
                <input class="app" required type="text"><br>
                <span class="app">Email-id</span><br>
                <input class="app" required type="text"><br>
                <span class="app">Mobile Number</span><br>
                <input class="app" required type="text"><br>
                <span class="app">Create password</span><br>
                <input class="app" required type="password"><br>
                <span class="app">Confirm password</span><br>
                <input class="app" required type="password"><br><br>
                <input class="app" style="color: black;font-weight: 
                                          " type="submit" value="Submit">
            </form>
            
        </div>
    </body>
</html>