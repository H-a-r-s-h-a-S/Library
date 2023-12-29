from os import system as cmd
from json import load
from time import time

start = time()

with open('./../config/parameters.json') as file:
	parameters = load(file)

print('\nuser: root')
password = parameters['password'] or input('Enter password: ')
cmd('clear')

print('\ncreating backup of real data...')
cmd('cp ./../data/data.csv ./../data/data_bkp.csv')

print('\ncreating database...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < schema.sql')

print('\ncreating routines...')
print('\tcreating stored procedures...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "stored procedures.sql"')

print('\tcreating functions...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "functions.sql"')

# uncomment to create triggers
# print('\ncreating triggers...')
# cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < triggers.sql')

print('\ncreating views...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "views.sql"')

print('\ncreating users...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "users.sql"')

print('\nloading data...')
print('\tloading real data...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "real data.sql"')

print('\tloading static data...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "static data.sql"')

print('\tloading fake data...')
print('\t\tcreating fake data...')
cmd('python "fake data.py"')

print('\t\tloading fake data...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "fake data.sql"')

print('\ncleaning data...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "clean.sql"')

print('\nrunning checks...')
cmd(f'MYSQL_PWD={password} mysql --local-infile=1 -u root < "checks.sql"')

print('\ndumping the database...')
cmd('python "db dumper.py"')

end = time()

print("\nlibrary database created and dumped in: %.4fs"%(end-start))
