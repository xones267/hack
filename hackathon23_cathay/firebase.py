import firebase_admin
from firebase_admin import credentials, firestore
import pandas as pd
# Replace 'path/to/your/credentials.json' with the path to your downloaded JSON file.
cred = credentials.Certificate('path/to/your/credentials.json')
firebase_admin.initialize_app(cred)

# Initialize Firestore
db = firestore.client()

# Example: Add data to Firestore
data = pd.reasd_csv('data.csv')
# Add a new document with a generated ID
doc_ref = db.collection('users').add(data)
print(f'Document added with ID: {doc_ref.id}')

# Example: Read data from Firestore
users_ref = db.collection('users')
docs = users_ref.get()

for doc in docs:
    print(f'{doc.id} => {doc.to_dict()}')
