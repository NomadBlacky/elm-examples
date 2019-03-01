module Example exposing (suite)

import Expect exposing (..)
import Fuzz exposing (..)
import Test exposing (..)



-- https://package.elm-lang.org/packages/elm-explorations/test/latest


suite : Test
suite =
    describe "The String module"
        [ describe "String.reverse"
            -- `describe` はネストできる
            [ test "回文には何も影響を与えない" <|
                \_ ->
                    let
                        palindrome =
                            "hannah"
                    in
                    Expect.equal palindrome (String.reverse palindrome)

            -- Expect.equal はパイプラインを使って書けるようになっている
            , test "文字列を反転する" <|
                \_ ->
                    "ABCDEFG"
                        |> String.reverse
                        |> Expect.equal "GFEDCBA"

            -- fuzz はランダムな入力値を自動生成してテストを実行してくれる
            -- ここではランダムな文字列を100回生成してテストを実行する
            , fuzz string "2度実行するともとの文字列に戻る" <|
                \randomlyGeneratedString ->
                    randomlyGeneratedString
                        |> String.reverse
                        |> String.reverse
                        |> Expect.equal randomlyGeneratedString
            ]
        ]
