import mysql.connector as ms
con=ms.connect(host='localhost',user='root',password='Devkhopra17',database='todo')
cr=con.cursor()

def Add_Task():
    Title = input("Please Enter Your Title !!")
    Staturs = input("Please Enter Your Staturs !!")
    query = "INSERT INTO Tasks(Title,Staturs) VALUES(%s,%s)"
    VALUES = (Title,Staturs)
    cr.execute(query,VALUES)
    con.commit()
    rec=cr.fetchall()
    for x in rec:
        print("\tTitle\t",x[0])
        print("\tStaturs\t",x[1])
    print("\n Task Added Succesfully !!")


def Update_Task():
    ID = int(input("Please Enter Your ID Do You Want To Update The Task"))
    New_Title = input("Please Enter Your Title Do You Want To Update The Task !!")
    New_Staturs = input("Please Enter Your Staturs Do You Want To Update The Task !!")
    query = "UPDATE Tasks SET Title = %s , Staturs = %s WHERE ID = %s"
    VALUES = (New_Title,New_Staturs,ID)
    cr.execute(query,VALUES)
    con.commit()
    rec=cr.fetchall()
    for x in rec:
        print("\tNew_Title\t",x[0])
        print("\tNew_Staturs\t",x[1])
        print("\tID\t",x[2])
    print("\n UPDATE New_Task Added Succesfully !!")


def Remove_Task():
    ID=int(input("Enter the ID you want to remove in the task in  details:-"))
    sql="delete from Tasks where ID={}".format(ID)  
    cr.execute(sql)
    if cr.rowcount > 0:
        con.commit() 
        print(f"Successfully data of Task id {ID} Removed")
    else:
         print("Task ID not found in our record")



def list_task():
    sql = "SELECT * FROM Tasks"
    cr.execute(sql)
    for x in cr:
        print("\n")
        print("!! SHOW THE ALL TASKS !!")
        print("\tID\t",x[0])
        print("\tTitle\t",x[1])
        print("\tStaturs\t",x[2])
        print("\tCreated\t",x[3])
        print("\tUpdate_at\t",x[4])
        print("\n")

        

def options():
    while True:
        print("PLEASE CHOICE THE OPTIONS YOU WANT TO PERFORM")
        print("1.ADD TASK")
        print("2.UPDATE TASK ")
        print("3.REMOVE TASK")
        print("4.LIST TASK")
        print("5. EXIT ")
        CHOISE=int(input("Enter the choice you want to perform the task"))
        if CHOISE==1:
            Add_Task()
        elif CHOISE==2:
            Update_Task()
        elif CHOISE==3:
            Remove_Task()
        elif CHOISE==4:
            list_task()
        elif CHOISE==5:
            print("!! EXIT !!")
            break
options()