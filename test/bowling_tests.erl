-module(bowling_tests).
-include_lib("eunit/include/eunit.hrl").

simple_score_test()->
    Expect = 1,
    Result = bowling:compute_score("1"),
    ?assertEqual(Expect, Result).

double_score_test()->
    Expect = 3,
    Result = bowling:compute_score("12"),
    ?assertEqual(Expect, Result).

throws_test()->
    Expect = 6,
    Result = bowling:compute_score("1-23"),
    ?assertEqual(Expect, Result).

miss_test()->
    Expect = 0,
    Result = bowling:compute_score("-"),
    ?assertEqual(Expect, Result).

strike_test()->
    Expect = 10,
    Result = bowling:compute_score("X"),
    ?assertEqual(Expect, Result).

points_for_miss_should_be_0_test()->
    ?assertEqual(0,bowling:points($-)).
    
points_for_strike_should_be_10_test()->
    ?assertEqual(10,bowling:points($X)).

spare_followed_by_one_test()->
    Expect = 12,
    Result = bowling:compute_score("1/1"),
    ?assertEqual(Expect, Result).

spare_followed_by_six_test()->
    Expect = 22,
    Result = bowling:compute_score("3/6"),
    ?assertEqual(Expect, Result).

spare_followed_by_miss_test()->
    Expect = 16,
    Result = bowling:compute_score("3/-6"),
    ?assertEqual(Expect, Result).

strike_followed_by_two_values_test()->
    Expect = 26,
    Result = bowling:compute_score("X26"),
    ?assertEqual(Expect, Result).

strike_followed_by_a_miss_test()->
    Expect = 22,
    Result = bowling:compute_score("X-6"),
    ?assertEqual(Expect, Result).

strike_followed_by_miss_and_spare_test()->
    Expect = 42,
    Result = bowling:compute_score("X-/6"),
    ?assertEqual(Expect, Result).

miss_spare_strike_followed_by_miss_and_spare_test()->
    Expect = 62,
    Result = bowling:compute_score("-/X-/6"),
    ?assertEqual(Expect, Result).

strike_followed_by_number_miss_and_spare_test()->
    Expect = 38,
    Result = bowling:compute_score("X3/-8"),
    ?assertEqual(Expect, Result).

a_lot_of_different_combinations_test()->
    Expect = 102,
    Result = bowling:compute_score("-/X-/62X3/-8"),
    ?assertEqual(Expect, Result).
