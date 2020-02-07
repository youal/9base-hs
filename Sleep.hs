import qualified System.Environment as E
import qualified Control.Concurrent as C


stoint :: String -> Either String Int
stoint arg =
        case reads arg :: [(Int, String)] of
        {
                p @ ((x, "") :xs)
                        -> Right $ (fst . head) p;
                _
                        -> Left
                                $ "Can not parse the argument."
                                ++ " Must contain only numbers.";
        }


iter :: Int -> Int -> IO ()
iter until done =
        do
                if done == until
                then return ()
                else C.threadDelay 1000000 >> iter until (done + 1)


main = do
        args <- E.getArgs
        if length args /= 1
        then error "Expects exactly one argument."
        else do
                let arg = stoint $ head args
                case arg of
                        {
                        Left x -> error x;
                        Right x -> iter x 0;
                        }
