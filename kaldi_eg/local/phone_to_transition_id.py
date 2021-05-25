#!/usr/bin/env python
"""
解析 show-transitions 的输出，将其转换成 transition_id 到 phone 的映射。

eg:

Transition-state 1: phone = sil hmm-state = 0 pdf = 0
 Transition-id = 1 p = 0.755527 count of pdf = 38 [self-loop]
 Transition-id = 2 p = 0.01 count of pdf = 38 [0 -> 1]
 Transition-id = 3 p = 0.156316 count of pdf = 38 [0 -> 2]
 Transition-id = 4 p = 0.078158 count of pdf = 38 [0 -> 3]
Transition-state 2: phone = sil hmm-state = 1 pdf = 1
 Transition-id = 5 p = 0.890916 count of pdf = 11 [self-loop]
 Transition-id = 6 p = 0.0890916 count of pdf = 11 [1 -> 2]
 Transition-id = 7 p = 0.01 count of pdf = 11 [1 -> 3]
 Transition-id = 8 p = 0.01 count of pdf = 11 [1 -> 4]

to

sil_0_0 1 
sil_0_1 2 
sil_0_2 3 
sil_0_3 4 
sil_1_1 5 
sil_1_2 6 
sil_1_3 7 
sil_1_4 8 
"""

import sys


def main():
    phone = ""
    state = 0
    pdf = 0
    for line in sys.stdin:
        line = line.strip()
        if line.startswith("Transition-state"):
            phone, state, pdf = parse_transition_state(line)
        elif line.startswith("Transition-id"):
            transition_id, to_state = parse_transition_id(line)
            if to_state is None:
                to_state = state
            print(f"{phone}_{state}_{to_state} {transition_id}")
            

def parse_transition_state(s):
    parts = s.split(" ")
    return (parts[4], parts[7], parts[10])


def parse_transition_id(s):
    parts = s.split(" ")
    to_state = None
    if parts[-1][:-1].isnumeric():
        to_state = parts[-1][:-1]
    return (parts[2], to_state)


if __name__ == "__main__":
    main()
