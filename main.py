import pymysql


def mysqlconnect():
    # To connect MySQL database. Change the database name as per requirement

    conn = pymysql.connect(

        host='localhost',

        user='root',

        password="root",

        db='cinema',

    )



    cur = conn.cursor()

    cur.execute("select * from test")

    output = cur.fetchall()

    print(output)

    # To close the connection

    conn.close()


# Driver Code

if __name__ == "__main__":
    mysqlconnect()
