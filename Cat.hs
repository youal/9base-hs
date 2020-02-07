-- {-# LANGUAGE OverloadedStrings #-}

import qualified System.Environment as E
-- import qualified Data.Text as T

import qualified Data.Foldable as F


--cat :: [String] -> T.Text -> IO T.Text
--cat args acc =
--        if null args
--        then do
--                return acc
--        else do
--                contents <- readFile $ head args
--                cat (tail args) (T.append acc $ T.pack contents)


--main = do
--        args <- E.getArgs
--        contents <-
--                if null args
--                then getContents >>= return . T.pack
--                else F.foldrM (\x acc -> do
--                                content <- readFile x
--                                return (T.append (T.pack content) acc))
--                                "" args
--                --else cat args ""
--        (putStr . T.unpack) contents
--
--
--main = do
--        args <- E.getArgs
--        contents <-
--                if null args
--                then getContents >>= return . T.pack
--                else cat args ""
--        (putStr . T.unpack) contents

main = do
        args <- E.getArgs
        if null args
        then getContents >>= putStr
        else F.traverse_ (\x -> readFile x >>= putStr) args
