module Main where
import Contact
import ContactManager

main :: IO ()
main = do
  let m = Contact 23 "David" "notes"
  let g = maybe 23
  putStrLn "hello world"


instance ContactManager ManagerImpl where
    createContact x = ManagerImpl x