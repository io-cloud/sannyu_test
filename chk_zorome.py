#!/bin/python

InputDataList = input().split(",")

for InputData in InputDataList:
    try:
        i = int(InputData)
    except ValueError:
        print("unmatch pattern: " + InputData)
        continue

    if len(InputData) == 3 and InputData[0] == InputData[1] == InputData[2]:
        print("zorome: " + InputData)
    elif len(InputData) == 3:
        print(InputData)
    else:
        print("unmatch pattern: " + InputData)
