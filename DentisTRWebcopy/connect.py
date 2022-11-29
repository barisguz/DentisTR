from flask import Flask, render_template, request

from flaskext.mysql import MySQL


app = Flask(__name__)
    
mysql = MySQL()
    

    
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='password'
app.config['MYSQL_DB'] = 'DentisTR'
    
    
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        details = request.form
        firstName = details['fname']
        lastName = details['lname']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO TEST(firstName, lastName) VALUES (%s, %s)", (firstName, lastName))
        mysql.connection.commit()
        cur.close()
        print("success")
    return render_template('index.html')


if __name__ == '__main__':
       app.run()