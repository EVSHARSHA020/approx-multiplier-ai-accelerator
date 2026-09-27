# Mitchell's Logarithmic Multiplier — Design Notes (P3)

## Overview
Implements Mitchell's approximate logarithmic multiplication algorithm
(Mitchell, 1962) for 8-bit unsigned integers. Converts multiplication
into addition in the log domain: log(A x B) = log(A) + log(B).

## Module Breakdown
1. leading_one_detector.v — finds position (0-7) of the highest '1' bit
   in an 8-bit input. Outputs `pos` and a `valid` flag (0 if input is zero).
2. log_approx.v — builds the approximate logarithm from `pos`:
   - characteristic (3 bits) = leading-1 position
   - mantissa (7 bits) = the bits below the leading 1, left-shifted to
     fill 7 bits, zero-padded on the right
3. log_adder.v — adds the two approximate logs (characteristic + mantissa)
   together, handling mantissa overflow as a carry into the characteristic.
4. log_decoder.v — converts the summed log back into the approximate
   product by building an 8-bit significand {1, mantissa} and shifting
   it based on the characteristic.
5. mitchell_multiplier.v — top-level module wiring all four blocks
   together, plus zero-detection: if either input is 0, output is forced
   to 0 regardless of the log-domain result (log(0) is undefined).

## Bit-width choices
- 8-bit inputs (a, b) chosen to directly match P1's exact multiplier
  baseline and P2's truncated multiplier, so all three designs can be
  fairly compared at synthesis stage.
- 7-bit mantissa chosen to match the input width minus the sign/leading
  bit, keeping datapath width consistent throughout.
- Output is 16 bits (8x8 multiplication can produce up to 16-bit results).

## Verification results (5 test cases, exact multiplication as reference)
| a   | b   | exact | approx | error   |
|-----|-----|-------|--------|---------|
| 15  | 3   | 45    | 44     | ~2.2%   |
| 44  | 44  | 1936  | 1792   | ~7.4%   |
| 200 | 1   | 200   | 200    | 0%      |
| 0   | 50  | 0     | 0      | 0%      |
| 100 | 100 | 10000 | 9216   | ~7.8%   |

These fall within the error bounds reported in Kim et al. (ASP-DAC 2018),
which found mean relative error ~3.77-3.87% and worst-case relative
error 11.11% for this design. A wider test set is needed for full MED/MRED
statistics — handed off to P4 for that analysis.

## Known limitation
This design does not yet include an error-compensation stage (mentioned
as a stretch goal in the project plan). Could be added later to reduce
mean error if time allows after core deliverables are complete.

## Reference
Kim, M.S., Del Barrio, A.A., Hermida, R., Bagherzadeh, N. (2018).
"Low-power Implementation of Mitchell's Approximate Logarithmic
Multiplication for Convolutional Neural Networks." ASP-DAC 2018.