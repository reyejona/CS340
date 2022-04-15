# Frank's Fantasic Furniture
Frank's Fantastic Furniture is a fully functioning furniture store where users can shop for items populated from a database. The database is pre-populated with sample data.

## Specifications
- Custom online storefront implemented with Python-Flask, HTML, and CSS

- Constructed functional SQL/MariaDB as the database back-end


## Requirements
- Make sure to download and start ‘MySQL Server’ (https://dev.mysql.com/downloads/mysql/)

## Setup
- Open terminal and type ``` cd /Users/<username>/Documents ``` (or wherever else you want to save the project)
- Then, type ``` git clone https://github.com/atavakoulnia/franks-fantastic-furniture ``` to clone the project into that folder
- Open the cs340-database-project folder in VScode
- Click the “.gitignore” file and delete the text ‘.env’ then save the file
- Make a new file called “.env” and copy and paste this… then save the file
```
340DBHOST=localhost

340DBUSER=root
  
340DBPW=<The password you set for MySQL when you downloaded it (in system preferences)>
  
340DB=CS340DB
```
- Now open the “.gitignore” file again and add back the text ‘.env’ then save and close the file
- Open a new terminal in VScode and make sure you are in the root project directory
- Run ``` pip3 install virtualenv ``` to install the virtual environment
- Then run ``` python3 -m venv ./venv ```
- Now, activate the virtual environment by running ``` source ./venv/bin/activate ```
- Run ``` pip3 install -r requirements.txt ``` to install the packages required to run the project
- Run ``` source ./venv/bin/activate ``` again to activate the virtual environment
- Finally, run ``` python3 app.py ``` and boom it should work! 

After this, the only thing you have to remember to do every time before coding is to activate the virtual environment and start the MySQL server. 

## If the database is empty…
- Open terminal in VScode and navigate to the database folder directory
- Run ``` mysql -u root -p ```
- Might have to type in the password you used to in step 5 from above
- Run ``` USE CS340DB ```
- Run ``` source [path-to-database.sql] ```
- If you want to check if the database was added, run ``` SHOW TABLES; ``` to see tables
- When you’re done run “quit”

## Useful commands:
```
source ./venv/bin/activate (Activates Virtual Environment)

python3 app.py (Runs Program)

mysql -u root -p (Root folder of mysql)

SET FOREIGN_KEY_CHECKS=0; (Resets locked values in database)
```

## Website Demonstrations 

### Homepage

![Homepage](https://github.com/atavakoulnia/franks-fantastic-furniture/blob/main/static/img/homepage-demo.gif)
