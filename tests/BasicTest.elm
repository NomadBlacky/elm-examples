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
        ]
