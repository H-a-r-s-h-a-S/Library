import pandas as pd

from faker import Faker
from json import load
from random import randint
from myconnection import connect_to_mysql
from datetime import timedelta

def get_specifics(total_books):
	books_in_a_rack = 100
	rows = 20
	shelves = books_in_a_rack//rows
	racks = total_books//books_in_a_rack
	return racks, shelves, rows

def fetch_results(query):
	if cnx and cnx.is_connected():
		with cnx.cursor() as cursor:
			cursor.execute(query)
			rows = cursor.fetchall()
			df = pd.DataFrame(rows)
			# columns = cursor.column_names
			return df
	else:
		print('Connection unsuccesful!')

with open('./../config/parameters.json') as file:
	parameters = load(file)

config = {
    "host": "127.0.0.1",
    "user": "root",
    "database": "library",
    "password": parameters['password'] or input('enter password: ')
}

cnx = connect_to_mysql(config, attempts=3)



fake = Faker()

# fake data for donations
# mysql> desc donations;
# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | donor_name | varchar(100) | YES  |     | NULL    |                |
# | isbn       | varchar(13)  | YES  |     | NULL    |                |
# | id         | int          | NO   | PRI | NULL    | auto_increment |
# +------------+--------------+------+-----+---------+----------------+
# 3 rows in set (0.00 sec)

n_donations = parameters['donations']
donations = pd.DataFrame({
	'donor_name': [fake.name() for _ in range(n_donations)],
	'isbn': [fake.isbn10() for _ in range(n_donations)]
	})
donations.to_csv('./../data/donations.csv', index=False)


# fake data for customers
# mysql> desc customers;
# +---------+--------------+------+-----+---------+----------------+
# | Field   | Type         | Null | Key | Default | Extra          |
# +---------+--------------+------+-----+---------+----------------+
# | id      | int          | NO   | MUL | NULL    | auto_increment |
# | name    | varchar(100) | YES  |     | NULL    |                |
# | phone   | varchar(30)  | YES  |     | NULL    |                |
# | email   | varchar(50)  | YES  |     | NULL    |                |
# | plan_id | int          | YES  | MUL | NULL    |                |
# +---------+--------------+------+-----+---------+----------------+
# 5 rows in set (0.00 sec)

n_customers = parameters['customers']
customers = pd.DataFrame({
	'name': [fake.name() for _ in range(n_customers)],
	'phone': [fake.phone_number() for _ in range(n_customers)],
	'email': [fake.email() for _ in range(n_customers)],
	'plan_id': [randint(1,8) for _ in range(n_customers)]
	})
customers.to_csv('./../data/customers.csv', index=False)

# fake data for locations
# mysql> desc locations;
# +----------+------------------------------+------+-----+---------+----------------+
# | Field    | Type                         | Null | Key | Default | Extra          |
# +----------+------------------------------+------+-----+---------+----------------+
# | id       | int                          | NO   | MUL | NULL    | auto_increment |
# | rack_no  | tinyint(2) unsigned zerofill | YES  |     | NULL    |                |
# | shelf_no | tinyint(2) unsigned zerofill | YES  |     | NULL    |                |
# | row_no   | tinyint(2) unsigned zerofill | YES  |     | NULL    |                |
# | book_id  | int                          | YES  | MUL | NULL    |                |
# +----------+------------------------------+------+-----+---------+----------------+
# 5 rows in set (0.00 sec)

# number of locations should always be greater than the number of books available
n_locations = parameters['locations']

racks, shelves, rows = get_specifics(n_locations)

locs = []
for rack in range(1,racks+1):
	for shelf in range(1,shelves+1):
		for row in range(1,rows+1):
			locs.append((rack,shelf,row))

locations = pd.DataFrame(locs)
locations.columns = ['rack_no', 'shelf_no', 'row_no']
locations.to_csv('./../data/locations.csv', index=False)

# fake data for rentals
# mysql> desc rentals;
# +-------------+------+------+-----+---------+----------------+
# | Field       | Type | Null | Key | Default | Extra          |
# +-------------+------+------+-----+---------+----------------+
# | book_id     | int  | YES  | MUL | NULL    |                |
# | customer_id | int  | YES  | MUL | NULL    |                |
# | rental_date | date | YES  |     | NULL    |                |
# | return_date | date | YES  |     | NULL    |                |
# | id          | int  | NO   | PRI | NULL    | auto_increment |
# +-------------+------+------+-----+---------+----------------+
# 5 rows in set (0.01 sec)

n_rentals = parameters['rentals']
max_book_id = fetch_results('select max(id) from books;').iloc[0][0]

rental_dates = []
return_dates = []
for _ in range(n_rentals):
	rental_dates.append(fake.date_between(start_date=parameters['data start'], end_date=parameters['data end']))
	return_dates.append(rental_dates[_] + timedelta(days=(randint(1,15))))

rentals = pd.DataFrame({
	'book_id': [randint(1,max_book_id) for _ in range(n_rentals)],
	'customer_id': [randint(1,n_customers) for _ in range(n_rentals)],
	'rental_date': list(rental_dates),
	'return_date': return_dates
	})

rentals.to_csv('./../data/rentals.csv', index=False)

