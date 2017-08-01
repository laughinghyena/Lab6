import _mysql #needed to use MySQL

run = True # for the menu loop below

def limit(whichColumn = ''):  # adds in the where clause for getWantList and getTotalPrice only 
	#whichColumn is to store the alias for the Want table in getWantList() to prevent an ambiguity error from arising.
	what = '' # to hold the comparison part
	while(True):
		choice = input("Do you want\n 1. All Games\n 2. Released Games\n 3. Unreleased Games\n included. Enter Number: ")
		if(choice == 1):
			what = '< 8 or ' # to get all games as lowest number is 7 for Do not want
			break;
		elif(choice == 2): 
			what = '!=' # gets all released games as 6 is for Not Released Yet
			break;
		elif(choice == 3):
			what = '=' # gets all unreleased games as 6 is for Not Released Yet
			break;
		else:
			print("Invalid Input. Try Again. Your Choice was " + str(choice))
	
	where = 'Where ' + whichColumn + 'wantLevel ' + what + ' 6' 
	return where
	
def way(): # to specify ascending or descending order
	order = ['ASC', 'DESC']
	orderWay = ''
	
	while(True): # to enable retry for miss enter
		response = input('Which way\n 1. Ascending\n 2. Descending\n Enter Number: ')
		
		if(response == 1):
			orderWay = order[response - 1]
			#print("Order way is : " + orderWay)
			break;
		elif(response == 2):
			orderWay = order[response - 1]
			#print("Order way is : " + orderWay)
			break;	
		else:
			print("Invalid Input. Try Again. Your Choice was " + str(response))
		
	return orderWay
		
def sort(value, choose, multiSort = False): # value, a list of possible values to sort by  
	# choose is the option chosen in the call function
	# multiSort to enable a sort like Order BY ConsoleName, GameName
	
	if(multiSort): #Not implemented 	
		addedSorted = ''
	else:
		addedSorted = 'Order BY ' + value[choose] + ' ' + way() +';' # the sort statement
		
	return addedSorted
	
def listVideogames():
	db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames")
	
	answer = raw_input("Do you want to sort? y/n: ") # works with String as input() does not
	
	if(answer == 'y'):
		
		sortBy = ';' 
		value = ['GameName', 'Genre']
		
		while(True): # to enable retry for miss enter
			choose = input("""Choose an option\n 1. Game Name\n 2. Genre\n Enter Number: """) 
			if(choose == 1):
				sortBy = sort(value, choose - 1) # minus 1 for list's first value is at zero index
				break;
			elif(choose == 2):
				sortBy = sort(value, choose - 1)
				break;
			else:
				print("Invalid Input. Try Again. Your Choice was " + str(choose))
		
		query = """Select GameName, Genre, Description From Videogames """ + sortBy
		#print(query)
	else:
		query = """Select GameName, Genre, Description From Videogames;"""
		
	db.query(query)
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def listConsoles():
	db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames") # connects to Videogames allowing access
	
	answer = raw_input("Do you want to sort? y/n: ") # works with String as input() does not
	
	if(answer == 'y'):
		
		sortBy = ';'
		value = ['ConsoleName', 'ReleaseYear']
		
		while(True): # to enable retry for miss enter
			choose = input("""Choose an option\n 1. Console Name\n 2. Release Year\n Enter Number: """)
			if(choose == 1):
				sortBy = sort(value, choose - 1) # minus 1 for list's first value is at zero index
				break;
			elif(choose == 2):
				sortBy = sort(value, choose - 1)
				break;
			else:
				print("Invalid Input. Try Again. Your Choice was " + str(choose))
		
		query = """Select ConsoleName, ReleaseYear, Generation, Notes From Console """ + sortBy
		#print(query)
	else:
		query = """Select ConsoleName, ReleaseYear, Generation, Notes From Console;"""
	
	db.query(query) # query the database
	r = db.store_result()
	nR = r.num_rows() # the number of rows
	while(nR > 0): # cycles through
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def getLibrary():
	db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames")
	
	answer = raw_input("Do you want to sort? y/n: ") # works with String as input() does not
	
	if(answer == 'y'):
		
		sortBy = ';'
		value = ['v.GameName', 'c.ConsoleName', 'v.Genre']
		
		while(True): # to enable retry for miss enter
			choose = input("""Choose an option\n 1. Game Name\n 2. Console Name\n 3. Genre\n Enter Number: """)
			if(choose == 1):
				sortBy = sort(value, choose - 1) # minus 1 for list's first value is at zero index
				break;
			elif(choose == 2):
				sortBy = sort(value, choose - 1)
				break;
			elif(choose == 3):
				sortBy = sort(value, choose - 1)
				break;
			else:
				print("Invalid Input. Try Again. Your Choice was " + str(choose))
		
		query = """Select GameName,ConsoleName,Genre, Remark 
					From Videogames as v join Library as l
						on v.gameID = l.gameID
							join Console as c
								on c.consoleID = l.consoleID """ + sortBy
		#print(query)
	else:
		query = """Select GameName,ConsoleName, Genre, Remark
					From Videogames as v join Library as l
						on v.gameID = l.gameID
							join Console as c
								on c.consoleID = l.consoleID;"""
		#print(query)
		
	db.query(query)
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()


