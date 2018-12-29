module Main where
import Contact
import ContactManager

main :: IO ()
main = do
  let c = Contact 23 "David" "notes"
  let c1 = Contact 24 "John" "notes"
  let c2 = Contact 25 "Peter" "notes"
  let c3 = Contact 26 "Eric" "notes"
  let contacts = addContact c []
  let contacts2 = addContact c1 contacts
  let contacts3 = addContact c2 contacts2
  let contacts4 = addContact c3 contacts3
  saveContacts "text.txt" contacts4
  printContacts contacts4



fun = do
   print("hello")