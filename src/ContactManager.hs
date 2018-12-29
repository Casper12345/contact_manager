module ContactManager where
import Contact

addContact :: Contact -> [Contact] -> [Contact]
addContact contact xs = contact : xs

printContacts :: [Contact] -> IO()
printContacts contacts = print(contacts)

saveContacts :: FilePath -> [Contact] -> IO()
saveContacts path contacts = writeFile path (createHeader ++ (createString contacts ""))

createString :: [Contact] -> String -> String
createString (x : []) acc = (createLine x) ++ acc
createString (x : xs) acc = createString xs ((createLine x) ++ acc)

createLine :: Contact -> String
createLine (Contact a b c) = (show a) ++ ", " ++ (show b) ++ ", " ++ (show c) ++ "\n"

createHeader :: String
createHeader = "id, name, notes \n"