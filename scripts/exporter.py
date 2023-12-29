import pandas as pd

from myconnection import connect_to_mysql
from json import load

with open('./../config/parameters.json') as file:
	parameters = load(file)

print('user: root')

config = {
    "host": "127.0.0.1",
    "user": "root",
    "database": "library",
    "password": parameters['password'] or input('enter password: ')
}

# connect to database
cnx = connect_to_mysql(config, attempts=3)

# get table/view name
table = input('Enter table/view name: ')

# required records
query = f'select distinct * from `library`.`{table}` ;'

# export path
path = f'./../exports/{table}.csv'

# runs the query and stores results in df
if cnx and cnx.is_connected():
	with cnx.cursor() as cursor:
		cursor.execute(query)
		rows = cursor.fetchall()

		columns = cursor.column_names
		df = pd.DataFrame(rows)
		df.to_csv(path, index=False, header=[*columns])
		print(f'{table} exported to {path} successfully!')

else:
	print('Connection unsuccesful!!')