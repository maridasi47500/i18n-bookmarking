from flask import Flask, render_template
from yourappdb import query_db, get_db
from flask import g

app = Flask(__name__)
def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()
init_db()

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route("/")
def hello_world():
    user = query_db('select pays.*, pays.name as countryname, stuff.name as nomtruc from pays left outer join truc_pays on truc_pays.pays_id = pays.pays_id left join stuff on stuff.stuff_id = truc_pays.stuff_id')
    the_username = "anonyme"
    one_user = query_db('select * from pays where name = ?',
                [the_username], one=True)
    return render_template("hey.html", users=user, one_user=one_user)
