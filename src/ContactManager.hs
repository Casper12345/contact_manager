module ContactManager where
import Contact

class ContactManager where
    createContact :: a [Contact] -> [Contact]
    getContact :: Int -> Contact

