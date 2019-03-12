module BasicTest exposing (suite)

import Expect exposing (..)
import Test exposing (..)



-- これはコメント
{- これもコメント -}
{- ! ドキュメントのためのコメント -}


suite : Test
suite =
    describe "Elmの基礎文法"
        [ describe "数値"
            [ test "加算" <|
                \_ -> Expect.equal (1 + 1) 2
            , test "減算" <|
                \_ -> Expect.equal (5 - 2) 3
            , test "乗算" <|
                \_ -> Expect.equal (5 * 5) 25
            , test "除算 (小数点以下は切り捨てられない!)" <|
                \_ -> (5 / 2) |> Expect.within (Absolute 0.000001) 2.5
            , test "除算 (小数点以下を切り捨てる)" <|
                \_ -> Expect.equal (5 // 2) 2
            , test "累乗" <|
                \_ -> Expect.equal (2 ^ 4) 16
            , test "余剰" <|
                \_ -> Expect.equal (remainderBy 3 5) 2
            ]
        , describe "文字列"
            [ test "文字列同士の連結" <|
                \_ -> Expect.equal ("Hello, " ++ "Elm!") "Hello, Elm!"
            , test "生文字列" <|
                \_ -> Expect.equal """one "two" three""" "one \"two\" three"
            , test "文字" <|
                -- シングルクオート
                \_ -> 'a' |> (\_ -> pass)
            ]
        , describe "真理値" <|
            [ test "真" <|
                \_ -> True |> (\_ -> pass)
            , test "偽" <|
                \_ -> False |> (\_ -> pass)
            , test "否定" <|
                \_ -> Expect.equal (not True) False
            , test "AND演算" <|
                \_ -> Expect.equal (True && False) False
            , test "OR演算" <|
                \_ -> Expect.equal (True || False) True
            ]
        , describe "値の比較" <|
            [ test "同値比較" <|
                \_ -> Expect.equal (1 == 1) True
            , test "同一でない" <|
                \_ -> Expect.equal (1 /= 1) False
            ]
        , describe "関数" <|
            [ test "関数の適用順序" <|
                -- 関数の適用は演算子より優先される
                \_ -> Expect.equal (1 + max 2 1 + 3) 6
            , test "関数を定義する" <|
                \_ ->
                    let
                        -- 関数名は小文字から始めて、キャメルケースにする。
                        isNegative n =
                            n < 0
                    in
                    Expect.equal (isNegative 10) False
            , test "複数の引数をとる関数" <|
                \_ ->
                    let
                        makeUrl scheme authority path =
                            scheme ++ "://" ++ authority ++ path
                    in
                    Expect.equal (makeUrl "https" "example.com" "/index.html") "https://example.com/index.html"
            , test "匿名関数" <|
                -- \引数名 引数名 .. -> 式
                \_ -> Expect.equal ((\n -> n < 0) -5.5) True
            , test "部分適用" <|
                \_ ->
                    let
                        makeUrl scheme authority path =
                            scheme ++ "://" ++ authority ++ path

                        -- 関数の一部に引数を渡すと関数が返る
                        makeUrl2 =
                            makeUrl "https" "example.com"
                    in
                    -- 残りの引数を適用する
                    Expect.equal (makeUrl2 "/index.html") "https://example.com/index.html"
            , test "演算子" <|
                \_ ->
                    let
                        -- 中間演算子は関数としても使うことができる
                        expect =
                            (+) 100 100

                        -- 部分適用も可能
                        x10 =
                            (*) 10
                    in
                    Expect.equal (x10 20) expect
            ]
        ]
