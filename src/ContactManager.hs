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

mapper :: String -> [String]
mapper x = splitting x "" []

splitting :: String -> String -> [String] -> [String]
splitting [] acc acc2 = acc2 ++ (acc : [])
splitting (x : xs) acc acc2 = if(x == ',') then splitting xs "" (acc2 ++ acc : [])  else splitting xs (acc ++ (x : [])) acc2

trim :: String -> String
trim (x : xs) = if(x == ' ') then trim xs else xs

trimSpace :: String -> String
trimSpace x = reverse (trim (reverse (trim x)))

toContact :: [String] -> Contact
toContact x = Contact (read (head x) :: Int) (trimSpace(x !! 1 :: String)) (trimSpace(x !! 2 :: String))

readContacts :: FilePath -> IO([Contact])
readContacts path = do
    content <- readFile path
    let splitOnCommas = map mapper (tail (lines content))
    let contacts = map toContact splitOnCommas
    return contacts



