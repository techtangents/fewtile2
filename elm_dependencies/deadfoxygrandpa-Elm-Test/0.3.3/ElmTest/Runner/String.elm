module ElmTest.Runner.String (runDisplay, run) where

{-| Run a test suite and display it as a string.

# Run
@docs runDisplay

-}

import ElmTest.Run as Run
import ElmTest.Test (..)

-- | Some pretty printing stuff. Should be factored into a pretty printing library.
vcat : [String] -> String
vcat = concat . intersperse "\n"

replicate : Int -> Char -> String
replicate n c = let go n = if n <= 0
                           then []
                           else c :: go (n - 1)
                in String.fromList . go <| n

indent : Int -> String -> String
indent n = let indents = replicate n ' '
           in vcat . map (String.append indents) . String.lines

pretty : Int -> Run.Result -> [(String, Run.Result)]
pretty n result =
    let passed = Run.pass result
    in  case result of
            Run.Pass name     -> [(indent n <| name ++ ": passed.", result)]
            Run.Fail name msg -> [(indent n <| name ++ ": FAILED. " ++ msg, result)]
            Run.Report name r -> let msg = "Test Suite: " ++ name ++ ": "
                                        ++ if passed then "all tests passed" else "FAILED"
                                     allPassed = Run.failedTests result == 0
                                     subResults = if allPassed
                                                  then []
                                                  else concatMap (pretty (n + 2)) r.results
                                 in  (indent n msg, result) :: subResults

run : Test -> [(String, Run.Result)]
run t =
    let result = Run.run t
        tests = case t of
                    TestCase n a -> [TestCase n a]
                    Suite n ts -> ts
        passedTests'  = Run.passedTests result
        passedSuites' = Run.passedSuites result
        failedTests'  = Run.failedTests result
        failedSuites' = Run.failedSuites result
        summary = vcat . map (indent 2) <| [
                    show (numberOfSuites t) ++ " suites run, containing " ++ show (numberOfTests t) ++ " tests"
                  , if failedTests' == 0
                    then "All tests passed"
                    else show passedSuites' ++ " suites and " ++ show passedTests' ++ " tests passed"
                  , if failedTests' == 0
                    then ""
                    else show failedSuites' ++ " suites and " ++ show failedTests' ++ " tests failed"
                  ]
        --- TODO: implement results printing
        allPassed   = if failedTests' == 0 then Run.Pass "" else Run.Fail "" ""
        results' = case allPassed of
                      Run.Pass _ -> [("", allPassed)]
                      _          -> pretty 0 result
    in (summary, allPassed) :: results'

{-| Runs a test or test suite. Returns the report as a String -}
runDisplay : Test -> String
runDisplay t =
    let ((summary, _) :: results) = run t
    in  vcat <| (summary ++ "\n") :: map fst results
