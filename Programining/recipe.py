recipe = [
    {'name':"phoa",'ingredient':['phoa','oil','spicies','vegies'],'type':'Lunch'},
    {'name':"Dal roti",'ingredient':['pulse','spicies','oil','flour'],'type':'Breakfast'},
    {'name':"sabji roti",'ingredient':['vegitable','oil','spicies','flour'],'type':'Dinner'}

]

def search_recipe_by_ingredient():
    ingredient = input("Enter Your ingredient by , seprating:-").lower().split(",")
    for i in recipe:
        if all(items in i['ingredient'] for items in ingredient):
            print(i)
     
    
def filter_by_type():
    Type = input("Which Type Food Do You Want To Eat").capitalize()
    for i in recipe:
        if all(items in i['type'] for items in Type):
            print(i)


def main():
    while True:
        
        print("1. search_recipe_by_ingredient")
        print("2. filter_by_type")
        print("3. Exit!!")
        
        choice = int(input("Enter choice"))

        if choice == 1:
            print("search_recipe_by_ingredient")
            search_recipe_by_ingredient()
        elif choice == 2:
            print("filter_by_type")
            filter_by_type()
        elif choice == 3:
            print("Exit the game")
            break
        else:
            print("Invalide syntax Please Try Again Later")
main()

            