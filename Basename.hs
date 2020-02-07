import Data.Text as T hiding (head, length, reverse, last, tail)
import qualified System.Environment as E


main :: IO ()
main = do
        args <- E.getArgs
        if length args < 1 || length args > 2
        then error "Wrong number of arguments: basename <file> [suffix]"
        else
                let
                        inp = head args
                        parsed_inp = T.pack (
                                        if last inp == '/'
                                        then reverse $ (tail (reverse inp))
                                        else inp)
                        filename = takeWhileEnd (/= '/') parsed_inp
                        striped_filname =
                                if length args == 2
                                then T.stripSuffix (T.pack $ args !! 1) filename
                                else Just filename
                        out =
                                case striped_filname of
                                        Nothing -> filename
                                        Just x -> x
                in
                        print out