def getWantList():
	db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames")
	
	answer = raw_input("Do you want to sort? y/n: ") # works with String as input() does not
	
	if(answer == 'y'):
		
		sortBy = ';'
		value = ['v.GameName', 'c.ConsoleName', 'v.Genre', 'wL.WantLevel', 'p.price']
		
		while(True): # to enable retry for miss enter
			choose = input("""Choose an option\n 1. Game Name\n 2. Console Name\n 3. Genre\n 4. Want Level\n 5. Price\n Enter Number: """)
			if(choose == 1):
				sortBy = sort(value, choose - 1) # minus 1 for list's first value is at zero index
				break;
			elif(choose == 2):
				sortBy = sort(value, choose - 1)
				break;
			elif(choose == 3):
				sortBy = sort(value, choose - 1)
				break;
			elif(choose == 4):
				sortBy = sort(value, choose - 1)
				break;
			elif(choose == 5):
				sortBy = sort(value, choose - 1)
				break;
			else:
				print("Invalid Input. Try Again. Your Choice was " + str(choose))
		
		query = """Select GameName,ConsoleName, Genre, Remark, WantDescription, Price
					From Videogames as v join Want as w
						on v.gameID = w.gameID
							join console as c
								on c.consoleID = w.consoleID
									join wantLevel as wL
										on wL.WantLevel = w.WantLevel
											join Price as p
												on p.priceID = w.priceID """ + limit('w.') + ' ' + sortBy
		#print(query)
	else:
		query = """Select GameName,ConsoleName, Genre, Remark, WantDescription, Price
					From Videogames as v join Want as w
						on v.gameID = w.gameID
							join console as c
								on c.consoleID = w.consoleID
									join wantLevel as wL
										on wL.WantLevel = w.WantLevel
											join Price as p
												on p.priceID = w.priceID """ + limit('w.') + ';'
		#print(query)
	
	#The call to limit() in the query is to get the where clause. The 'w.' is to pass on the alias of the Want table.
	db.query(query)
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()


def getTotalPrice(): #For Want
	db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames") 
	
	db.query("""Select Sum(Price) as TotalPrice from Price as p 
				join Want as w
					on p.priceID = w.priceID """ + limit() + ';') # added join, removed odd results. Results are as expected now.
	# The call to limit() in the query is to add the where clause.
	
	r = db.store_result()
	totalPrice = r.fetch_row()
	totalPrice = totalPrice[0]
	
	print("Total Price: ")
	print(totalPrice)
	db.close()

#def getWantLevel(): # for testing limit()
	#db =_mysql.connect(host="localhost", user="root", passwd="cookie", db="Videogames")
	
	#db.query("""Select * from WantLevel """ + limit() + ";") # query the database
	#r = db.store_result()
	#nR = r.num_rows() # the number of rows
	#while(nR > 0): # cycles through
		#print(r.fetch_row())
		#nR = nR - 1
	#db.close()
	
while run: #Menu loop
	options = ['0. Exit\n', '1. Videogames List\n', '2. Console list\n', '3. Library\n', '4. Want List\n', '5. Total Price of Want List\n']
	
	print("\n") # so that the options are clearer by letting 0.Exit be not directly under the results 
	
	for o in options:
		print(o)
	option = input("Enter Choice: ")
	
	if(option == 0):
		run = False
		print("Good Bye")
	elif(option == 1):
		listVideogames()
	elif(option == 2):
		listConsoles()
	elif(option == 3):
		getLibrary()
	elif(option == 4):
		getWantList()
	elif(option == 5):
		getTotalPrice()
	#elif(option == 6):
		#getWantLevel()
	else:
		print("Invalid Input. Try Again. Your Choice was " + str(option))