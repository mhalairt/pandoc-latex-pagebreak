module Main where

import Text.Pandoc.JSON ( ToJSONFilter(toJSONFilter) )
import Text.Pandoc.Filters.PageBreak ( process )


main :: IO ()
main = toJSONFilter process
