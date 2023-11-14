import pymysql
import tkinter as tk
from tkinter import simpledialog

class Flight:
    def __init__(self,departureTime,arrivalTime,ticketPrice,flightID,email,password,userType,membertype,membershipStart,membershipEnd):
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.ticketPrice = ticketPrice
        self.flightID = flightID
        self.email = email
        self.password = password
        self.userType = userType
        self.memberType = membertype
        self.membershipStart = membershipStart
        self.membershipEnd = membershipEnd


class Customer:
    def __init__(self, customerID, firstName, lastName, email, password, userType, memberType,
                 membershipStartDate, membershipEndDate):
        self.customerID = customerID
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.userType = userType
        self.memberType = memberType
        self.membershipStartDate = membershipStartDate
        self.membershipEndDate = membershipEndDate

class Booking:
    def __init__(self, bookingID,flight,customer,numTickets,bookingDate,totalAmount):
        self.bookingID = bookingID
        self.flight = flight
        self.customer = customer
        self.numTickets = numTickets
        self.bookingDate = bookingDate
        self.totalAmount = totalAmount

class Discount:
    def __init__(self,discountID,discountType,discountPercentage):
        self.discountID = discountID
        self.discountType = discountType
        self.discountPercentage = discountPercentage



def mysqlconnect():

    global conn,cur
    conn = pymysql.connect(

    host='localhost',

    user='root',

    password='root',

    db='pythonproject',
    port=8889

    )



    cur = conn.cursor()


    # To close the connection



def close_database_connection():
    # Fermer le curseur et la connexion à la base de données
    cur.close()
    conn.close()






def verif_account():
    cur = conn.cursor()

    # Utilisez une requête paramétrée pour éviter les problèmes de sécurité
    cur.execute("SELECT * FROM Customer WHERE email = %s AND password = %s", (email, password))

    # fetchall() récupère toutes les lignes correspondantes
    res = cur.fetchall()

    if res:
        # Si des résultats sont renvoyés, le compte existe
        print("Le compte existe.")
        for row in res:
            customer_id = row[0]
            print("CustomerID:", customer_id)
        return True, customer_id
    else:
        # Si aucun résultat n'est renvoyé, le compte n'existe pas
        print("Le compte n'existe pas.")
        return False, None






def get_user_input():
    global email, password
    email = entry_email.get()
    password = entry_password.get()
    verif_account()





if __name__ == "__main__":

    mysqlconnect()

    window = tk.Tk()
    window.title("Saisie d'informations")

    # Créer les libellés et les champs de saisie
    label_email = tk.Label(window, text="Email:")
    label_email.pack(pady=5)
    entry_email = tk.Entry(window)
    entry_email.pack(pady=5)

    label_password = tk.Label(window, text="Mot de passe:")
    label_password.pack(pady=5)
    entry_password = tk.Entry(window, show="*")  # Le mode show="*" masque le mot de passe
    entry_password.pack(pady=5)

    # Créer le bouton de soumission
    submit_button = tk.Button(window, text="Soumettre", command=get_user_input)
    submit_button.pack(pady=10)

    # Créer une étiquette pour afficher le résultat
    result_label = tk.Label
    window.mainloop()
    close_database_connection()
