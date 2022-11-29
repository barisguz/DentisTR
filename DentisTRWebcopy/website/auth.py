from flask import Blueprint, render_template, request,flash

auth = Blueprint('auth', __name__)

# if page is refreshed data is empty so check with an if statement before sending it to backend

@auth.route('/login', methods=['GET', 'POST'])
def login():
    data = request.form
    print(data)
    return render_template("login.html")

@auth.route('/logout')
def logout():
    return "<p>Logout</p>"

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    
    if request.method == 'POST':
        email = request.form.get('email')
        firstName = request.form.get('firstName')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')


# increase specifications
        if password1 != password2:
            flash('Passwords must match', category='error')
        else:
            flash('Account created!', category = 'success')
        
        
    return render_template("sign_up.html")