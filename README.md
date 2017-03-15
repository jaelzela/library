# Library Web Application

It is a Basic Library System which has the following features:

- Restricted access only for users (login/logout).
- User registration (signup).
- List all available books with pagination (main page).
- Filters by author or publication year.
- Search by title or author name.
- Add new books.
- Delete books.
- Edit Books.

## Environment
This application was developed in the following environment:

		Python (2.7.6)
		Django (1.9.2)
		MySQL-python (1.2.5)
		MariaDB (10.0.20)

## Database
The database is composed by three tables:

| Book |					
|---|
| id |
| title |
| description |
| publication_year |
| edition |
| copies |
| cover_image |

| Author |
|---|
| id |
| name |

| Book_Authors |
|---|
| id |
| book_id |
| author_id |

A copy of the database dump is [here](https://github.com/jzelar/library/blob/master/library_db.sql)

## Installation
In order to setup the Web Application in dev mode. Firstly, you need to clone the project from the repository. Secondly, you need to setup your **Python** environment (version according the specification above). Thirdly, install **Django** and the mysql connector **MySQL-python**; you can install the package using:
		
	$ pip install -r requirements.txt
		
The file [*requirements.txt*](https://github.com/jzelar/library/blob/master/requirements.txt) is in the project. Fourthly, you need to install **MariaDB**, then create a new database for the application  (don't forget setup the user, password and database name in the [*settings.py*](https://github.com/jzelar/library/blob/master/library/settings.py) fileof the project). Finally, to run the web application in dev mode, execute:

	$ python manage.py runserve
	
And access to the application from your browser in the url: http://localhost:8000/

