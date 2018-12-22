module ContactManager where
import Contact

class ContactManger a where
    createContact :: a [Contact] -> [Contact]

