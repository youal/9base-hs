import qualified System.Environment as E


main = do
        args <- E.getArgs
        if length args >= 1 && head args == "-n"
        then putStr $ unwords (tail args)
        else putStrLn $ unwords args
