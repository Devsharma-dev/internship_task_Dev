import mysql.connector as ms
con=ms.connect(host='localhost',user='root',password='Devkhopra17',database='News')
cr=con.cursor()



def add_news():
    Title=input("Enter News Title:-")
    Details=input("\nEnter News Details:-")
    query= "INSERT INTO news (Title, Details) VALUES (%s, %s)"
    value=(Title,Details)
    cr.execute(query,value)
    con.commit()
    rec=cr.fetchall()
    for x in rec:
        print("\tTitle\t",x[0])
        print("\tDetails\t",x[1])
    print("\n NEWS ADDED SUCCESFULLY!!\t")    
    

def List_News():
    sql="select * from news"
    cr.execute(sql)
    rec=cr.fetchall()
    for x in rec:
        print("\nTitle:-",x[0])
        print("\nDetails:-",x[1])

def options():
    while True:
        print("PLEASE CHOICE THE OPTIONS YOU WANT TO PERFORM")
        print("1.ADD NEWS")
        print("2.LIST NEWS ")
        print("3. EXIT ")
        CHOISE=int(input("Enter the choice you want to perform the task"))
        if CHOISE==1:
            add_news()
        elif CHOISE==2:
            List_News()
        elif CHOISE==3:
            break
options()