from flask_frozen import Freezer
from main import app   # 👈 change "app" to your main Flask file name

freezer = Freezer(app)

if __name__ == "__main__":
    freezer.freeze()