module Text.Pandoc.Filters.PageBreak where

import Data.Text ( pack )
import Text.Pandoc.Definition
    ( Block(RawBlock, Para), Format(..), Inline(Str) )


latexFormat :: Format
latexFormat = Format $ pack "latex"

pagebreakBlock :: Block
pagebreakBlock = Para [Str $ pack "+++"]

fillerBlock :: Block
fillerBlock = Para [Str $ pack "+|+"]

separateLine :: String -> String
separateLine content = "\n" ++ content ++ "\n"

latexBlock :: String -> Block
latexBlock content = RawBlock latexFormat $ pack $ separateLine content

process :: Maybe Format -> Block -> Block
process (Just latexFormat) block
    | block == pagebreakBlock = latexBlock "\\clearpage"
    | block == fillerBlock = latexBlock "\\vfill"
process _ block = block
