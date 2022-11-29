from website import create_app

app = create_app()


# to run the website as a whole and intiation

if __name__ == '__main__':
    app.run(debug=True)

